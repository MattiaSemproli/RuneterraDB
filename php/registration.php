<?php
    if (isset($_POST['username']) && isset($_POST['password'])) {
        $username = $_POST['username'];
        $password = $_POST['password'];
        
        /**
         * Require the file with connection variables.
         */ 
        require_once 'connect.php';

        $users = "SELECT username FROM user";
        $result = $conn->query($users);

        //Prevents sql injections
        $username = stripcslashes($username);
        $password = stripcslashes($password);
        $username = mysqli_real_escape_string($conn, $username);
        $password = mysqli_real_escape_string($conn, $password);
        
        $sql = "INSERT INTO user (username, password) VALUES ('$username', '$password')";

        if (!in_array($username, $result->fetch_array()) && $conn->query($sql) === TRUE) {
            setcookie('user', $username, ['path' => '/php/']);
            header("Location: ../html/profileCreation.html");
        } else {
            header("Location: ../html/registration.html?error=true");
            die();
        }  

        /**
         * Close the connection.
         */ 
        mysqli_close($conn);
        
    } else {
        header("Location: ../html/registration.html");
    }
?>
