<?php
  require_once("dbconfig.php");
  $email=$_POST['email'];
  $pass=$_POST['pass'];
  
  $query="SELECT * FROM login_test WHERE email LIKE '$email'";
  $res=mysqli_query($conn,$query);
  $data=mysqli_fetch_array($res);
  echo json_encode($data);

  if($data[0]>1){
      // account exist
      echo json_encode("email exists deja");
  }else{
      //create
      $query="INSERT INTO login_test (id,email,pass) VALUES(null,'$email','$pass')";
      $res=mysqli_query($conn,$query);
      if($res){
          echo json_encode(true);
      }else{
          echo json_encode(false);
      }

  }
?>