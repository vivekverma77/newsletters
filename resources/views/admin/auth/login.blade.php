<style type="text/css">
  body {background: linear-gradient(to top right,#08aeea 0,#b721ff 100%);}
  .login-logo a{color: #fff !important;}
</style>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Newslettes |Admin Log in</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="{{ asset("/bower_components/admin-lte/plugins/fontawesome-free/css/all.min.css") }}">
  <!-- icheck bootstrap -->
  <link rel="stylesheet" href="{{ asset("/bower_components/admin-lte/plugins/icheck-bootstrap/icheck-bootstrap.min.css") }}">
  <!-- Theme style -->
  <link rel="stylesheet" href="{{ asset("/bower_components/admin-lte/dist/css/adminlte.min.css") }}">
</head>
<body class="hold-transition login-page">
<div class="login-box">
  <div class="login-logo">
    <a href=""><b>News</b>Letters</a>
  </div>
  <!-- /.login-logo -->
  <div class="card">
    <div class="card-body login-card-body">
      <p class="login-box-msg">Admin Sign in</p>
     
      <form action="{{ route('admin.login') }}" method="post">
          @csrf
         @if ($errors->has('email'))
            <span class="text-danger">{{ $errors->first('email') }}</span>
            @endif  
        <div class="input-group mb-3">
          <input type="email" class="form-control" placeholder="Email" name="email">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-envelope"></span>
            </div>
          </div>
        </div>
        
         @if ($errors->has('password'))
            <span class="text-danger">{{ $errors->first('password') }}</span>
            @endif    
        <div class="input-group mb-3">
          <input type="password" class="form-control" placeholder="Password" name="password">
           
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-8">
            <div class="icheck-primary">
              <input type="checkbox" id="remember" name="remember">
              <label for="remember">
                Remember Me
              </label>
            </div>
          </div>
          <!-- /.col -->
          <div class="col-4">
            <button type="submit" class="btn btn-primary btn-block">Sign In</button>
          </div>
          <!-- /.col -->
        </div>

      </form>
     @foreach ($errors->all() as $error)
         <div class="alert alert-danger">{{ $error }}</div>
      @endforeach
    </div>
    <!-- /.login-card-body -->
  </div>
</div>
<!-- /.login-box -->

<!-- jQuery -->
<script src="{{ asset("/bower_components/admin-lte/plugins/jquery/jquery.min.js") }}"></script>
<!-- Bootstrap 4 -->
<script src="{{ asset("/bower_components/admin-lte/plugins/bootstrap/js/bootstrap.bundle.min.js") }}"></script>
<!-- AdminLTE App -->
<script src="{{ asset("/bower_components/admin-lte/dist/js/adminlte.min.js") }}"></script>
</body>
</html>
