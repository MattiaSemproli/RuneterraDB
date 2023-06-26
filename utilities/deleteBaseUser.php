<?php
    /**
     * Require the file with connection variables.
     */ 
    require_once 'connect.php';

    $sql = "DELETE FROM user WHERE isAdmin = 0";

    if ($conn->query($sql) === TRUE) {
        echo "Deleted successfully";
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }

    /**
     * Close the connection.
     */ 
    mysqli_close($conn);
?>