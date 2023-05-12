window.onload = function() {
    var urlParams = new URLSearchParams(window.location.search);
    var error = urlParams.get('error');
    
    if (error) {
        document.getElementById("password").style.border = "2px solid red";
        document.getElementById("username").style.border = "2px solid red";
        
        // Add a query parameter to the URL to prevent displaying the error message on reload
        window.history.replaceState({}, '', '../../html/login.html');
    }
}