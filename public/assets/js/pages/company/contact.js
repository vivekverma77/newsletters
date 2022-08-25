$(function () {

	$.ajaxSetup({
	    headers: {
	        "X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr("content")
	    }
	});
    
    var table = $('#contacts_table').DataTable({
        processing: true,
        serverSide: true,
        ajax: "/contacts/view",
        columns: [
            {data: 'DT_RowIndex', name: 'DT_RowIndex'},
            {data: 'first_name', name: 'first_name'},
            {data: 'last_name', name: 'last_name'},
            {data: 'emails', name: 'emails', orderable: false,searchable: false},
            {data: 'tel', name: 'tel'},
            {data: 'created_at', name: 'created_at'},
            {
                data: 'action', 
                name: 'action', 
                orderable: false, 
                searchable: false
            },
        ]
    });

    var form = $( "#newContactForm" );
    $(form).validate({
      rules: {
        first_name:{required:true},
        last_name:{required:true},
        email: {
          required: true,
        },
      },
      messages: {
        first_name:{required:"Please enter a First Name"},
        last_name:{required:"Please enter a Last Name"},
        email: {
          required: "Please enter a email address",
        },
      },
      errorElement: 'span',
      errorPlacement: function (error, element) {
        error.addClass('invalid-feedback');
        element.closest('.form-group').append(error);
      },
      highlight: function (element, errorClass, validClass) {
        $(element).addClass('is-invalid');
      },
      unhighlight: function (element, errorClass, validClass) {
        $(element).removeClass('is-invalid');
      },
      submitHandler: function () {
        save();
      }
    });
    // Save contact data
    function save(){
        $('.loader').show();
        var formData = new FormData(form[0]);
        $.ajax({
           type:'POST',
           url:form.attr('action'),
           dataType:'json',
           data:formData,
           cache: false,
           processData: false,
           contentType : false,
           success:function(response){
             // alert(data.reponse);
            $('.loader').hide(); 
            if(response.status=='success'){
                window.location.href = response.redirect_url;
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

     // get user role accesses
    function getAccess(role_id){
        $('.loader').show();
        $.ajax({
           type:'POST',
           url:'/access/get',
           dataType:'json',
           data:{"_token": $('input[name="_token"]').val(),role_id:role_id},
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