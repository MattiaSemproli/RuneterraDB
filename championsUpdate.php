<?php
    require_once 'connect.php';

    $conn = new mysqli($servername, $username, $password, $dbname);
    if (!$conn) {
        die("Connessione al database fallita: " . mysqli_connect_error());
    }

    $champions = json_decode($json)->data;
    $championArray = array();
    
    foreach ($champions as $champion) {
        $championData = array(
            'key' => $champion->key,
            'name' => $champion->name,
            'title' => $champion->title,
            'tags' => $champion->tags,
            'partype' => $champion->partype,
        );
        array_push($championArray, $championData);
    }

    mysqli_close($conn);
?>