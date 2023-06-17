<?php
    function generateMenu($isLoggedIn) {
        $menuItems = array();
        if (!$isLoggedIn) {
            array_push($menuItems, '<li><a href="login.html">Log In</a></li>');
            array_push($menuItems, '<li><a href="registration.html">Registration</a></li>');
        }
        if ($isLoggedIn) {
            array_push($menuItems, '<li><a href="../php/logout.php">Log Out</a></li>');
        }
        return $menuItems;
    }
    session_start();
    $isLoggedIn = isset($_SESSION['username']);

    header('Content-Type: application/json');
    echo json_encode(generateMenu($isLoggedIn));
?>