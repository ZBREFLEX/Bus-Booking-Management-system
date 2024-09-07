<section id="bg-bus" class="d-flex align-items-center">
<main id="main">
	<div class="container" style="height: 450px; overflow-y: auto;">
		<div class="col-lg-12">
			<?php  if(isset($_SESSION['login_id'])): ?>
			<div class="row">
				<div class="col-md-12">
					<button class="float-right btn btn-primary btn-sm" type="button" id="new_busdetail">Add New <i class="fa fa-plus"></i></button>
				</div>
			</div>
		<?php endif; ?>
			<div class="row">
				&nbsp;
			</div>
			<div class="row">
				<div class="card col-md-12">
					<div class="card-header">
						<div class="card-title">Bus Details</div>
					</div>
					<div class="card-body">
						<table class="table table-striped table-bordered" id="busdetail-field">
							<thead>
								<tr>
									<th class="text-center">#</th>
									<th class="text-center">Bus Name</th>
									<th class="text-center">Bus Number</th>
									<th class="text-center">RC Book no</th>
									<th class="text-center">Action</th>
								</tr>
							</thead>
							<tbody>
								
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		
	</div>
</main>
</section>
<script>
	$('#new_busdetail').click(function(){
		uni_modal('Add New busdetail','manage_busdetail.php')
	})
	window.load_busdetail = function(){
		$('#busdetail-field').dataTable().fnDestroy();
		$('#busdetail-field tbody').html('<tr><td colspan="5" class="text-center">Please wait...</td></tr>')
		$.ajax({
			url:'load_busdetail.php',
			error:err=>{
				console.log(err)
				alert_toast('An error occured.','danger');
			},
			success:function(resp){
				if(resp){
					if(typeof(resp) != undefined){
						resp = JSON.parse(resp)
							if(Object.keys(resp).length > 0){
								$('#busdetail-field tbody').html('')
								var i = 1 ;
								Object.keys(resp).map(k=>{
									var tr = $('<tr></tr>');
									tr.append('<td class="text-center">'+(i++)+'</td>')
									tr.append('<td class="text-center">'+resp[k].busname+'</td>')
									tr.append('<td>'+resp[k].busno+'</td>')
									tr.append('<td>'+resp[k].rcbook+'</td>')
									if('<?php echo isset($_SESSION['login_id']) ? 1 : 0 ?>' == 1){
										tr.append('<td><center><button class="btn btn-sm btn-primary edit_location mr-2" data-id="'+resp[k].id+'">Edit</button><button class="btn btn-sm btn-danger remove_location" data-id="'+resp[k].id+'">Delete</button></center></td>')
									}else{
										tr.append('<td><center><a class="btn btn-sm btn-primary mr-2 text-white" href="#"><strong>Book Now</strong></a></center></td>')
									}
									$('#busdetail-field tbody').append(tr)

								})

							}else{
								$('#busdetail-field tbody').html('<tr><td colspan="5" class="text-center">No data.</td></tr>')
							}
					}
				}
			},
			complete:function(){
				$('#busdetail-field').dataTable()
				manage();
			}
		})
	}
	function manage(){
		$('.edit_location').click(function(){
		uni_modal('Edit New Location','manage_busdetail.php?id='+$(this).attr('data-id'))

		})
		$('.remove_location').click(function(){
		_conf('Are you sure to delete this data?','remove_location',[$(this).attr('data-id')])

		})
	}
	function remove_location($id=''){
		start_load()
		$.ajax({
			url:'delete_busdetail.php',
			method:'POST',
			data:{id:$id},
			error:err=>{
				console.log(err)
				alert_toast("An error occured","danger");
				end_load()
			},
			success:function(resp){
				if(resp== 1){
					alert_toast("Data succesfully deleted","success");
					end_load()
					$('.modal').modal('hide')
					load_busdetail()
				}
			}
		})
	}
	$(document).ready(function(){
		load_busdetail()
	})
</script>