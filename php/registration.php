<?php
    if (isset($_POST['username']) && isset($_POST['password'])) {
        $username = $_POST['username'];
        $password = $_POST['password'];
        
        /**
         * Require the file with connection variables.
         */ 
        require_once 'connect.php';

        //Prevents sql injections
        $username = stripcslashes($username);
        $password = stripcslashes($password);
        $username = mysqli_real_escape_string($conn, $username);
        $password = mysqli_real_escape_string($conn, $password);        
        
        $sql = "INSERT INTO user (username, password) VALUES ('$username', '$password')";

        if ($conn->query($sql)->num_rows == 1) {
            header("Location: ../html/login.html");
        } else {
            //To be done
            header("Location: ../html/registration.html");
        }  

        /**
         * Close the connection.
         */ 
        mysqli_close($conn);
        
    } else {
        header("Location: ../html/registration.html");
    }
?>
