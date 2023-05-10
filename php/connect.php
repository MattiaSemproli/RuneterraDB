<?php
    //php variables for db connection.h
    $servername = "localhost";
    $username = "root";
    $password = "MpMs";
    $dbname = "runeterradb";

    /**
     * Open a connection.
     */
    $conn = new mysqli($servername, $username, $password, $dbname);
    if (!$conn) {
        die("Connessione al database fallita: " . mysqli_connect_error());
    }
?>