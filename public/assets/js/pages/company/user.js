 var table;
$(function () {
    
     table = $('#users_table').DataTable({
        processing: true,
        serverSide: true,
        ajax: "/users/view",
        columns: [
            {data: 'DT_RowIndex', name: 'DT_RowIndex'},
            {data: 'name', name: 'name'},
            {data: 'email', name: 'email'},
            {data: 'role_name', name: 'role_name'},
            {data: 'created_at', name: 'created_at'},
            {
                data: 'action', 
                name: 'action', 
                orderable: false, 
                searchable: false
            },
        ]
    });
  
   //Initialize Select2 Elements
    $('.select2').select2({minimumResultsForSearch: -1})

    var form = $( "#newUserForm" );
    $(form).validate({
      rules: {
        name:{required:true},
        email: {
          required: true,
          email: true,
        },
        password: {
          required: true,
          minlength: 5
        },
        role:{required:true},
      },
      messages: {
        name:{required:"Please enter a name"},
        email: {
          required: "Please enter a email address",
          email: "Please enter a vaild email address"
        },
        role:{required:"Please select a role"},
        password: {
          required: "Please provide a password",
          minlength: "Your password must be at least 5 characters long"
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

    // Save user data
    function save(){
        $('.loader').show();
        var name = $("input[name=name]").val();
        var email = $("input[name=email]").val();
        var role_id = $("#inputRole").val();
        var password = $("input[name=password]").val();
        $.ajax({
           type:'POST',
           url:form.attr('action'),
           dataType:'json',
           data:{"_token": $('input[name="_token"]').val(),name:name,email:email,role_id:role_id, password:password},
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

    var form2 = $( "#updateUserForm" );
    $(form2).validate({
      rules: {
        name:{required:true},
        email: {
          required: true,
          email: true,
        },
        role:{required:true},
      },
      messages: {
        name:{required:"Please enter a name"},
        email: {
          required: "Please enter a email address",
          email: "Please enter a vaild email address"
        },
        role:{required:"Please select a role"},
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
        update();
      }
    });
    // Update user data
    function update(){
        $('.loader').show();
        var name = $("input[name=name]").val();
        var email = $("input[name=email]").val();
        var role_id = $("#inputRole").val();
        $.ajax({
           type:'POST',
           url:form2.attr('action'),
           dataType:'json',
           data:{"_token": $('input[name="_token"]').val(),name:name,email:email,role_id:role_id},
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
});
 //Delete user data
function rowDelete(id){
    Swal.fire({
      title: 'Are you sure want to delete this user ?',
      text: "You won't be able to revert this!",
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Yes, delete it!'
    }).then((result) => {
      if (result.isConfirmed) {
        $.ajax({
           type:'POST',
           url:'/user/delete',
           dataType:'json',
           data:{"_token": $('input[name="_token"]').val(),"id":id},
           success:function(response){
            if(response.status=='success'){
               Swal.fire(
                  'Deleted!',
                   response.message,
                  'success'
                );
               table.draw();
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
}