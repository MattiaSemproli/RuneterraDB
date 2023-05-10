<?php
    /**
     * Require the file with connection variables.
     */ 
    require_once 'connect.php';

    $champion = $_GET['champion'];

    $sql = "SELECT healthPoint, 
                   mana, 
                   attackDamage, 
                   attackRange, 
                   armor, 
                   magicResistance, 
                   attackSpeed, 
                   movementSpeed 
            FROM stats WHERE idChampion = (SELECT idChampion FROM champion WHERE name = '$champion')";

    $result = $conn->query($sql);

    if ($result->num_rows == 1) {
        $result = $result->fetch_assoc();
    } else {
        echo "0 results";
    }

    /**
     * Close the connection.
     */ 
    mysqli_close($conn);

    header('Content-Type: application/json');
    echo json_encode($result);
?>