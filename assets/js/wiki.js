// Autore: Mattia Semproli Versione: 1.0.0 Data: 11/05/2023
const champsList = document.getElementById('championsBox');
window.addEventListener('load', function() {
	var xhr = new XMLHttpRequest();
	xhr.open('GET', '../php/getChampionWiki.php', true);
	xhr.onload = function() {
		if (xhr.status === 200) {
			var data = JSON.parse(xhr.responseText);
			load(data);
		} else {
			console.log('Errore nella richiesta: ' + xhr.status);
		}
	};
	xhr.send();
});
function load(data) {
	for (var i = 0; i < data.length; i++) {
		(function(){
			var singleData = data[i];
			var box = document.createElement("div");
			var name = document.createElement("div");
			var item = new Image();
			var imageUrl = "../sources/ChampionsIcon/"+ singleData[0].replaceAll(' ','') +"_0.jpg";
			name.textContent = singleData[0];
			name.classList.add("championsName");
			item.classList.add("Icon");
			item.src = imageUrl;
			
			item.onclick = function() {
				icon();
				name();
				data();
				getChampionStats();
				getChampionLore();
				function icon() {
					var iconBox = document.getElementById("championsIcon");
					var champIcon = new Image();
					iconBox.classList.add("subBox");
					champIcon.classList.add("cIcon");
					champIcon.src = imageUrl;
					removeAllChildNodes(iconBox);
					iconBox.appendChild(champIcon);
				}
				
				function name() {
					var nameBox = document.getElementById("championsName");
					nameBox.classList.add("subBox");
					removeAllChildNodes(nameBox);
					for (var i = 0; i < 2; i++) {
						var champName = document.createElement("div");
						champName.textContent = singleData[i];
						nameBox.appendChild(champName);
					}
				}
				function data() {
					var dataBox = document.getElementById("championsData");
					dataBox.classList.add("subBox");
					removeAllChildNodes(dataBox);
					for (var i = 2; i < singleData.length; i++) {
						var champData = document.createElement("div");
						champData.textContent = singleData[i];
						dataBox.appendChild(champData);
					}
				}
				function attributes(stats) {
					var attributesBox = document.getElementById("championsAttributes");
					attributesBox.classList.add("subBox");
					removeAllChildNodes(attributesBox);
					Object.keys(stats).forEach(key => {
						var champAttribute = document.createElement("div");
						champAttribute.textContent = key + ": " + stats[key];
						attributesBox.appendChild(champAttribute);
					});
				}
				function nickname(nick) {
					var nicknameBox = document.getElementById("championsNickname");
					nicknameBox.classList.add("subBox");
					var champNickname = document.createElement("div");
					champNickname.textContent = nick;
					removeAllChildNodes(nicknameBox);
					nicknameBox.appendChild(champNickname);
				}
				function lore(bio) {
					var loreBox = document.getElementById("championsLore");
					loreBox.classList.add("subBox");
					var champLore = document.createElement("div");
					champLore.textContent = bio;
					removeAllChildNodes(loreBox);
					loreBox.appendChild(champLore);
				}
				function getChampionStats() {
					var xhr = new XMLHttpRequest();
					xhr.open("GET", "../php/getChampionStats.php?champion=" + encodeURIComponent(singleData[0]), true);
					xhr.onload = function() {
						if (xhr.status === 200) {
							var stats = JSON.parse(xhr.responseText);	
							attributes(stats);
						} else {
							console.log('Errore nella richiesta: ' + xhr.status);
						}
					};
					xhr.send();
				}
				function getChampionLore() {
					var xhr = new XMLHttpRequest();
					xhr.open("GET", "../php/getChampionLore.php?champion=" + encodeURIComponent(singleData[0]), true);
					xhr.onload = function() {
						if (xhr.status === 200) {
							var lor = JSON.parse(xhr.responseText);	
							nickname(lor['nickname']);
							lore(lor['bio']);										
						} else {
							console.log('Errore nella richiesta: ' + xhr.status);
						}
					};
					xhr.send();
				}
				function removeAllChildNodes(parent) {
					while (parent.hasChildNodes()) {
						parent.removeChild(parent.childNodes[0]);
					}
				}
			}
		
			item.onmouseover = function() {
				this.style.opacity = ".4";
				name.style.opacity = "1";
			};
			item.onmouseout = function() {
				this.style.opacity = "1";
				name.style.opacity = "0";
			};
			box.appendChild(name);
			box.appendChild(item);
			champsList.appendChild(box);
		})();
	}
}