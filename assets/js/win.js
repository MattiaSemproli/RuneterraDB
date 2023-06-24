const paragraph = document.getElementById('lol');

window.addEventListener('load', function() {
	var xhr = new XMLHttpRequest();
	xhr.open('GET', '../php/checkLimitTries.php', true);
	xhr.onload = function() {
		if (xhr.status === 200) {
			if(xhr.responseText == 'true') {
                paragraph.textContent = 'You WON GGWP!';
            } else {
                paragraph.textContent = 'You won!';
                const text = document.createElement('div');
                text.textContent = 'but you are out of tries! Come back tomorrow for more points!';
                text.style.textAlign = 'center';
                text.id = 'lol';
                text.style.removeProperty('font-size');
                paragraph.parentNode.insertAdjacentElement('beforeend', text);
            }
		} else {
			console.log('Errore nella richiesta: ' + xhr.status);
		}
	};
	xhr.send();
});