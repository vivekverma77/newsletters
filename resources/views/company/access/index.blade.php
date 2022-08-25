@extends('layouts.admin_template')

@section('content')
 <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">Permissions</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Dashboard</a></li>
              <li class="breadcrumb-item active">access</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">All User Role Permissions</h3>                          
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <div id="ajaxErrors"></div>
                <div class="form-group">
                    <label for="inputRole">Role</label>
                    <select class="form-control select2" name="role" id="inputRole"  style="width: 30%;">
                     <?php
                     foreach ($userRoles as $key => $role) { ?>
                       <option value="{{ $role->role_id }}">{{ $role->role_name }}</option>
                     <?php }
                     ?>
                    </select>
                </div>
                <div id="ajaxLoad">
                  
                </div>
             </div>
           </div>
         </div>
       </div>
     </div>
    </section>
    <!-- /.modal -->
    <div class="modal fade" id="modal-info">
      <div class="modal-dialog">
        <div class="modal-content bg-info">
          <div class="modal-header">
            <h4 class="modal-title">Change Access</h4>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
            <div class="modal-body">
              <div id="ajaxEdit"></div>
            </div>
          <div class="modal-footer justify-content-between">
            <button type="button" class="btn btn-outline-light" data-dismiss="modal">Close</button>
            <button type="button" id="update_access" class="btn btn-outline-light">Save changes</button>
          </div>
        </div>
        <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
    </div>
      <!-- /.modal -->
    <script src="{{ asset('assets/js/pages/company/access.js?').time() }}" type="text/javascript"></script>
@endsection

