<?php
    require_once("connect.php");
    
    session_start();
    $currentUser = $_SESSION['username'];
    $currentDate = date("Y-m-d");

    $sql = "SELECT game.date
            FROM game
            WHERE username = '$currentUser'
            AND game.date = '$currentDate'
            GROUP BY game.date
            HAVING COUNT(*) < 5";

    if ($result = mysqli_query($conn, $sql)) {
        if(mysqli_num_rows($result) > 0) {
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