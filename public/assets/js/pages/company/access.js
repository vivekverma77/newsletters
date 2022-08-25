$(function () {
	$.ajaxSetup({
	    headers: {
	        "X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr("content")
	    }
	});
	//Initialize Select2 Elements
    $('.select2').select2({minimumResultsForSearch: -1});

    getAccess($('#inputRole').val());

    $('#inputRole').change(function(){ getAccess($('#inputRole').val()); });

    $(document).on('click','.change_access',function(){  
    	var access_id = $(this).closest('tr').find('.access_id').val();
    	editAccess(access_id);
    });

    $(document).on('click','#update_access',function(){  
    	updateAccess();
    });

     // get user role accesses
    function getAccess(role_id){
        $('.loader').show();
        $.ajax({
           type:'POST',
           url:'/access/get',
           dataType:'json',
           data: {role_id:role_id},
           success:function(response){
             // alert(data.reponse);
            $('.loader').hide(); 
            if(response.status=='success'){
            	$('#ajaxLoad').html(response.html);
            }
           },
           error:function(response){
              $('.loader').hide();
              var response = response.responseJSON;
              var html = '';
              html = '<div class="alert alert-danger" role="alert">'+response.message;
              if(response.errors){
                html += '<ul>';
                $.each(response.errors,function(i,er){
                    html += '<li>'+er+'</li>';   
                });     
                html += '</ul>';
              }
              html += '</div>';
             $('#ajaxErrors').html(html);
           }

        });
    }
     // Edit user access
    function editAccess(access_id){
        $('.loader').show();
        $.ajax({
           type:'GET',
           url:'/access/edit/'+access_id,
           dataType:'json',
           data:{"_token": $('input[name="_token"]').val(), access_id:access_id },
           success:function(response){
             // alert(data.reponse);
            $('.loader').hide(); 
            if(response.status=='success'){
            	$('#ajaxEdit').html(response.html);
            }
           },
           error:function(response){
              $('.loader').hide();
              var response = response.responseJSON;
              var html = '';
              html = '<div class="alert alert-danger" role="alert">'+response.message;
              if(response.errors){
                html += '<ul>';
                $.each(response.errors,function(i,er){
                    html += '<li>'+er+'</li>';   
                });     
                html += '</ul>';
              }
              html += '</div>';
             $('#ajaxErrors').html(html);
           }
       });
    }
     //Delete user data
	function updateAccess(){
		var form = $('#accessEditForm');
		var formData = new FormData(form[0]);
        $.ajax({
           type:'POST',
           url:form.attr('action'),
           dataType:'json',
           data: formData,
	       cache: false,
	       processData: false,
	       contentType : false,
           success:function(response){
            if(response.status=='success'){
               $('#modal-info').modal('hide');	
               Swal.fire(
                  'Updated!',
                   response.message,
                  'success'
                );
               getAccess($('#inputRole').val());
            }
           },
           error:function(response){
              $('.loader').hide();
              var response = response.responseJSON;
              var html = '';
              html = '<div class="alert alert-danger" role="alert">'+response.message;
              if(response.errors){
                html += '<ul>';
                $.each(response.errors,function(i,er){
                    html += '<li>'+er+'</li>';   
                });     
                html += '</ul>';
              }
              html += '</div>';
           }
        });

	  }
});