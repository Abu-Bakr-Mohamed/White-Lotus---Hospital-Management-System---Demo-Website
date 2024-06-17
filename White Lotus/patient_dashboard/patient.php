<?php
session_start();
require_once ("../dbh.inc.php");
$email = $_SESSION['email'] ?? null;

// Get the profile data of the user
if ($email) {
    $stmt = $pdo->prepare("SELECT * FROM patient WHERE Email = ?");
    $stmt->execute([$email]);

    $patient = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($patient) {
        $patientID = $patient['Patient_ID'];
        $firstName = $patient['Patient_Fname'];
        $lastName = $patient['Patient_Lname'];
        $address = $patient['Patient_Address'];


        // After getting the user data , get all appointments
        $stmt = $pdo->prepare("SELECT appointment.time, appointment.date, doctor.Doctor_Fname AS doctor_name
        FROM appointment
        INNER JOIN doctor ON appointment.doctor_id = doctor.doctor_id
        INNER JOIN patient ON appointment.patient_id = patient.patient_id
        WHERE appointment.patient_id = ?
        ORDER BY appointment.date, appointment.time");
        $stmt->execute([$patientID]);
        $appointments = $stmt->fetchAll(PDO::FETCH_ASSOC);

    } else {
        echo "No patient found for the provided email.";
    }
} else {
    echo "Email not provided.";
    header("Location: ../landing/index.php");
    exit();
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
    <link rel="stylesheet" href="./patient.css">
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
    <!-- JS -->
    <script src="./patient.js" defer></script>
</head>

<body>
    <header>
        <div class="logo">White Lotus <img src="../Images/header_icon.png" alt=""></div>

        <div class="contacts">
            <i class="fa-solid fa-right-from-bracket logout" id="logoutBtn"> <span>Log out</span></i>
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
                    <p><?= $patientID ?></p>
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
                    <label>Address</label>
                    <p><?= $address ?></p>
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
                    <th>Doctor's Name</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($appointments as $appointment): ?>
                    <tr>
                        <td><?= $appointment['time'] ?></td>
                        <td><?= $appointment['date'] ?></td>
                        <td><?= $appointment['doctor_name'] ?></td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    </div>
</body>

</html>