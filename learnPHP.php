<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "runeterradb";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

//$_POST is a superglobal variable that is used to collect form data after submitting an HTML form with method="post".
//$_POST is also widely used to pass variables.
if ($_SERVER["REQUEST_METHOD"] == "POST") {
  $username = $_POST["username"];
  $password = $_POST["password"];
}

//come tra pagine il passaggio di dati avviene tramite POST, per riportare i dati nella pagina precedente
echo '<form action="index.html" method="post">
        <input type="hidden" value="'.$username.'" name="username">
        <input type="hidden" value="'.$password.'" name="password">
        <input type="submit" value="Riportami alla home">
      </form>';

//select all
$check = "SELECT * FROM user WHERE username = '$username'";
$result = $conn->query($check);

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        echo "Username: " . $row["username"] . "<br>";
    }
} else {
    echo "0 results";
}

//insert
$sql = "INSERT INTO user (username, password, isAdmin)
        VALUES ('$username','$password', 0)";

if ($conn->query($sql) === TRUE) {
    echo "Registered successfully";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

//delete
$delete = "DELETE FROM user WHERE username = '$username'";

if ($conn->query($delete) === TRUE) {
    echo "Deleted successfully";
} else {
    echo "Error: " . $delete . "<br>" . $conn->error;
}

//update change password
$update = "UPDATE user SET password = '$password' WHERE username = '$username'";

if ($conn->query($update) === TRUE) {
    echo "Updated successfully";
} else {
    echo "Error: " . $update . "<br>" . $conn->error;
}

$conn->close();
?>