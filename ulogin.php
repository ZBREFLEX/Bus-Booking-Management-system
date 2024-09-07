<?php
session_start();
if(isset($_POST['login']))
{


$user=$_POST['username'];
$pass=$_POST['password'];

$conn = new mysqli("localhost","root","","bus_booking");

 $sql = "SELECT * FROM userlog where username='$user'";

$result= $conn->query($sql);

if($result->num_rows>0)
{ 

	while($row=$result->fetch_assoc())
	{
		$duser=$row['username'];
		$dpass=$row['password']; 
	
	if($pass==$dpass)
	{	$_SESSION['username']=$duser;
		header("Location: index.php");
	}
	else
	{
	echo "incorect pass";
	}
	 
	
}
}
else
{
echo "no such user exists";


}
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>user login page</title>
    <link rel="stylesheet" href="assets/css/login.css">
</head>
<body>
<form method="post">
<div class="login-page">
      <div class="form">
        <div class="login">
          <div class="login-header">
            <h3>LOGIN</h3>
            <p>Please enter your credentials to login.</p>
          </div>
        </div>
        <form class="login-form">
          <input type="text" name="username" placeholder="username"/>
          <input type="password"  name="password" placeholder="password" />
          <input type="submit" value="submit" name="login" class="button">
          <p class="message">Not registered? <a href="ureg.php">Create an account</a></p>
     
      </div>
    </div>
</form>
</body>
</html>