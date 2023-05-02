<?php
    /**
     * Require the file with connection variables.
     */ 
    require_once 'connect.php';

    /**
     * Open a connection.
     */
    $conn = new mysqli($servername, $username, $password, $dbname);
    if (!$conn) {
        die("Connessione al database fallita: " . mysqli_connect_error());
    }

    /**
     * Uncomment to insert all the regions.
     */
    // $regions = json_decode(file_get_contents("regions.json"));
    // foreach($regions as $region) {
    //     $sqlRegion = "INSERT INTO region (name, story)
    //                   VALUES ('{$region->regionName}','{$region->story}')";
    //
    //     if ($conn->query($sqlRegion) === TRUE) {
    //         echo "$region->regionName: $region->story<br>Entered correctly<br><br>";
    //     } else {
    //         echo "Error: " . $sql . "<br>" . $conn->error;
    //     }
    // }

    /**
     * Uncomment to insert all the champions.
     */
    // $champions = json_decode(file_get_contents("champions.json"));
    // sort($champions);
    // $id = 0;
    // foreach($champions as $champion) {
    //     $name = str_replace("'", " ", $champion->championName);
    //     $roles = is_array($champion->positions) ? implode(",", $champion->positions) : $champion->positions;
    //     $species = is_array($champion->species) ? implode(",", $champion->species) : $champion->species;
    //     $region = is_array($champion->regions) ? $champion->regions[0] : $champion->regions;
    //     $attackerType = is_array($champion->range_type) ? implode(",", $champion->range_type) : $champion->range_type;

    //     $sqlChampion = "INSERT INTO champion (idChampion, name, gender, roles, species, resType, attackerType, region)
    //                     VALUES ($id,'$name','{$champion->gender}','$roles', 
    //                             '$species','{$champion->resource}','$attackerType','$region')";

    //     if ($conn->query($sqlChampion) === TRUE) {
    //         echo "$id: $champion->championName<br>Entered correctly<br><br>";
    //     } else {
    //         echo "Error: " . $sql . "<br>" . $conn->error;
    //     }
        
    //     $id++;
    // }

    //close the connection.
    mysqli_close($conn);
?>