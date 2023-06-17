window.addEventListener('load', function() {
    var xhr = new XMLHttpRequest();
    xhr.open('GET', '../php/menuGenerator.php', true);
    xhr.onload = function() {
        if (xhr.status === 200) {
            var items = JSON.parse(xhr.responseText);
            addItems(items);
        } else {
            console.log('Error in the request: ' + xhr.status);
        }
    };
    xhr.send();
});

function addItems(items) {
    var ul = document.querySelector('.links');
    items.forEach(function(item) {
        var li = document.createElement('li');
        li.innerHTML = item;
        ul.appendChild(li);
    });
}