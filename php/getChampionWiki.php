<?php
    /**
     * Require the file with connection variables.
     */ 
    require_once 'connect.php';

    $sql = "SELECT champion.name AS name, 
                   gender.genderValue AS gender, 
                   role.roleValue AS role, 
                   species.speciesValue AS species, 
                   resource.resourceValue AS resource, 
                   attack.attackValue AS attackType, 
                   region.name AS region
            FROM champion
            JOIN gender ON champion.gender = gender.idGender
            JOIN role ON champion.role = role.idRole
            JOIN species ON champion.species = species.idSpecies
            JOIN resource ON champion.resource = resource.idResource
            JOIN attack ON champion.attack = attack.idAttack
            JOIN region ON champion.region = region.idRegion";

    $result = $conn->query($sql);
    $champions = array();

    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            array_push($champions, [$row["name"],
                                    $row["gender"],
                                    $row["role"],
                                    $row["species"],
                                    $row["resource"],
                                    $row["attackType"],
                                    $row["region"]]);
        }
    } else {
        echo "0 results";
    }

    /**
     * Close the connection.
     */ 
    mysqli_close($conn);

    sort($champions);

    header('Content-Type: application/json');
    echo json_encode($champions);
?>