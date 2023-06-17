<?php
    session_start();
    if(isset($_SESSION['username'])) {
        header("Location: ../html/gtc.html");
    } else {
        header("Location: ../html/login.html");
    }
?>