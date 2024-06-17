function showFields(option) {
   if (option === "patient") {
      document.getElementById("patientFields").style.display = "block";
      document.getElementById("doctorFields").style.display = "none";
   } else if (option === "doctor") {
      document.getElementById("patientFields").style.display = "none";
      document.getElementById("doctorFields").style.display = "block";
   }
}
