<?php
    //php variables for db connection.h
    $dbservername = "localhost";
    $dbusername = "root";
    $dbpassword = "MpMs";
    $dbname = "runeterradb";

    /**
     * Open a connection.
     */
    $conn = new mysqli($dbservername, $dbusername, $dbpassword, $dbname);
    if (!$conn) {
        die("Connessione al database fallita: " . mysqli_connect_error());
    }
?>