<?php
// Connect to the database (replace with your actual database credentials)
$servername = "localhost:3307";
$username = "root";
$password = "";
$dbname = "onlineshop";

$conn = new mysqli($servername, $username, $password, $dbname);

// Check the connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Process form submission
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $name = $_POST["name"];
    $email = $_POST["email"];
    $phone_number = $_POST["phone-number"];
    $subject = $_POST["subject"];
    $message = $_POST["message"];

    // Insert data into the database
    $sql = "INSERT INTO contacts (name, email, phone_number, subject, message)
            VALUES ('$name', '$email', '$phone_number', '$subject', '$message')";

    if ($conn->query($sql) === TRUE) {
        echo "New record created successfully";
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
}

// Close the database connection
$conn->close();
?>
