<?php
include('db_connect.php');
if(isset($_GET['id']) && !empty($_GET['id']) ){
	$qry = $conn->query("SELECT * FROM driverdetail where id = ".$_GET['id'])->fetch_array();
	foreach($qry as $k => $val){
		$meta[$k] =  $val;
	}
}
?>
<div class="container-fluid">
	<form id="manage_driverdetail" method="POST">
		<div class="col-md-12">
			<div class="form-group mb-2">
				<label for="d_name" class="control-label">Driver Name</label>
				<input type="hidden" class="form-control" id="id" name="id" value='<?php echo isset($_GET['id']) ? $_GET['id'] : '' ?>' required="">
				<input type="text" class="form-control" id="d_name" name="d_name" required="" value="<?php echo isset($meta['d_name']) ? $meta['d_name'] : '' ?>">
			</div>
			<div class="form-group mb-2">
				<label for="d_address" class="control-label">Driver Address</label>
				<input type="text" class="form-control" id="d_address" name="d_address" required="" value="<?php echo isset($meta['d_address']) ? $meta['d_address'] : '' ?>">
			</div>
			<div class="form-group mb-2">
				<label for="" class="control-label">Driver License</label>
				<input type="text" class="form-control" id="d_license" name="d_license" required="" value="<?php echo isset($meta['d_license']) ? $meta['d_license'] : '' ?>">
			</div>
			<div class="form-group mb-2">
				<label for="" class="control-label">Bus Name</label>
				<input type="text" class="form-control" id="bus_name" name="bus_name" required="" value="<?php echo isset($meta['bus_name']) ? $meta['bus_name'] : '' ?>">
			</div>
			<div class="form-group mb-2">
				<label for="" class="control-label">Bus Number</label>
				<input type="text" class="form-control" id="bus_number" name="bus_number" required="" value="<?php echo isset($meta['bus_number']) ? $meta['bus_number'] : '' ?>">
			</div>
			<div class="form-group mb-2">
				<label for="" class="control-label">Bus Route</label>
				<input type="text" class="form-control" id="bus_route" name="bus_route" required="" value="<?php echo isset($meta['bus_route']) ? $meta['bus_route'] : '' ?>">
			</div>
		</div>
	</form>
</div>
<script>
	$('#manage_driverdetail').submit(function(e){
		e.preventDefault()
		start_load()
		$.ajax({
			url:'./save_driverdetail.php',
			method:'POST',
			data:$(this).serialize(),
			error:err=>{
				console.log(err);
    			end_load();
    			alert_toast('An error occured','danger');
			},
			success:function(resp){
				if(resp == 1){
    				end_load();
    				$('.modal').modal('hide');
    				alert_toast('Data successfully saved','success');
    				load_driverdetail();
				}
			}
		})
	})
</script>