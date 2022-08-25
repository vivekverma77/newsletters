  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="#" class="brand-link">
      <img src="{{ asset('/bower_components/admin-lte/dist/img/AdminLTELogo.png') }}" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
      <span class="brand-text font-weight-light">NEWS LETTERS</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img src="{{ asset('/bower_components/admin-lte/dist/img/user2-160x160.jpg') }}" class="img-circle elevation-2" alt="User Image">
        </div>
        <div class="info">
          <a href="#" class="d-block">{{ Auth::user()->name }}</a>
        </div>
      </div>

      <!-- SidebarSearch Form -->
      <!-- <div class="form-inline">
        <div class="input-group" data-widget="sidebar-search">
          <input class="form-control form-control-sidebar" type="search" placeholder="Search" aria-label="Search">
          <div class="input-group-append">
            <button class="btn btn-sidebar">
              <i class="fas fa-search fa-fw"></i>
            </button>
          </div>
        </div>
      </div> -->

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
          <li class="nav-item menu-open">
            <a href="{{ route('dashboard') }}" class="nav-link {{ Request::segment(1) == 'dashboard' ? 'active' : '' }}">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>
                Dashboard
              </p>
            </a> 
            @php 
            if(Auth::user()->is_super_admin == 1){ @endphp
               <a href="{{ route('companies') }}" class="nav-link {{ Request::segment(1) == 'companies' ? 'active' : '' }}">
                <i class="nav-icon fas fa-building"></i>
              <p>
                Companies
              </p>
            </a>
            @php } @endphp
            

            @php if(access_check('users')){ @endphp
             <a href="{{ route('users') }}" class="nav-link {{ Request::segment(1) == 'users' ? 'active' : '' }}">
              <i class="nav-icon fas fa-users"></i>
              <p>
                Users
              </p>
            </a>
            @php } @endphp

            @php if(Auth::user()->role_id == 1){ @endphp
              <a href="{{ route('access') }}" class="nav-link {{ Request::segment(1) == 'access' ? 'active' : '' }}">
              <i class="nav-icon fas fa-lock"></i>
              <p>
                Permissions
              </p>
            </a>
             @php } @endphp 

             @php if(access_check('contacts')){ @endphp
             <a href="{{ route('contacts') }}" class="nav-link">
              <i class="nav-icon far fa-address-book"></i>
              <p>
                Contacts
              </p>
            </a>
            @php } @endphp 

            @php if(access_check('terms')){ @endphp
             <a href="" class="nav-link">
              <i class="nav-icon fab fa-pinterest-p"></i>
              <p>
                Terms
              </p>
            </a>
            @php } @endphp 

            @php if(access_check('attributes')){ @endphp
             <a href="" class="nav-link">
              <i class="nav-icon fab fa-creative-commons-by"></i>
              <p>
                Attributes
              </p>
            </a>
            @php } @endphp 

            @php if(access_check('mailings')){ @endphp
             <a href="" class="nav-link">
              <i class="nav-icon fas fa-mail-bulk"></i>
              <p>
                Mailinglists
              </p>
            </a>
            @php } @endphp 

            @php if(access_check('newsletters')){ @endphp
            <a href="" class="nav-link">
              <i class="nav-icon far fa-newspaper"></i>
              <p>
                Newsletters
              </p>
            </a>
           @php } @endphp 
          
          </li>
          
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>