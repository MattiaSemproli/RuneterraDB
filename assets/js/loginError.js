window.onload = function() {
    var referrer = document.referrer;
    var urlParams = new URLSearchParams(window.location.search);
    var error = urlParams.get('error');
    var hasDisplayedError = urlParams.get('displayedError');
    
    if (error && referrer.includes("login.html?error=true") && !hasDisplayedError) {
        var errorDiv = document.createElement("div");
        errorDiv.textContent = "Username or password incorrect!";
        errorDiv.style.color = "red";
        document.getElementById("password").parentNode.insertBefore(errorDiv, document.getElementById("password").nextSibling);
        
        // Add a query parameter to the URL to prevent displaying the error message on reload
        var newUrl = window.location.href + (window.location.search ? '&' : '?') + 'displayedError=true';
        window.history.replaceState({}, '', newUrl);
    }
}