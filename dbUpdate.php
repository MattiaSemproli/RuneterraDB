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
     * Insert all the regions.
     */
    function upRegions($conn) {
        $regions = json_decode(file_get_contents("regions.json"));
        $id = 0;
        foreach($regions as $region) {
            $sqlRegion = "INSERT INTO region (idRegion, name, story)
                          VALUES ($id,'{$region->regionName}','{$region->story}')";
        
            if ($conn->query($sqlRegion) === TRUE) {
                echo "$id: $region->regionName: $region->story<br>Entered correctly<br><br>";
            } else {
                echo "Error: " . $sqlRegion . "<br>" . $conn->error;
            }
            $id++;
        }
    }

    /**
     * Query for admin users.
     * 
     * INSERT INTO `runeterradb`.`user` (`username`, `password`, `isAdmin`) VALUES ('mttia', 'mttia1234', '1');
     * INSERT INTO `runeterradb`.`user` (`username`, `password`, `isAdmin`) VALUES ('paglia', 'paglia1234', '1');
     */

    /**
     * Query for gender.
     * 
     * INSERT INTO `runeterradb`.`gender` (`idGender`, `genderValue`) VALUES ('0', 'Male');
     * INSERT INTO `runeterradb`.`gender` (`idGender`, `genderValue`) VALUES ('1', 'Female');
     * INSERT INTO `runeterradb`.`gender` (`idGender`, `genderValue`) VALUES ('2', 'Other');
     */

    /**
     * Query for role.
     * 
     * INSERT INTO `runeterradb`.`role` (`idRole`, `roleValue`) VALUES ('0', 'Top');
     * INSERT INTO `runeterradb`.`role` (`idRole`, `roleValue`) VALUES ('1', 'Jungle');
     * INSERT INTO `runeterradb`.`role` (`idRole`, `roleValue`) VALUES ('2', 'Middle');
     * INSERT INTO `runeterradb`.`role` (`idRole`, `roleValue`) VALUES ('3', 'Bottom');
     * INSERT INTO `runeterradb`.`role` (`idRole`, `roleValue`) VALUES ('4', 'Support');
     */

    /**
     * Query for resource.
     * 
     * INSERT INTO `runeterradb`.`resource` (`idResource`, `resourceValue`) VALUES ('0', 'Mana');
     * INSERT INTO `runeterradb`.`resource` (`idResource`, `resourceValue`) VALUES ('1', 'Manaless');
     * INSERT INTO `runeterradb`.`resource` (`idResource`, `resourceValue`) VALUES ('2', 'Energy');
     * INSERT INTO `runeterradb`.`resource` (`idResource`, `resourceValue`) VALUES ('3', 'Fury');
     * INSERT INTO `runeterradb`.`resource` (`idResource`, `resourceValue`) VALUES ('4', 'Rage');
     * INSERT INTO `runeterradb`.`resource` (`idResource`, `resourceValue`) VALUES ('5', 'Ferocity');
     * INSERT INTO `runeterradb`.`resource` (`idResource`, `resourceValue`) VALUES ('6', 'Heat');
     * INSERT INTO `runeterradb`.`resource` (`idResource`, `resourceValue`) VALUES ('7', 'Health costs');
     * INSERT INTO `runeterradb`.`resource` (`idResource`, `resourceValue`) VALUES ('8', 'Flow');

     */
    
    /**
     * Insert all the species.
     * 
     * $champions = json_decode(file_get_contents("champions.json"));
     * $species = array();
     * foreach($champions as $champ) {
     *     if(is_array($champ->species)){
     *         $species_arr = explode(",", implode(",", $champ->species));
     *         foreach($species_arr as $sa) {
     *             array_push($species, trim($sa));
     *         }
     *     } else 
     *         array_push($species, $champ->species);
     * }
     * $species = array_unique($species);
     * sort($species);
     * foreach ($species as $s) {
     *     print_r($s);
     *     echo "<br>";
     * }
     * $id = 0;
     * foreach($species as $ss) {
     *     $sqlRegion = "INSERT INTO species (idSpecies, speciesValue)
     *                 VALUES ($id, '$ss')";
     *     if ($conn->query($sqlRegion) === TRUE) {
     *         echo "$id: $ss<br>Entered correctly<br><br>";
     *     } else {
     *         echo "Error: " . $sqlRegion . "<br>" . $conn->error;
     *     }
     *     $id++;
     * }
     */


    /**
     * Query for attack.
     * 
     * INSERT INTO `runeterradb`.`attack` (`idAttack`, `attackValue`) VALUES ('0', 'Melee');
     * INSERT INTO `runeterradb`.`attack` (`idAttack`, `attackValue`) VALUES ('1', 'Ranged');

     */
    function upLore($conn) {
        $champions = json_decode(file_get_contents("champions.json"));
        sort($champions);
        $names = array();
        foreach($champions as $na) {
            $name = $na->championName;
            if(str_contains($name,"Nunu")) {
                $name = "Nunu";
            } else if(str_contains($name,"'")) {
                $name = str_replace("'","",$name);
                if(str_contains($name,"BelVeth")){
                    $name = "Belveth";
                }
                if(str_contains($name,"VelKoz")){
                    $name = "Velkoz";
                }
                if(str_contains($name,"KhaZix")){
                    $name = "Khazix";
                }
                if(str_contains($name,"KaiSa")){
                    $name = "Kaisa";
                }
                if(str_contains($name,"ChoGath")){
                    $name = "Chogath";
                }
            } else if(str_contains($name," ")) {
                $name = str_replace(" ","",$name);
                if(str_contains($name,"RenataGlasc")){
                    $name = "Renata";
                }
                if(str_contains($name,"Dr.Mundo")){
                    $name = "DrMundo";
                }
            } else if(str_contains($name,"Wukong")) {
                $name = "MonkeyKing";
            }
            if(str_contains($name,"LeBlanc")){
                $name = "Leblanc";
            }
            array_push($names, $name);
        }
        $lores = array();
        foreach($names as $name) {
            $lore = json_decode(file_get_contents("http://ddragon.leagueoflegends.com/cdn/13.9.1/data/en_US/champion/". $name .".json"));
            $cName = $lore->data->$name->name;
            $cTitle = mysqli_real_escape_string($conn, $lore->data->$name->title);
            $cLore = mysqli_real_escape_string($conn, $lore->data->$name->lore);
            array_push($lores, [$cName,$cTitle,$cLore]);
        }
        $id = 0;
        foreach($lores as $singleLore) {
            $sqlLore = "INSERT INTO lore (idChampion, title, description)
                            VALUES (
                                $id,
                                '$singleLore[1]',
                                '$singleLore[2]'
                            )";
    
            if ($conn->query($sqlLore) === TRUE) {
                echo "$id: $singleLore[1]<br>Entered correctly<br><br>";
            } else {
                echo "Error: " . $sqlLore . "<br>" . $conn->error;
            }
            $id++;
        }
    }

    /**
     * Insert all the champions.
     */
    function upChampions($conn) {
        $champions = json_decode(file_get_contents("champions.json"));
        sort($champions);
        $id = 0;
        foreach($champions as $champion) {
            $name = str_replace("'", " ", $champion->championName);
            $role = is_array($champion->positions) ? $champion->positions[0] : $champion->positions;
            $species = is_array($champion->species) ? $champion->species[0] : $champion->species;
            $region = is_array($champion->regions) ? $champion->regions[0] : $champion->regions;
            $attackerType = is_array($champion->range_type) ? $champion->range_type[0] : $champion->range_type;
    
            $sqlChampion = "INSERT INTO champion (idChampion, name, gender, role, species, resource, attack, region)
                            VALUES (
                                $id,
                                '$name',
                                (SELECT idGender FROM gender WHERE genderValue = '$champion->gender'),
                                (SELECT idRole FROM role WHERE roleValue = '$role'),
                                (SELECT idSpecies FROM species WHERE speciesValue = '$species'),
                                (SELECT idResource FROM resource WHERE resourceValue = '$champion->resource'),
                                (SELECT idAttack FROM attack WHERE attackValue = '$attackerType'),
                                (SELECT idRegion FROM region WHERE name = '$region')
                            )";
    
            if ($conn->query($sqlChampion) === TRUE) {
                echo "$id: $name: $champion->gender: $role: $species: $champion->resource: $attackerType: $region<br>Entered correctly<br><br>";
            } else {
                echo "Error: " . $sqlChampion . "<br>" . $conn->error;
            }
         
            $id++;
        }
    }

    /**
     * Close the connection.
     */ 
    mysqli_close($conn);
?>