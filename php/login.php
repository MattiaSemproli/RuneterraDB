<?php
    session_start();
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
        
        $sql = "SELECT * FROM user WHERE username = '$username' AND password = '$password'";

        if ($conn->query($sql)->num_rows == 1) {
            $_SESSION['username'] = $username;
            header("Location: ../html/index.html");
        } else {
            header("Location: ../html/login.html?error=true");
            die();
        }

        /**
         * Close the connection.
         */ 
        mysqli_close($conn);
    } else {
        header("Location: ../html/login.html");
    }
?>
