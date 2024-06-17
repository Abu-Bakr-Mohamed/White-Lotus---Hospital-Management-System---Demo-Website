<?php
session_start();
require_once ("../dbh.inc.php");

// Check if the form was submitted correctly
if ($_SERVER["REQUEST_METHOD"] === "POST") {
    // Get and sanitize form data
    $email = $_POST["email"];
    $pwd = $_POST["password"];

    // Check for empty fields
    if (empty($email) || empty($pwd)) {
        redirectToLoginPage("Please provide both email and password!");
    }

    // Combine patient and doctor queries into a single query
    $query = "SELECT 'patient' AS account_type, patient_id, password
              FROM patient
              WHERE email = :email
              UNION
              SELECT 'doctor' AS account_type, doctor_id, password
              FROM doctor
              WHERE email = :email";

    $stmt = $pdo->prepare($query);
    $stmt->execute([
        ':email' => $email,
    ]);

    // Check if any rows are returned
    if ($stmt->rowCount() > 0) {
        $row = $stmt->fetch(PDO::FETCH_ASSOC);
        $account_type = $row['account_type'];
        $hashedPassword = $row['password'];
        $userID = $row['id'];
    } else {
        redirectToLoginPage("Sorry, your email is not registered!");
    }

    // Redirect with an error message if the password is incorrect
    // if (!password_verify($pwd, $hashedPassword)) {
    //     redirectToLoginPage("Incorrect password!");
    // }
    if ($pwd != $row['password']) {
        redirectToLoginPage("Incorrect password!");
    }

    // Verification complete, add user info to the session
    $_SESSION["userID"] = $userID;
    $_SESSION["email"] = $email;
    $_SESSION['authenticated'] = true;

    // Define dashboard URLs based on user type
    $dashboardUrls = [
        "patient" => "../patient_dashboard/patient.php",
        "doctor" => "../doctor_dashboard/doctor.php",
    ];

    // Redirect to dashboard based on user type
    if (isset($dashboardUrls[$account_type])) {
        header("Location: " . $dashboardUrls[$account_type]);
        exit();
    }

} else {
    // If the form was not submitted via POST, redirect to the login page
    redirectToLoginPage("Invalid form submission!");
}

// Function to redirect to login page with an error message
function redirectToLoginPage($errorMessage = null)
{
    $_SESSION['errorType'] = $errorMessage; // Store the error message in session
    header("Location: ./login.php");
    exit();
}
