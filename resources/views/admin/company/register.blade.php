<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Colorlib Templates">
    <meta name="author" content="Colorlib">
    <meta name="keywords" content="Colorlib Templates">

    <!-- Title Page-->
    <title>Newsletters Company Registration</title>
    <link rel="stylesheet" type="text/css" href="{{ asset('/css/register-custom.css') }}">
</head>

<body>
    <div class="page-wrapper bg-gra-03 p-t-45 p-b-50">
        <div class="wrapper wrapper--w790">
            <div class="card card-5">
                <div class="card-heading">
                    <h2 class="title">Newsletters Company Registration</h2>
                </div>
                <div class="card-body">
                    @if ($errors->any())
                        <div class="alert alert-danger">
                            <ul>
                                @foreach ($errors->all() as $error)
                                    <li>{{ $error }}</li>
                                @endforeach
                            </ul>
                        </div>
                    @endif
                    <div id="ajaxErrors">
                        
                    </div>
                    <form method="POST" action="{{ route('company.insert') }}" id="register_company">
                        @csrf
                        <div class="form-row">
                            <div class="name">Company</div>
                            <div class="value">
                                <div class="input-group">
                                    <input class="input--style-5" type="text" name="company" required="">
                                </div>
                            </div>
                        </div>
                         <div class="form-row">
                            <div class="name">Full Name</div>
                            <div class="value">
                                <div class="input-group">
                                    <input class="input--style-5" type="text" name="full_name" required="">
                                </div>
                            </div>
                        </div>

                         <div class="form-row">
                            <div class="name">Domain</div>
                            <div class="value">
                            <div class="row row-space">	
                             <div class="col-2">	
                                <div class="input-group">
                                    <input class="input--style-5" type="text" name="domain" required="">
                                </div>
                              </div>
                              <div class="col-2">
                              	<div class="input-group">
                                    <input class="input--style-5" type="text" name="domain" disabled="" value="{{ '.'.$_SERVER['SERVER_NAME']}}">
                                </div>
                              </div> 
                              </div> 
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="name">Email</div>
                            <div class="value">
                                <div class="input-group">
                                    <input class="input--style-5" type="email" name="email"required="">
                                </div>
                            </div>
                        </div>
                       <div class="form-row">
                            <div class="name">Password</div>
                            <div class="value">
                                <div class="input-group">
                                    <input class="input--style-5" type="password" name="password" required="">
                                </div>
                            </div>
                        </div>
                       
                        <img src="{{ asset('images/Spinner-1s-200px.gif') }}" style="    position: fixed;top: 20%;left: 45%;display: none;" class="loader">
                        <div style="text-align: center;">
                            <button class="btn btn--radius-2 btn--red" id="cregister_btn" type="submit">Register</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>

</html>
<script type="text/javascript" src="{{ asset('/bower_components/admin-lte/plugins/jquery/jquery.min.js') }}"></script>
<script type="text/javascript" src="{{ asset('/bower_components/admin-lte/plugins/jquery-validation/jquery.validate.min.js') }}"></script>
<script src="{{ asset('assets/js/pages/company/register.js?').time() }}" type="text/javascript"></script>
 <!-- end document-->



