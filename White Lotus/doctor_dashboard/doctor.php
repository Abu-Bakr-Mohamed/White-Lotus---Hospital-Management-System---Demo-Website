<?php
session_start();
require_once ("../dbh.inc.php");
$email = $_SESSION['email'] ?? null;

// Get the profile data of the user
if ($email) {
    $stmt = $pdo->prepare("SELECT * FROM doctor WHERE Email = ?");
    $stmt->execute([$email]);

    $doctor = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($doctor) {
        $doctorID = $doctor['Doctor_ID'];
        $firstName = $doctor['Doctor_Fname'];
        $lastName = $doctor['Doctor_Lname'];
        $speciality = $doctor['Speciality'];
        $salary = $doctor['Salary'];
        $departmentID = $doctor['Department_ID'];


        // After getting the user data , get all appointments
        $stmt = $pdo->prepare("SELECT appointment.time, appointment.date, doctor.Doctor_Fname AS doctor_name, patient.Patient_Fname AS patient_name
        FROM appointment
        INNER JOIN doctor ON appointment.Doctor_ID = doctor.Doctor_ID
        INNER JOIN patient ON appointment.Patient_ID = patient.Patient_ID
        WHERE appointment.Doctor_ID = ?
        ORDER BY appointment.date, appointment.time");
        $stmt->execute([$doctorID]);
        $appointments = $stmt->fetchAll(PDO::FETCH_ASSOC);


    } else {
        echo "No patient found for the provided email.";
    }
} else {
    echo "Email not provided.";
}

?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>White Lotus | Dashboard</title>
    <!-- CSS -->
    <link rel="stylesheet" href="../general.css">
    <link rel="stylesheet" href="./doctor.css">
    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nunito:ital,wght@0,600;0,900;0,1000;1,900;1,1000&display=swap"
        rel="stylesheet">
    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
        integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="../all.min.css">
</head>

<body>
    <header>
        <div class="logo">White Lotus <img src="../Images/header_icon.png" alt=""></div>
        <div class="contacts">
            <a href="https://www.facebook.com/profile.php?id=100087902827830" target="_blank">
                <i class="fa-brands fa-facebook"></i>
            </a>
            <a href="https://www.facebook.com/profile.php?id=100087902827830" target="_blank">
                <i class="fa-brands fa-whatsapp"></i>
            </a>
            <a href="https://www.facebook.com/profile.php?id=100087902827830" target="_blank">
                <i class="fa-brands fa-instagram"></i>
            </a>
            <a href="https://www.facebook.com/profile.php?id=100087902827830" target="_blank">
                <i class="fa-brands fa-x-twitter"></i>
            </a>
        </div>
    </header>
    <div class="container">
        <h2 class="global-heading">Profile</h2>
        <p>Keep Track of your data</p>
        <div class="profile">
            <div class="profile-pic">
                <img src="../Images/about.jpg" alt="">
            </div>
            <div class="textual-info">
                <div class="profile-info">
                    <label>ID</label>
                    <p><?= $doctorID ?></p>
                </div>
                <div class="profile-info">
                    <label>First Name</label>
                    <p><?= $firstName ?></p>
                </div>
                <div class="profile-info">
                    <label>Last Name</label>
                    <p><?= $lastName ?></p>
                </div>
                <div class="profile-info">
                    <label>Specialty</label>
                    <p><?= $speciality ?></p>
                </div>
                <div class="profile-info">
                    <label>Salary</label>
                    <p><?= $salary ?></p>
                </div>
                <div class="profile-info">
                    <label>Email</label>
                    <p><?= $_SESSION['email'] ?></p>
                </div>
            </div>
        </div>
        <h2 class="global-heading">Appointments</h2>
        <p>Keep Track of your appointments</p>
        <table class="appointment-table">
            <thead>
                <tr>
                    <th>Time</th>
                    <th>Date</th>
                    <th>Patient's Name</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($appointments as $appointment): ?>
                    <tr>
                        <td><?= $appointment['time'] ?></td>
                        <td><?= $appointment['date'] ?></td>
                        <td><?= $appointment['patient_name'] ?></td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    </div>
</body>

</html>