<?php
include('db_connect.php');

extract($_POST);

$remove = $conn->query("DELETE FROM driverdetail WHERE id = $id");

if($remove) {
    echo 1;
} else {
    echo "Error: " . $conn->error;
}
?>