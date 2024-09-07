<?php
include 'db_connect.php';

$qry = $conn->query("SELECT d_name,d_address,busname,busno FROM driverdetail d,busdetail b WHERE d.busno=b.busname AND ");
$data = array();
while($row = $qry->fetch_assoc()){
	$data[]= $row;
}
echo json_encode($data);