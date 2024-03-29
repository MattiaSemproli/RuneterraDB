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

    if($canPlay == 'true') {
        $data = $_GET["data"];
        $jsonData = json_decode($data, true);
        
        $user = $_SESSION['username'];
        $toGuess = $jsonData[0];
        $tries = $jsonData[1];
        $date = date("Y-m-d");
    
        $sql = "INSERT INTO game (numberOfTry, date, nameToGuess, username) VALUES ($tries, '$date', '$toGuess', '$user')";
    
        if ($conn->query($sql) === TRUE) {
            if($tries <= 5) {
                $pts = 5;
            } else if($tries <= 10) {
                $pts = 3;
            } else if($tries <= 15) {
                $pts = 1;
            } else {
                $pts = 0;
            }
            $sql2 = "UPDATE summoner
                     SET championsGuessed = championsGuessed + 1, score = score + $pts
                     WHERE username = '$user'";
    
            $sql7 = "UPDATE summoner
                     SET summoner.rank = (SELECT MAX(`rank`.idRank)
                                         FROM `rank`
                                         WHERE `rank`.rankGoal <= summoner.score)
                     WHERE summoner.username = '$user'";
            $conn->query($sql7);
    
            if ($conn->query($sql2) === TRUE) {
                $sql3 = "SELECT championsGuessed
                         FROM summoner
                         WHERE username = '$user'";
                $numberOfChsGuessed = $conn->query($sql3)->fetch_array()[0];
                $sql4 = "SELECT goal
                         FROM mission
                         WHERE idMission = (SELECT MIN(idMission) 
                                            FROM complete 
                                            WHERE isCompleted = 0 
                                            AND username = '$user')";
                $goal = $conn->query($sql4)->fetch_array()[0];
                if($numberOfChsGuessed == $goal) {
                    $sql5 = "UPDATE complete
                             SET isCompleted = 1
                             WHERE idMission = (
                                 SELECT idMission
                                 FROM (
                                     SELECT idMission
                                     FROM complete
                                     WHERE isCompleted = 0
                                     AND username = '$user'
                                     ORDER BY idMission
                                     LIMIT 1
                                 ) AS subquery
                             )
                             AND username = '$user'";
                    
                    $conn->query($sql5);
                    $sql6 = "UPDATE summoner
                             SET score = score + (SELECT points
                                                  FROM mission
                                                  WHERE idMission = (SELECT MAX(idMission)
                                                                     FROM complete
                                                                     WHERE isCompleted = 1 
                                                                     AND username = '$user'))
                             WHERE username = '$user'";
                    if ($conn->query($sql6) === TRUE) {
                        $sql7 = "UPDATE summoner
                                 SET summoner.rank = (SELECT MAX(`rank`.idRank)
                                                     FROM `rank`
                                                     WHERE `rank`.rankGoal <= summoner.score)
                                 WHERE summoner.username = '$user'";
                        $conn->query($sql7);
                        header("Location: ../html/win.html");
                    } else {
                        header("Location: ../html/gtc.html");
                        die();
                    } 
                } else {
                    header("Location: ../html/win.html");
                }
            } else {
                header("Location: ../html/gtc.html");
                die();
            }
        } else {
            header("Location: ../html/gtc.html");
            die();
        }
    
        /**
         * Close the connection.
         */ 
        mysqli_close($conn);
    } else {
        header("Location: ../html/win.html");
        die();
    }
?>