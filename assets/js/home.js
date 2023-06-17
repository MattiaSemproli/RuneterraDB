window.addEventListener('load', function() {
    var xhr = new XMLHttpRequest();
    xhr.open('GET', '../php/whoAreYou.php', true);
    xhr.onload = function() {
        if (xhr.status === 200) {
            var username = xhr.responseText;
            displayUsername(username);
        } else {
            console.log('Error in the request: ' + xhr.status);
        }
    };
    xhr.send();
});

function displayUsername(username) {
    var header = document.getElementById('menu_nav');
    var greeting = (username !== '') ? 'Logged in as: ' + username : 'Logged as Guest';
    header.insertAdjacentHTML('afterbegin', greeting);
}