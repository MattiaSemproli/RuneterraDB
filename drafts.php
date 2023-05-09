<?php

    // $champions = json_decode(file_get_contents("champions.json"));
    // var_dump($champions);
    // sort($champions);
    // echo "<br>";
    // var_dump($champions);
    // echo $champions[1]->regions[0];

    // $species = array();
    // foreach($champions as $champ) {
    //     if(is_array($champ->species)){
    //         $species_arr = explode(",", implode(",", $champ->species));
    //         foreach($species_arr as $sa) {
    //             array_push($species, trim($sa));
    //         }
    //     } else 
    //         array_push($species, $champ->species);
    // }
    // $species = array_unique($species);
    // sort($species);
    // foreach ($species as $s) {
    //     print_r($s);
    //     echo "<br>";
    // }
    // $id = 0;
    // foreach($species as $ss) {
    //     $sqlRegion = "INSERT INTO species (idSpecies, speciesValue)
    //                   VALUES ($id, '$ss')";
    
    //     if ($conn->query($sqlRegion) === TRUE) {
    //         echo "$id: $ss<br>Entered correctly<br><br>";
    //     } else {
    //         echo "Error: " . $sqlRegion . "<br>" . $conn->error;
    //     }
    //     $id++;
    // }
    
    // $lore = json_decode(file_get_contents("cs.json"));
    // $lore = $lore->data;
    // foreach($lore as $l) {
    //     print($l->name);
    //     echo "<br>";
    //     print($l->title);
    //     echo "<br>";
    //     print($l->blurb);
    //     echo "<br>";
    //     echo ".";
    //     echo "<br>";
    // }

?>