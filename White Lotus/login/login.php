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
    <title>White Lotus Login</title>
    <!-- CSS -->
    <link rel="stylesheet" href="./login.css">
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
    <div class="reg">
        <form id="login-form" action="./login_handler.php" method="POST">
            <h2>Login</h2>
            <!-- User enters email and password -->
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required>
            </div>
            <button type="submit">Sign In</button>
        </form>

        <!-- Display error message if exists -->
        <?php if ($errorType): ?>
            <div class="error-message">
                <?= $errorType ?>
            </div>
        <?php endif; ?>

        <!-- If he has no account -> instruct him to create one -->
        <div class="go-signup">
            <p>No account yet? <a href="../signup/signup.php">Signup</a></p>
        </div>
    </div>
</body>

</html>