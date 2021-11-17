<?php

  require_once("dbconfig.php");
  $email=$_POST["email"];
  $pass=$_POST["pass"];


  $query="SELECT * FROM login_test WHERE email LIKE '$email'";
  $res=mysqli_query($conn,$query);
  $data= mysqli_fetch_array($res); //pour rendre le resultat en tableau

  if($data[1]>=1){
      //email exist donc verifier les mot de pass
      $query="SELECT * FROM login_text WHERE pass LIKE '$pass'";
      $res=mysqli_query($conn,$query);
      $data=mysqli_fetch_array($res);
      if($data[2]>=1){
          //password Ok
          echo json_encode("CONNECTION EFFECTUER");
      }else{
          //password no match
          echo json_encode("MOT DE PASSE INCORRECTE");
      }

  }else{
      // email n'existe pas il ne peut pas se conntecter
      echo json_encode("UTILISATEUR NON INSCRIT");
  }

?>