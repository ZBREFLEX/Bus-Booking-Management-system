<?php
include('db_connect.php');

extract($_POST);

error_log("Received POST data: " . print_r($_POST, true));

$data = " d_name = '$d_name' ";
$data .= ", d_address = '$d_address' ";
$data .= ", d_license = '$d_license' ";
$data .= ", bus_name = '$bus_name' ";
$data .= ", bus_number = '$bus_number' ";
$data .= ", bus_route = '$bus_route' ";

error_log("Constructed data string: " . $data);

if(empty($id)){
    $insert = $conn->query("INSERT INTO driverdetail SET ".$data);
    if($insert){
        error_log("Inserted data successfully");
        echo 1;
    }
}else{
    $update = $conn->query("UPDATE driverdetail SET ".$data." WHERE id =".$id);
    if($update){
        error_log("Updated data successfully");
        echo 1;
    }
}      
?>
 
