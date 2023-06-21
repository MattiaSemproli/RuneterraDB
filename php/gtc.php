<?php
    session_start();
    if(isset($_SESSION['username'])) {
        header("Location: ../php/checkLimitTries.php");
    } else {
        header("Location: ../html/login.html");
    }
?>