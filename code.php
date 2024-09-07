<?php
session_start();
$con = new mysqli("localhost","root","","bus_booking");
$query=null;
if(isset($_POST['submit']))
  {
    $name=$_POST['name'];
    $username=$_POST['username'];
    $email=$_POST['email'];
    $password=md5($_POST['password']);

    $ret=mysqli_query($con, "select email from userlog where Email='$email' || username='$username'");
    $result=mysqli_fetch_array($ret);
    if($result>0){
    $msg="This email or Contact Number already associated with another account";
    }
    else{
    $query=mysqli_query($con, "insert into userlog(name, username, email,password) values('$name', '$username', '$email', '$password' )");
    if($query) {
        $msg="You have successfully registered";
        
            header("Location: ulogin.php");  
      }
      else
        {
          $msg="Something Went Wrong. Please try again";
        }
}
}
?>