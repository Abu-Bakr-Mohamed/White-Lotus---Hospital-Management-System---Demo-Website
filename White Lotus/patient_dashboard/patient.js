document.getElementById("logoutBtn").addEventListener("click", function () {
   var confirmLogout = confirm("Are you sure you want to log out?");
   if (confirmLogout) {
      window.location.href = "../logout_handler.php";
   }
});
