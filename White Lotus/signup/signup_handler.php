<?php
session_start();
require_once ("../dbh.inc.php");

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $email = $_POST["email"];
    $pwd = $_POST["password"];
    $account_type = $_POST["account_type"];
    $firstName = $_POST['first_name'];
    $lastName = $_POST['last_name'];
    $address = $_POST['address'];
    $department_id = $_POST['department_id'];
    // $hashedPassword = password_hash($pwd, PASSWORD_DEFAULT);

    // Check if the email already exists
    if (emailExists($pdo, $email)) {
        redirectToSignupPage("Email already exists!");
    }

    if ($account_type == 'patient') {
        addUser($pdo, 'patient', $firstName, $lastName, $address, $email, $pwd);
    } elseif ($account_type == 'doctor') {
        $specialty = $_POST['specialty'];
        addUser($pdo, 'doctor', $specialty, $firstName, $lastName, $email, $pwd, $department_id);
    }

    // Set session variables
    $_SESSION["email"] = $email;
    $_SESSION['authenticated'] = true;
    $_SESSION['account_type'] = $account_type;

    // Redirect to dashboard
    header("Location: ../" . $account_type . "_dashboard/" . $account_type . ".php");
    exit();
} else {
    redirectToSignupPage("Please use the form to sign up!");
}

function emailExists($pdo, $email)
{
    $query = "SELECT COUNT(*) AS count FROM (
                SELECT 1 FROM doctor WHERE email = :email
                UNION
                SELECT 1 FROM patient WHERE email = :email
            ) AS combined";
    $stmt = $pdo->prepare($query);
    $stmt->execute([':email' => $email]);
    $row = $stmt->fetch(PDO::FETCH_ASSOC);
    return ($row['count'] > 0);
}

function addUser($pdo, $type, $firstName, $lastName, $address, $email, $hashedPassword, $department_id = null)
{
    if ($type == 'patient') {
        $query = "INSERT INTO patient (Patient_Fname, Patient_Lname, Patient_Address, Email, Password) 
                  VALUES (:Patient_Fname, :Patient_Lname, :Patient_Address, :Email, :Password)";
        $params = [
            ':Patient_Fname' => $firstName,
            ':Patient_Lname' => $lastName,
            ':Patient_Address' => $address,
            ':Email' => $email,
            ':Password' => $hashedPassword
        ];
    } elseif ($type == 'doctor') {
        $query = "INSERT INTO doctor (Speciality, Doctor_Fname, Doctor_Lname, Email, Password, Department_ID) 
                  VALUES (:Speciality, :Doctor_Fname, :Doctor_Lname, :Email, :Password, :Department_ID)";
        $params = [
            ':Speciality' => $firstName,
            ':Doctor_Fname' => $lastName,
            ':Doctor_Lname' => $address,
            ':Email' => $email,
            ':Password' => $hashedPassword,
            ':Department_ID' => $department_id
        ];
    }
    $stmt = $pdo->prepare($query);
    $stmt->execute($params);
}

function redirectToSignupPage($errorMessage = null, $url = "./signup.php")
{
    $_SESSION['errorType'] = $errorMessage;
    header("Location: " . $url);
    exit();
}
?>