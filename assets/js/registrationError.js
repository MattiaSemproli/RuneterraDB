window.onload = function() {
    var urlParams = new URLSearchParams(window.location.search);
    var error = urlParams.get('error');
    
    if (error) {
        document.getElementById("usernameLabel").innerHTML = "username: <span id='errorSpan'>username already exists</span>";
        document.getElementById("errorSpan").classList.add("errorSpan");
        document.getElementById("username").style.border = "2px solid red";
        
        // Add a query parameter to the URL to prevent displaying the error message on reload
        window.history.replaceState({}, '', '../../html/registration.html');
    }
}

// This script is used to check if the password and confirm password fields match.
const pssw = document.getElementById('password');
const confirmPssw = document.getElementById('confirmPassword');
const submitBtn = document.getElementById('register');

confirmPssw.addEventListener('input', () => {
    if (pssw.value === confirmPssw.value) {
        pssw.style.border = '2px solid green';
        confirmPssw.style.border = '2px solid green';
        submitBtn.disabled = false;
    } else {
        pssw.style.border = '2px solid red';
        confirmPssw.style.border = '2px solid red';
        submitBtn.disabled = true;
    }
});