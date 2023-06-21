<?php  
    if(isset($_POST['summonerName']) && isset($_POST['team']) && isset($_COOKIE['user'])) {
        $sName = $_POST['summonerName'];
        $team = strtolower(str_replace(' ', '', $_POST['team']));
        $user = $_COOKIE['user'];

        /**
         * Require the file with connection variables.
         */ 
        require_once 'connect.php';

        $sql = "INSERT INTO summoner (username, summonerName, team) 
                VALUES ('$user', 
                        '$sName',
                        (SELECT team.idTeam 
                         FROM team 
                         WHERE LOWER(REPLACE(team.nameTeam, ' ', '')) = '$team'))";

        if ($conn->query($sql) === TRUE) {
            setcookie("user", "", time() - 3600);
            header("Location: ../html/login.html");
        } else {
            header("Location: ../html/profileCreation.html");
            die();
        }

        /**
         * Close the connection.
         */ 
        mysqli_close($conn);
    } else {
        header("Location: ../html/registration.html");
    }
?>