<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{MiConstantes::TITULO}}</title>

    <!-- Scripts -->
 
    <script src="{{ asset('js/app.js') }}"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.js"></script>
    <script src="{{ asset('dist/js/adminlte.js') }}"></script>


    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="{{ asset('plugins/fontawesome-free/css/all.min.css') }}">

    
  <!-- overlayScrollbars -->
  <link rel="stylesheet" href="{{ asset('plugins/overlayScrollbars/css/OverlayScrollbars.min.css') }}">

    <!-- Fonts -->
    <link rel="dns-prefetch" href="//fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">

    <!-- Styles -->
    
    <link href="{{ asset('dist/css/adminlte.min.css') }}" rel="stylesheet">
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">


    
</head>


<body class="hold-transition sidebar-mini layout-fixed">
    <div id="app">
        <div class="wrapper">

            <!-- Navbar -->
            
            <nav class="main-header navbar navbar-expand navbar-white navbar-light">
                <!-- Left navbar links -->
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" data-widget="pushmenu" href="#"><i class="fas fa-bars"></i></a>
                    </li>
                </ul>

                <!-- SEARCH FORM -->
                <form class="form-inline ml-3">
                    <div class="input-group input-group-sm">
                        <input  class="form-control form-control-navbar" type="hidden" placeholder="Search"
                            aria-label="Search" name="search">
                        <div class="input-group-append">
                            <button class="btn btn-navbar" type="submit" style="visibility: hidden;">
                                <i class="fas fa-search"></i>
                            </button>
                        </div>
                    </div>
                </form>

                <!-- Right navbar links -->
                
                <ul class="navbar-nav ml-auto"  >
                   
                    <!-- Notifications Dropdown Menu -->
                    <li class="nav-item dropdown">
                        <a class="nav-link" data-toggle="dropdown" href="#">
                            <i class="far fa-bell"></i>
                            <span class="badge badge-warning navbar-badge">Menu</span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
                            <span class="dropdown-item dropdown-header">Configuraciones</span>
                            <div class="dropdown-divider"></div>
 
                            <div class="dropdown-divider"></div>
                            <a href="/admin/editDatos" class="dropdown-item">
                                <i class="fas fa-solid fa-user mr-2"></i>Datos Personales
                                <span class="float-right text-muted text-sm"></span>
                            </a>

                            <div class="dropdown-divider"></div>
                            <a href="/admin/editPassword" class="dropdown-item">
                                <i class="fas fa-solid fa-user mr-2"></i>Cambiar Contraseña
                                <span class="float-right text-muted text-sm"></span>
                            </a>

                            
                        </div>
                    </li>
                </ul>
                    
            </nav>
            <!-- /.navbar -->

            <!-- Main Sidebar Container -->
            <aside class="main-sidebar sidebar-dark-primary elevation-4 ">
                <!-- Brand Logo -->
                <a href="{{ url('/') }}" class="brand-link">
                    <img src="{{ asset('dist/img/almagrilogo.png') }}" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" >
                    <span class="brand-text font-weight-light">{{MiConstantes::TITULO}}</span>
                </a>
                <!-- Sidebar -->
                <div class="sidebar">
                    <!-- Sidebar user panel (optional) -->
                    <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                        <div class="image">
                        <a href="#" class="search-results-gallery-icon flex flex-column items-center justify-center color-inherit w-100 pa2 br2 br--top no-underline hover-bg-blue4 hover-white">
                            <i class="fas fa-user-alt" style="font-size: 48px;"></i>
                        </a>                    
                    </div>
                    
                        <div class="info">
                            <a href="#" class="d-block">
                                @guest
                                <a class="nav-link" href="{{ route('login') }}">{{ __('Iniciar Sesión') }}</a>
                                @else
                                {{ Auth::user()->name }}
                                <a class="dropdown-item" href="{{ route('logout') }}" onclick="event.preventDefault();
                                           document.getElementById('logout-form').submit();">
                                    <spand style="color:#959e97">Cerrar Sesión</spand>
                                </a>

                                <form id="logout-form" action="{{ route('logout') }}" method="POST"
                                    style="display: none;">
                                    @csrf
                                </form>

                                @endguest
                            </a>
                        </div>
                    </div>

                    <!-- Sidebar Menu -->
                    <nav class="mt-2">
                    <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                            <li class="nav-item">
                                <a href="/" class="{{ Request::path() === '/' ? 'nav-link active' : 'nav-link' }}">
                                    <i class="nav-icon fas fa-home"></i>
                                    <p>Inicio</p>
                                </a>
                            </li>

 <?php  use App\Acta;?>
                            @canany('admin.recepcion.index','admin.despacho.index') 
                            <li class="{{ (Request::path() == 'admin/recepcion' or Request::path() == 'admin/despacho')  ? 'nav-item menu-open' : 'nav-item' }}" >
                                <a href="/admin/recepcion" class="nav-link" >
                                <i class="nav-icon fas fa-edit"></i>
                                <p>
                                Gestión
                                    <i class="fas fa-angle-left right"></i>
                                </p>
                                </a>
                                <ul class="nav nav-treeview">
                                
                                <li class="nav-item">
                                    <a href="/admin/recepcion" class="{{ Request::path() === 'admin/recepcion' ? 'nav-link active' : 'nav-link' }}">
                                    <i class="far fa-circle nav-icon"></i>
                                    <?php
                                    $rack_count = Acta::where('tipo_movimiento_codigo','=', 'INGRESO')->count();?>
                                    <p>Recepcion </p>
                                    <span class="right badge badge-danger">{{ $rack_count ?? '0' }}</span>
                                    </a>
                                </li>



                                <li class="nav-item">
                                    <a href="/admin/despacho" class="{{ Request::path() === 'admin/despacho' ? 'nav-link active' : 'nav-link' }}">
                                    <i class="far fa-circle nav-icon"></i>
                                    <?php
                                    $cant_despacho = Acta::where('tipo_movimiento_codigo','=', 'DESPACHO')->count();?>
                                    <p>Despacho </p>
                                    <span class="right badge badge-danger">{{ $cant_despacho ?? '0' }}</span>
                                    </a>
                                </li>


                                </ul>
                            </li>
                            @endcanany


                            <?php use App\Empresa;


                            $empresa_count = Empresa::all()->count();?>

                            @can('admin.clientes.index') 
                            <li class="nav-item">
                                <a href="/admin/clientes"
                                    class="{{ Request::path() === 'clientes' ? 'nav-link active' : 'nav-link' }}">

                                    <i class="nav-icon fas fa-university"></i>
                                    <p>
                                        Clientes

                                        <span class="right badge badge-danger">{{ $empresa_count ?? '0' }}</span>
                                    </p>
                                </a>
                            </li>
                            @endcan



                            <?php //use App\Producto;
                            //$producto_count = Producto::all()->count();?>

 

                            @can('admin.productos.index') 
                            
                            <li class="nav-item">
                                <a href="/admin/productos"
                                    class="{{ Request::path() === 'productos' ? 'nav-link active' : 'nav-link' }}">
                                    
                                    <i class="nav-icon fas fa-cubes"></i>
                                    <p>
                                        Productos

                                        <span class="right badge badge-danger"></span>
                                    </p>
                                </a>
                            </li>
                            
                            @endcan
                            
                            
 

                            <?php use App\RackCasillas;
                            $casillas_count = RackCasillas::all()->count();

                                        
                            use App\Rack;
                            $rack_count = Rack::all()->count();
                            ?>

                            @canany('admin.casillas.index','admin.racks.index' ) 
                            <li class="{{ (Request::path() == 'admin/racks' or Request::path() == 'admin/casillas')  ? 'nav-item menu-open' : 'nav-item' }}" >
                                <a href="/admin/casillas" class="nav-link" >
                                <i class="nav-icon fas fa-edit"></i>
                                <p>
                                    Almacen
                                    <i class="fas fa-angle-left right"></i>
                                </p>
                                </a>

                                <ul class="nav nav-treeview">
                                
                                    <li class="nav-item">
                                        <a href="/admin/racks" class="{{ Request::path() === 'admin/racks' ? 'nav-link active' : 'nav-link' }}">
                                        <i class="far fa-circle nav-icon"></i>
                              
                                        <p>Racks </p>
                                        <span class="right badge badge-danger">{{ $rack_count ?? '0' }}</span>
                                        </a>
                                    </li>



                                    <li class="nav-item">
                                        <a href="/admin/casillas" class="{{ Request::path() === 'admin/casillas' ? 'nav-link active' : 'nav-link' }}">
                                        <i class="far fa-circle nav-icon"></i>
                                       
                                        <p>Casillas </p>
                                        <span class="right badge badge-danger">{{ $casillas_count ?? '0' }}</span>
                                        </a>
                                    </li>


                                </ul>
                            </li>

                            @endcanany



                            @canany('admin.usuarios.index','admin.roles.index' ) 
                            <li class="{{ (Request::path() == 'admin/roles' or Request::path() == 'admin/usuarios')  ? 'nav-item menu-open' : 'nav-item' }}" >
                                <a href="/admin/casillas" class="nav-link" >
                                <i class="nav-icon fas fa-edit"></i>
                                <p>
                                    CONFIGURACION
                                    <i class="fas fa-angle-left right"></i>
                                </p>
                                </a>

                                <ul class="nav nav-treeview">
                                
                                    <li class="nav-item">
                                        <a href="/admin/usuarios" class="{{ Request::path() === 'admin/usuarios' ? 'nav-link active' : 'nav-link' }}">
                                        <i class="far fa-circle nav-icon"></i>

                                        <p>Usuarios </p>
                                         </a>
                                    </li>



                                    <li class="nav-item">
                                        <a href="/admin/roles" class="{{ Request::path() === 'admin/roles' ? 'nav-link active' : 'nav-link' }}">
                                        <i class="far fa-circle nav-icon"></i>
             
                                        <p>Roles </p>
                                        <span class="right badge badge-danger"></span>
                                        </a>
                                    </li>


 
                                </ul>
                            </li>                            
                            @endrole


                            



                        </ul>
                    </nav>
                    <!-- /.sidebar-menu -->
                </div>
                <!-- /.sidebar -->
            </aside>

            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <div class="content-header">

                </div>
                <!-- /.content-header -->

                <!-- Main content -->
                <section class="content">
                    @yield('content')
                </section>
                <!-- /.content -->
            </div>
            <!-- /.content-wrapper -->
            <footer class="main-footer">
                <!-- NO QUITAR -->
                <strong>Desarrollado por AdeconPeru
                        <div class="float-right d-none d-sm-    -block">
                        <b>Version</b> 1.0
                    </div>
            </footer>

            <!-- Control Sidebar -->
            <aside class="control-sidebar control-sidebar-dark">
                <!-- Control sidebar content goes here -->
            </aside>
            <!-- /.control-sidebar -->
        </div>
    </div>
    @yield('csss')
    @yield('scripts')
<!-- jQuery -->
 
<!-- overlayScrollbars -->
<script src="{{ asset('plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js') }}"></script>
 

</body>
</html>