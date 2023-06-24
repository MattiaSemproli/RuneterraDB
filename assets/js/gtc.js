window.addEventListener('load', function() {
    var loggedUser = new XMLHttpRequest();
    loggedUser.open('GET', '../php/whoAreYou.php', true);
    loggedUser.onload = function() {
        if (loggedUser.status === 200) {
            sessionStorage.setItem('logged', loggedUser.responseText);
            if(sessionStorage.getItem('logged') === '') {
                window.location.href = 'login.html';
            }
        } else {
            console.log('Error in the request: ' + loggedUser.status);
        }
    };
    loggedUser.send();
    var xhr = new XMLHttpRequest();
    xhr.open('GET', '../php/getChampionWiki.php', true);
    xhr.onload = function() {
        if (xhr.status === 200) {
            var chs = JSON.parse(xhr.responseText);
            if (!document.cookie.includes(sessionStorage.getItem('logged') + 'randomChamp')) {
                extractRandomChampion(chs);
                generateChampionNamesCookie(chs);
                localStorage.removeItem(sessionStorage.getItem('logged') + 'tagSaved');
            }
            loadChsOptions();
            if(localStorage.getItem(sessionStorage.getItem('logged') + 'tagSaved') !== null) {
                var tags = localStorage.getItem(sessionStorage.getItem('logged') + 'tagSaved').split(',,');
                for(var i = 0; i < tags.length; i++) {
                    const newTag = document.createElement('li');
                    newTag.innerHTML += tags[i] + (i != tags.length - 1 ? ', ' : '');
                    champsTyped.prepend(document.createElement('br'));
                    champsTyped.prepend(newTag);
                    champsTyped.prepend(document.createElement('br'));
                }
            }
        } else {
            console.log('Error in the request: ' + xhr.status);
        }
    };
    xhr.send();
});

function extractRandomChampion(chs) {
    var rndId = Math.floor(Math.random() * chs.length);
    document.cookie = sessionStorage.getItem('logged') + "randomChamp=" + chs[rndId] + "; expires=" + getTomorrowDate() + "; path=/html/gtc.html";
}

function generateChampionNamesCookie(chs) {
    var nameList = Array();
    chs.forEach(element => {
        nameList.push(element[0]);
    });
    document.cookie = sessionStorage.getItem('logged') + "nameChs=" + JSON.stringify(nameList) + "; expires=" + getTomorrowDate() + "; path=/html/gtc.html";
} 

function loadChsOptions() {
    var cookieValue = getRightCookie('nameChs');
    var options = Array();
    if(cookieValue) {
        JSON.parse(cookieValue).forEach(element => {	
            options.push(element);
        });
    }

    while (champsList.firstChild) {
        champsList.removeChild(champsList.firstChild);
    }

    options.forEach(option => {
        const newOption = document.createElement('option');
        newOption.value = option;
        champsList.appendChild(newOption);
    });
}

const form = document.querySelector('form');
const champsList = document.getElementById('champion-options');
const champsTyped = document.getElementById('champion-guessed');
const input = document.getElementById('champion-name');
const submitBtn = document.getElementById('submit-Button');

form.addEventListener('submit', event => {
    event.preventDefault();

    var toGuess = getRightCookie('randomChamp').split(',');
    var guess = input.value.toLowerCase().split(' ');
    for (var i = 0; i < guess.length; i++) {
        guess[i] = guess[i].charAt(0).toUpperCase() + guess[i].slice(1);
    }
    var guess = guess.join(' ');

    var cookieValue = getRightCookie('nameChs');
    var chsNames = Array();
    if(cookieValue) {
        JSON.parse(cookieValue).forEach(element => {
            if(element != guess) {
                chsNames.push(element);
            }
        });
    }
    document.cookie = sessionStorage.getItem('logged') + "nameChs=" + JSON.stringify(chsNames) + "; expires=" + getTomorrowDate() + "; path=/html/gtc.html";

    var xhr = new XMLHttpRequest();
    xhr.open('GET', '../php/requestGuess.php?n=' + encodeURIComponent(guess), true);
    xhr.onload = function() {
        if (xhr.status === 200) {
            var x = JSON.parse(xhr.responseText);
            const newChampItem = document.createElement('li');
            for (var i = 0; i < x.length; i++) {
                if (x[i] === toGuess[i]) {
                    newChampItem.innerHTML+=('<span style="color: green">' + x[i] + (i == x.length - 1 ? '</span>'
                                                                                                       : '</span>, '));
                } else {
                    newChampItem.innerHTML+=('<span style="color: red">' + x[i] + (i == x.length - 1 ? '</span>'
                                                                                                     : '</span>, '));
                }
            }
            champsTyped.prepend(document.createElement('br'));
            champsTyped.prepend(newChampItem);
            champsTyped.prepend(document.createElement('br'));
            form.reset();
            loadChsOptions();
            submitBtn.disabled = true;

            if(localStorage.getItem(sessionStorage.getItem('logged') + 'tagSaved') === null)
                localStorage.setItem(sessionStorage.getItem('logged') + 'tagSaved', newChampItem.innerHTML);
            else
                localStorage.setItem(sessionStorage.getItem('logged') + 'tagSaved', localStorage.getItem(sessionStorage.getItem('logged') + 'tagSaved') + ',,' + newChampItem.innerHTML);

            if (x[0] === toGuess[0]) {
                document.cookie = sessionStorage.getItem('logged') + "randomChamp=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/html/gtc.html";
                document.cookie = sessionStorage.getItem('logged') + "nameChs=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/html/gtc.html";
                localStorage.removeItem(sessionStorage.getItem('logged') + 'tagSaved');
                var data = Array();
                data.push(toGuess[0]);
                data.push(champsTyped.getElementsByTagName('li').length);
                window.location.href = '../php/win.php?data=' + encodeURIComponent(JSON.stringify(data));
            }
        } else {
            console.log('Error in the request: ' + xhr.status);
        }
    };
    xhr.send();
});

input.addEventListener('input', () => {
    var cookieValue = getRightCookie('nameChs');
    var options = Array();
    if(cookieValue) {
        JSON.parse(cookieValue).forEach(element => {	
            options.push(element.toLowerCase());
        });
    }
    if (options.includes(input.value.toLowerCase())) {
        submitBtn.disabled = false;
    } else {
        submitBtn.disabled = true;
    }
});

function getRightCookie(cookieName) {
    return document.cookie
                   .split('; ')
                   .find(cookie => cookie.startsWith(sessionStorage.getItem('logged') + cookieName + '='))
                   ?.split('=')[1];
}

function getTomorrowDate() {
    var tomorrow = new Date();
    tomorrow.setDate(new Date().getDate() + 1);
    tomorrow.setHours(0, 0, 0, 0);
    return tomorrow.toUTCString();
}

window.addEventListener('beforeunload', function() {
    sessionStorage.clear();
});