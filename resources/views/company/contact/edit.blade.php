@extends('layouts.admin_template')

@section('content')
 <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">Edit User</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Dashboard</a></li>
              <li class="breadcrumb-item active">Users</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
     <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <!-- left column -->
          <div class="col-md-12">
            <!-- jquery validation -->
            <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title"> Edit <small>user inforamtion</small></h3>
                <!--  <div class="card-tools">
                  <button type="button" class="btn btn-tool" data-card-widget="card-refresh" data-source="widgets.html" data-source-selector="#card-refresh-content">
                    <i class="fas fa-sync-alt"></i>
                  </button>
                </div> -->
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form id="updateUserForm" action="{{ route('user.update',['id'=>$userData->id]) }}" method="post" novalidate="novalidate">
                <input type="hidden" name="user_id" value="{{ $userData->id }}">
                <div class="card-body">
                  <div id="ajaxErrors"></div>
                  <div class="form-group">
                    <label for="inputName">Name</label>
                    <input type="text" name="name" class="form-control" id="inputName" placeholder="Enter full name" value="{{ $userData->name }}">
                  </div>
                  <div class="form-group">
                    <label for="inputEmail">Email address</label>
                    <input type="email" name="email" class="form-control" id="inputEmail" placeholder="Enter email" value="{{ $userData->email }}">
                  </div>
                  <div class="form-group">
                    <label for="inputRole">Role</label>
                    <select class="form-control select2" name="role_id" id="inputRole"  style="width: 100%;">
                      <option value="">Select User Role</option>
                     <?php
                     foreach ($userRoles as $key => $role) { ?>
                       <option value="{{ $role->role_id }}" {{ $userData->role_id== $role->role_id ? 'selected' : '' }} > {{ $role->role_name }}</option>
                     <?php }
                     ?>
                    </select>
                  </div>
                  <!-- <div class="form-group">
                    <label for="inputPassword">Password</label>
                    <input type="password" name="password" class="form-control" id="inputPassword" placeholder="Password" value="{{ $userData->password }}">
                  </div> -->

                </div>
                <!-- /.card-body -->
                <div class="card-footer">
                  <button type="submit" class="btn btn-primary" id="userSubmitBtn">Submit</button>
                </div>
              </form>
            </div>
            <!-- /.card -->
            </div>
          <!--/.col (left) -->
          <!-- right column -->
          <div class="col-md-6">

          </div>
          <!--/.col (right) -->
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->

    <script src="{{ asset('assets/js/pages/company/user.js?').time() }}" type="text/javascript"></script>
    
@endsection

