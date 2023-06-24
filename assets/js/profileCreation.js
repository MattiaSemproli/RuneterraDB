window.addEventListener('load', function() {
    var xhr = new XMLHttpRequest();
    xhr.open('GET', '../php/availableTeam.php', true);
    xhr.onload = function() {
        if (xhr.status === 200) {
            var teams = JSON.parse(xhr.responseText);
            document.cookie = "teams=" + JSON.stringify(teams) + "; path=/html/profileCreation.html;";
            process(teams);
        } else {
            console.log('Error in the request: ' + xhr.status);
        }
    };
    xhr.send();
});

function process(teams) {
    var t = document.getElementById('team');
    if(teams.length == 0) {
        t.setAttribute('placeholder', 'No teams available');
    } else {	
        var availableTeamsPH = 'Available teams: ' + teams.join(', '); //PH = placeholder.
        t.setAttribute('placeholder', availableTeamsPH);
    }
}

const input = document.getElementById('team');
const submitBtn = document.getElementById('createProfile');

input.addEventListener('input', () => {
    var cookieValue = document.cookie
                              .split('; ')
                              .find(cookie => cookie.startsWith('teams='))
                              ?.split('=')[1];
    var freeTeams = Array();
    if(cookieValue)
        JSON.parse(cookieValue).map(team => team.toLowerCase().replace(/\s+/g, '')).forEach(element => {	
            freeTeams.push(element);
        });

    if (freeTeams.includes(input.value.toLowerCase().replace(/\s+/g, ''))) {
        submitBtn.disabled = false;
    } else {
        submitBtn.disabled = true;
    }
});

//clear the cookie before leaving the page.
window.onbeforeunload = function() {
    document.cookie = "teams=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/html/profileCreation.html;";
};