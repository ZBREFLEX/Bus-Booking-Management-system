<?php
include('db_connect.php');

extract($_POST);
// Validate that required fields are not empty
if (!empty($busname) && !empty($busno) && !empty($rcbook)) {
    // Set PHP variables based on user input
    $busname = $_POST['bus_name'];
    $busno = $_POST['busno'];
    $rcbook = $_POST['rcbook'];

    if (isset($_POST['id']) && !empty($_POST['id'])) {
        // If ID is provided, update the existing record
        $id = $_POST['id'];
        $update = $conn->query("UPDATE busdetails SET busname = '$busname', busno = '$busno', rcbook = '$rcbook' WHERE id = $id");
        if ($update) {
            echo 1;
        }
    } else {
        // If ID is not provided, insert a new record
        $insert = $conn->query("INSERT INTO busdetails SET busname = '$busname', busno= '$busno', rcbook = '$rcbook'");
        if ($insert) {
            echo 1;
        }
    }
} else {
    // Return an error code (adjust as needed)
    echo "Error: Required fields are empty";
}

?>