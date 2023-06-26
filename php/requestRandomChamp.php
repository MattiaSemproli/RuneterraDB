<?php
    /**
     * Require the file with connection variables.
     */ 
    require_once 'connect.php';

    $x = $_GET['x'];

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
            JOIN region ON champion.region = region.idRegion
            WHERE champion.idChampion = $x";

    $result = $conn->query($sql);
    $c = array();

    if ($result->num_rows > 0) {
        foreach ($result->fetch_assoc() as $val) {
            array_push($c, $val);
        }
    } else {
        echo "0 results";
    }

    /**
     * Close the connection.
     */ 
    mysqli_close($conn);

    header('Content-Type: application/json');
    echo json_encode($c);
?>