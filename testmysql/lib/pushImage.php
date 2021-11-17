<?php
  require_once("dbconfig.php");
  $email=$_POST["email"];
  $query="SELECT * FROM login_test WHERE email LIKE '$email'";
  $res=mysqli_query($conn,$query);
  $data=mysqli_fetch_array($res);
  echo json_encode($data);
?>