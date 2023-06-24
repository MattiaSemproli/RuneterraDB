<?php
    /**
     * Require the file with connection variables.
     */ 
    require_once 'connect.php';

    $summoners = "SELECT summoner.summonerName AS name,
                         summoner.score,
                         summoner.championsGuessed AS guesses,
                         team.shortTeam,
                         `rank`.rankValue
                  FROM summoner
                  JOIN team ON summoner.team = team.idTeam
                  JOIN `rank` ON summoner.rank = `rank`.idRank
                  ORDER BY summoner.score DESC";

    $sql = "UPDATE team
            JOIN (SELECT team.idTeam, SUM(summoner.score) AS tot
                  FROM summoner
                  JOIN team ON summoner.team = team.idTeam
                  GROUP BY team.idTeam) AS res
            ON team.idTeam = res.idTeam
            SET team.scoreTeam = res.tot";
    $conn->query($sql);

    $teams = "SELECT team.nameTeam AS team, team.shortTeam AS short, team.scoreTeam AS score
              FROM team
              ORDER BY team.scoreTeam DESC";

    $resultS = $conn->query($summoners);
    $s = array();
    
    $resultT = $conn->query($teams);
    $t = array();
    
    if ($resultS->num_rows > 0) {
        while($row = $resultS->fetch_assoc()) {
            array_push($s, array("name" => $row["name"],
                                 "score" => $row["score"],
                                 "guesses" => $row["guesses"],
                                 "team" => $row["shortTeam"],
                                 "rank" => $row["rankValue"]));
        }
    }
    if ($resultT->num_rows > 0) {
        while($row = $resultT->fetch_assoc()) {
            array_push($t, array("team" => $row["team"],
                                 "short" => $row["short"],
                                 "score" => $row["score"]));
        }
    }

    /**
     * Close the connection.
     */ 
    mysqli_close($conn);

    header('Content-Type: application/json');
    echo (json_encode(array("summoner" => $s, "team" => $t)));
?>