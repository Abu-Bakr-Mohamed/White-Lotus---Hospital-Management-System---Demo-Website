<?php
session_start();
$errorType = $_SESSION['errorType'] ?? null;
unset($_SESSION['errorType']);
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>White Lotus SignUp</title>
    <!-- CSS -->
    <link rel="stylesheet" href="./signup.css">
    <link rel="stylesheet" href="../general.css">
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
    <script src="./signup.js" defer></script>

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
        <div class="form-container">
            <h2>Signup Form</h2>
            <form id="signupForm" action="./signup_handler.php" method="POST">
                <div class="account_type">
                    <input type="radio" id="patient" name="account_type" value="patient" onclick="showFields('patient')"
                        required>
                    <label for="patient">Patient</label>

                    <input type="radio" id="doctor" name="account_type" value="doctor" onclick="showFields('doctor')"
                        required>
                    <label for="doctor">Doctor</label>
                </div>

                <!-- Patient specific -->
                <div id="patientFields" style="display: none;">

                </div>
                <!-- Patient specific end-->

                <div class="group-two">
                    <div class="field-group">
                        <label for="firstName">First name</label>
                        <input type="text" id="firstName" name="first_name" required>
                    </div>

                    <div class="field-group">
                        <label for="lastName">Last name</label>
                        <input type="text" id="lastName" name="last_name" required>
                    </div>
                </div>
                <!-- Doctor specific start -->
                <div id="doctorFields" style="display: none;">
                    <div class="group-two">
                        <div class="field-group">
                            <label for="specialty">Specialty</label>
                            <input type="text" id="specialty" name="specialty">
                        </div>
                        <div class="field-group">
                            <label for="department_id">Department ID</label>
                            <input type="number" min="1" id="department_id" name="department_id">
                        </div>
                    </div>
                </div>
                <!-- Doctor specific end -->

                <label for="address">Address</label>
                <input type="text" id="address" name="address" required>

                <label for="email">Email</label>
                <input type="email" id="email" name="email" required>

                <label for="password">Password</label>
                <input type="password" id="password" name="password" required>

                <button type="submit">Sign Up</button>
                <!-- Display error message if exists -->
                <?php if ($errorType): ?>
                    <div class="error-message">
                        <?= $errorType ?>
                    </div>
                <?php endif; ?>
            </form>
        </div>
    </div>

</body>

</html>