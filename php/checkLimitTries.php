<?php
    require_once("connect.php");
    
    session_start();
    $currentUser = $_SESSION['username'];
    $currentDate = date("Y-m-d");

    $sql = "SELECT COUNT(game.date) AS numberOfGames
            FROM game
            WHERE username = '$currentUser'
            AND game.date = '$currentDate'
            GROUP BY game.date";

    if ($result = mysqli_query($conn, $sql)) {
        $value = $result->fetch_assoc()['numberOfGames'];
        if($value < 5 || $result->num_rows < 1) {
            $canPlay = 'true';
        } else {
            $canPlay = 'false';
        }
    }

    /**
     * Close the connection.
     */ 
    mysqli_close($conn);

    echo $canPlay;
?>