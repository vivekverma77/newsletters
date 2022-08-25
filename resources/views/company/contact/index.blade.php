@extends('layouts.admin_template')

@section('content')
 <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">Contacts</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Dashboard</a></li>
              <li class="breadcrumb-item active">Contacts</li>
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
                <h3 class="card-title">All Contacts</h3> 
                 <a href="{{ route('contact.create') }}" class="btn btn-primary" style="float:right;">Add Contact</a>                          
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <table id="contacts_table" class="table table-bordered table-hover">
                 <thead>
                  <tr>
                    <th>ID</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Emails</th>
                    <th>Tel</th>
                    <th>Created At</th>
                    <th>Actions</th>
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
    </section>
    <script src="{{ asset('assets/js/pages/company/contact.js?').time() }}" type="text/javascript"></script>
@endsection

