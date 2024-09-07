<?php
include('db_connect.php');
if(isset($_GET['id']) && !empty($_GET['id']) ){
	$qry = $conn->query("SELECT * FROM busdetails where id = ".$_GET['id'])->fetch_array();
	foreach($qry as $k => $val){
		$meta[$k] =  $val;
	}
}
?>
<div class="container-fluid">
	<form id="manage_busdetails">
		<div class="col-md-12">
			<div class="form-group mb-2">
				<label for="busname" class="control-label">Bus Name</label>
				<input type="hidden" class="form-control" id="id" name="id" value='<?php echo isset($_GET['id']) ? $_GET['id'] : '' ?>' required="">
				<input type="text" class="form-control" id="busname" name="busname" required="" value="<?php echo isset($meta['busname']) ? $meta['busname'] : '' ?>">
			</div>
			<div class="form-group mb-2">
				<label for="busno" class="control-label">Bus Number</label>
				<input type="text" class="form-control" id="busno" name="busno" required="" value="<?php echo isset($meta['busno']) ? $meta['busno'] : '' ?>">
			</div>
			<div class="form-group mb-2">
				<label for="rcbook" class="control-label">RC book</label>
				<input type="text" class="form-control" id="rcbook" name="rcbook" required="" value="<?php echo isset($meta['rcbook']) ? $meta['rcbook'] : '' ?>">
			</div>
		</div>
	</form>
</div>
<script>
	$('#manage_busdetails').submit(function(e){
		e.preventDefault()
		start_load()
		$.ajax({
			url:'./save_busdetail.php',
			method:'POST',
			data:$(this).serialize(),
			error:err=>{
				console.log(err)
    			end_load()
    			alert_toast('An error occured','danger');
			},
			success:function(resp){
				if(resp == 1){
    				end_load()
    				$('.modal').modal('hide')
    				alert_toast('Data successfully saved','success');
    				load_busdetail()
				}
			}
		})
	})
</script>