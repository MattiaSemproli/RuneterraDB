<?php

    $champions = json_decode(file_get_contents("champions.json"));
    // var_dump($champions);
    // sort($champions);
    // echo "<br>";
    // var_dump($champions);

    echo $champions[1]->regions[0];

?>