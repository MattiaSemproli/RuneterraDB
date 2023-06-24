const leftBox = document.getElementById('summonerTableBody');
const rightBox = document.getElementById('teamTableBody');

window.addEventListener('load', function() {
	var xhr = new XMLHttpRequest();
	xhr.open('GET', '../php/getRankings.php', true);
	xhr.onload = function() {
		if (xhr.status === 200) {
			var res = JSON.parse(xhr.responseText);
            var summoner = res['summoner'];
            var team = res['team'];
            loadRankings(summoner, team);
		} else {
			console.log('Error in the request: ' + xhr.status);
		}
	};
	xhr.send();
});

function loadRankings(summoner, team) {
    load(summoner, leftBox);
    load(team, rightBox);
}

function load(val, box) {
    val.forEach((element, index) => {
        const newRow = document.createElement('tr');
        Object.entries(element).forEach(([key, value]) => {
            const newCell = document.createElement('td');
            newCell.textContent = value;
            newRow.appendChild(newCell);
        });
        box.appendChild(newRow);
    });
}