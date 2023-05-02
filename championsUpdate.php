<?php
    require_once 'connect.php';

    $conn = new mysqli($servername, $username, $password, $dbname);

    $champions = json_decode($json)->data;

    $championArray = array();
    
    foreach ($champions as $champion) {
        array_push($championArray, $champion);
    }
?>