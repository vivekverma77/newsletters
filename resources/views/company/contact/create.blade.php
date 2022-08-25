@extends('layouts.admin_template')

@section('content')
 <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">Add User</h1>
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
                <h3 class="card-title"> Add <small>new contact</small></h3>
                <!--  <div class="card-tools">
                  <button type="button" class="btn btn-tool" data-card-widget="card-refresh" data-source="widgets.html" data-source-selector="#card-refresh-content">
                    <i class="fas fa-sync-alt"></i>
                  </button>
                </div> -->
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form id="newContactForm" action="{{ route('contact.store') }}" method="post" novalidate="novalidate">
               <div class="card-body">
                  <div id="ajaxErrors"></div>
                  <div class="row">
                    <div class="col-md-6"> 
                      <div class="form-group">
                        <label for="inputFirstName">First Name</label>
                        <input type="text" name="first_name" class="form-control" id="inputFirstName" placeholder="Enter First Name">
                      </div>
                    </div>
                     <div class="col-md-6"> 
                      <div class="form-group">
                        <label for="inputLastName">Last Name</label>
                        <input type="text" name="last_name" class="form-control" id="inputLastName" placeholder="Enter Last Name">
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-6">   
                      <div class="form-group">
                        <label for="inputEmail">Emails</label>
                        <textarea name="emails" class="form-control" id="inputEmail" placeholder="Example: jon@example.com, doe@example.com"></textarea>
                      </div>
                    </div>
                    <div class="col-md-6">   
                      <div class="form-group">
                        <label for="inputEmail">Tel</label>
                        <input type="text" name="tel" class="form-control" id="inputTel" placeholder="Enter Tel">
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-6">   
                      <div class="form-group">
                        <label for="inputAddress">Address</label>
                        <input type="address" name="address" class="form-control" id="inputAddress" placeholder="Enter Address">
                      </div>
                    </div>
                    <div class="col-md-6">   
                      <div class="form-group">
                        <label for="inputStreet">Street Number</label>
                        <input type="text" name="street_num" class="form-control" id="inputStreet" placeholder="Enter Street Number">
                      </div>
                    </div>
                  </div>  
                  <div class="row">
                    <div class="col-md-6">   
                      <div class="form-group">
                        <label for="inputEmail">City</label>
                        <input type="city" name="city" class="form-control" id="inputCity" placeholder="Enter City">
                      </div>
                    </div>
                    <div class="col-md-6">   
                      <div class="form-group">
                        <label for="inputPostcode">Postcode</label>
                        <input type="text" name="postcode" class="form-control" id="inputPostcode" placeholder="Enter Postcode">
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-6">   
                      <div class="form-group">
                        <label for="inputProvince">Province</label>
                        <input type="province" name="province" class="form-control" id="inputProvince" placeholder="Enter Province">
                      </div>
                    </div>
                    <div class="col-md-6">   
                      <div class="form-group">
                        <label for="inputCountry">Country</label>
                        <input type="country" name="country" class="form-control" id="inputCountry" placeholder="Enter Country">
                      </div>
                    </div>
                  </div>      
                </div>
                <!-- /.card-body -->
       
                <div class="card-footer">
                  <button type="submit" class="btn btn-primary" id="contactSubmitBtn">Submit</button>
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

    <script src="{{ asset('assets/js/pages/company/contact.js?').time() }}" type="text/javascript"></script>
    
@endsection

