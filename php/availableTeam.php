<?php
    function loadAvailableTeam() {
        /**
         * Require the file with connection variables.
         */ 
        require_once 'connect.php';
        
        $sql = "SELECT team.nameTeam AS name
                FROM team
                LEFT JOIN summoner ON summoner.team = team.idTeam
                GROUP BY team.nameTeam
                HAVING COUNT(summoner.team) < 5 OR COUNT(summoner.team) IS NULL";

        $result = $conn->query($sql);
        $teams = array();

        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                array_push($teams, $row["name"]);
            }
        }
        
        /**
         * Close the connection.
         */ 
        mysqli_close($conn);

        return $teams;
    }

    header('Content-Type: application/json');
    echo json_encode(loadAvailableTeam());
?>