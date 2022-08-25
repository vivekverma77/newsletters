$(document).ready(function () {
    var form = $( "#register_company" );
    $(form).validate({ 
        errorLabelContainer: "#cs-error-note",
        wrapper: "li",
        rules: {
            domain: {
                required: true,
                remote: {
                    url: "/company/checkDomain",
                    type: "post",
                    data:{ "_token": $('input[name="_token"]').val()},
                    dataType: 'json'
                 }
            },
            email: {
                required: true,
                remote: {
                    url: "/company/checkEmail",
                    type: "post",
                    data:{ "_token": $('input[name="_token"]').val()},
                    dataType: 'json'
                 }
            },
           password:{required:true,minlength:5}  
        },
        messages: {
            email: {
                required: "Please enter your email address.",
                email: "Please enter a valid email address.",
                remote:"Email is already exists."
            },
            domain:{
                required:"Please enter domain name.",
                remote: "Domain is already taken."
            },
            company: {
                required: "Please enter your company name.",
            },
            full_name: {
                required: "Please enter your full name.",
            },
            password: {required: "Please enter password."}
        },
         submitHandler: function (form) {
              regsiter();
          }
    });

   function regsiter(){
        $('.loader').show();
        var company = $("input[name=company]").val();
        var password = $("input[name=password]").val();
        var email = $("input[name=email]").val();
        var full_name = $("input[name=full_name]").val();
        var domain = $("input[name=domain]").val();
        $.ajax({
           type:'POST',
           url:form.attr('action'),
           dataType:'json',
           data:{"_token": $('input[name="_token"]').val(),full_name:full_name, password:password, email:email,company:company,domain:domain},
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