<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="generator" content="designingsolutions.com.co">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">
    <link rel="shortcut icon" href="{{Voyager::image(setting('site.favicon'))}}" type="image/x-icon">
    <meta name="description" content="{{setting('site.description')}}">
    <meta name="image" content="storage/{{setting('site.logo')}}">
    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>{{setting('site.title')}}</title>
    <link rel="stylesheet" href="{{asset('assets/icon54-v4/style.css')}}">
    <link rel="stylesheet" href="{{asset('assets/icon54-v2/style.css')}}">
    <link rel="stylesheet" href="{{asset('assets/bootstrap-material-design-font/css/material.css')}}">
    <link rel="stylesheet" href="{{asset('assets/font-awesome/css/font-awesome.css')}}">
    <link rel="stylesheet" href="{{asset('assets/icons-mind/style.css')}}">
    <link rel="stylesheet" href="{{asset('assets/web/assets/mobirise-icons2/mobirise2.css')}}">
    <link rel="stylesheet" href="{{asset('assets/web/assets/mobirise-icons/mobirise-icons.css')}}">
    <link rel="stylesheet" href="{{asset('assets/tether/tether.min.css')}}">
    <link rel="stylesheet" href="{{asset('assets/facebook-plugin/style.css')}}">
    <link rel="stylesheet" href="{{asset('assets/bootstrap/css/bootstrap.min.css')}}">
    <link rel="stylesheet" href="{{asset('assets/bootstrap/css/bootstrap-grid.min.css')}}">
    <link rel="stylesheet" href="{{asset('assets/bootstrap/css/bootstrap-reboot.min.css')}}">
    <link rel="stylesheet" href="{{asset('assets/dropdown/css/style.css')}}">
    <link rel="stylesheet" href="{{asset('assets/socicon/css/styles.css')}}">
    <link rel="stylesheet" href="{{asset('assets/animatecss/animate.min.css')}}">
    <link rel="stylesheet" href="{{asset('assets/theme/css/style.css')}}">
    <link rel="stylesheet" href="{{asset('assets/wowslider-init/style.css')}}">
    <link rel="stylesheet" href="{{asset('assets/recaptcha.css')}}">
    <link rel="preload" as="style" href="{{asset('assets/mobirise/css/mbr-additional.css')}}">
    <link rel="stylesheet" href="{{asset('assets/mobirise/css/mbr-additional.css')}}" type="text/css">
    <link rel="stylesheet" href="{{asset('assets/formstyler/jquery.formstyler.css')}}">
    <link rel="stylesheet" href="{{asset('assets/formstyler/jquery.formstyler.theme.css')}}">
    <link rel="stylesheet" href="{{asset('assets/datepicker/jquery.datetimepicker.min.css')}}">
    <link rel="stylesheet" href="{{('assets/wowslider-init/boundary/style.css')}}">
    <!-- <link rel="stylesheet" href="fonts.css"> -->
    <style type="text/css">
      .shopItemsModal_wraper{
        left: 0px;
      }
    </style>
    <style type="text/css">
         .popover-cart{
             top: 1em;
             margin-left: auto;
             z-index: 999999;
             position: fixed;
             bottom: 0;
             right: 0;
             width: 250px;
             height: fit-content;
             color: #f6f6f6;
             background-color: #149dcc !important;
             border-color: #c3e6cb;
             text-align: center;
             border-radius: 5px;
             margin-right: 0px;
             padding: 10px;
             display: none;
         }
         .popover-cart.success a{
            font-weight: 600;
            color: white;
            text-decoration: underline;
            cursor: pointer;
            align-content: center;
            text-align: center;
         }
         .popover-cart.error{
             color: #f6f6f6;
             background-color: red;
             border-color: red;
             text-align: center;
             border-radius: 5px;
             margin-right: 10px;
             padding: 20px;
             display: none;
         }
         .go-to-cart{
             border-radius: 100%;
             color: #f6f6f6 !important;
             background-color: #ff6f00;
             border-color: transparent;
             margin: 2%;
             z-index: 999999;
             position: fixed;
             top: 85%;
             height: 50px;
             right: 0;
             font-size: 1.5rem !important;
             width: 50px;
             padding: 10px 12px;
             @if(isset($cart)) @if($cart == 0) display: none; @endif @endif
         }
         .mbr-gallery-item:hover .btnDescription{
             display:none;
             
         }
         @media only screen and (max-width: 434px) {
          .barraRight, .barraLeft {
                float: inherit !important;
                margin: auto !important;
          }
        }
        .mobile.carousel-item.slider-fullscreen-image {
                display: none;
          }
        @media only screen and (max-width: 991px) {
           .mobile.carousel-item.slider-fullscreen-image {
                display: block;
          }
          .desktop.carousel-item.slider-fullscreen-image {
                display: none;
          }
        }
        
        @media only screen and (min-width: 991px) {
           .fafafa {
                        max-height: 83vh;
    overflow-y: auto;
    top: -35% !important;
    
          }
        }
        .float{
	position:fixed;
	width:60px;
	height:60px;
	bottom:40px;
	left:40px;
	background-color:#25d366;
	color:#FFF;
	border-radius:50px;
	text-align:center;
  font-size:30px;
	box-shadow: 2px 2px 3px #999;
  z-index:100;
}

.my-float{
	margin-top:16px;
}
      </style>
  @yield('css')
</head>
<body>
@if (session('error'))
  <div class="alert alert-designin">
      {{ session('error') }}
  </div>
@endif
@if (session('success'))
    <div class="alert alert-designin success">
        {{ session('success') }}
    </div>
@endif
  <!-- Header -->

  <section class="extMenu5 menu cid-rQT0rLQRej" once="menu" id="extMenu2-0">

    

    <nav class="navbar navbar-dropdown align-items-center navbar-fixed-top navbar-toggleable-sm">
        <div class="menu-content-top">



            <div class="menu-content-right">
                <div class="info-widget">
                    <span class="widget-icon mbr-iconfont socicon-whatsapp socicon" style="color: rgb(255, 255, 255); fill: rgb(255, 255, 255);"></span>
                    <div class="widget-content display-4">
                        <p class="widget-title mbr-fonts-style display-4">+ (57) 312 587 49 34</p>
                    </div>
                </div>
                <div class="info-widget">
                    <span class="widget-icon mbr-iconfont mobi-mbri-phone mobi-mbri" style="color: rgb(255, 255, 255); fill: rgb(255, 255, 255);"></span>
                    <div class="widget-content display-4">
                        <p class="widget-title mbr-fonts-style display-4">253 3180 / 613 1055 / 492 9950</p>
                    </div>
                </div>
                <div class="info-widget">
                    <span class="widget-icon mbr-iconfont mbri-letter" style="color: rgb(255, 255, 255); fill: rgb(255, 255, 255);"></span>
                    <div class="widget-content mbr-fonts-style">
                        <p class="widget-title display-4">contacto@nortenajamones.com</p>
                    </div>
                </div>
                <div class="card-wrapper info-widget mbr-fonts-style mbr-white display-7" style="text-align: left;display: inline-block;padding-left: 1rem;">
                  <form action="/resultados" method="POST" class="mbr-form">
                    {{csrf_field()}}
                      <input @if(isset($search)) value="{{$search}}" @endif type="search" name="search" class="field special-form display-7" placeholder="Buscar" style="font-size: .9rem;height: 2rem;border: 0px solid;border-radius: 5px;width: 70%;margin-right: .6rem;padding: .0rem 1rem; max-width:70vw;">
                      <button class="btn btn-form btn-primary display-4" style="    margin-left: -17px;height: 2rem;width: 50px;z-index: 9999999;border-color: white !important;padding: 0;padding-left: 6px;margin-bottom: 0;margin-top: 0;"> 
                        <span class="p-2 mbr-iconfont mbri-search" style="    padding: 0 !important;font-size: 1rem;"></span>
                      </button>
                    
                  </form>
              </div>
                











            </div>
        </div>
        <div class="menu-bottom">


            <div class="menu-logo">
                <div class="navbar-brand">
                    <span class="navbar-logo">
                        <a href="index.html">
                            <img src="assets/images/xycdi11704.png" alt="" title="" style="height: 4.5rem;">
                        </a>
                    </span>
                    
                </div>
            </div>



            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav nav-dropdown js-float-line nav-right" data-app-modern-menu="true"><li class="nav-item">
                        <a class="nav-link link mbr-black text-secondary display-4" href="{{url('/')}}">INICIO</a>
                    </li>
                    

                    

                    <li class="nav-item dropdown">
                        <a class="nav-link link mbr-black dropdown-toggle text-secondary display-4" href="#" data-toggle="dropdown-submenu" aria-expanded="false">
                            NOSOTROS</a><div class="dropdown-menu"><a class="mbr-black dropdown-item text-secondary display-4" href="{{url('quienes-somos')}}">QUIÉNES SOMOS</a>
                              <a class="mbr-black dropdown-item text-secondary display-4" href="{{url('politica-calidad')}}" aria-expanded="false">POLÍTICA DE CALIDAD</a>
                              <a class="mbr-black dropdown-item text-secondary display-4" href="{{asset('assets/files/politica-de-proteccion.pdf')}}" aria-expanded="false" target="_blank">POLÍTICA USO DATOS PERSONALES</a></div>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link link mbr-black dropdown-toggle text-secondary display-4" href="#" data-toggle="dropdown-submenu" aria-expanded="false">CATEGORIAS</a>
                        <div class="dropdown-menu">
                          @foreach (App\Brandscategory::where('show_on_front', 1)->orderBy('order', 'asc')->get() as $category)
                          <a class="mbr-black dropdown-item text-secondary display-4" href="{{ url('/category/'.$category->slug.'') }}">{{ $category->name }}</a>
                          @endforeach
                          
                        </div>
                    </li>
                    <li class="nav-item"><a class="nav-link link mbr-black text-secondary display-4" href="#">
                            BLOG</a></li>
    
                            <li class="nav-item">
                              <div class="barraRight card-wrapper  mbr-fonts-style mbr-black display-7" style=" margin-right: 100px; display: inline-block; float: right;padding: .5rem 0;">
                                <div class="icons-menu" style="display: -webkit-flex;padding-left: 1rem;text-align: center; font-size: .9rem;border: 0px solid;border-radius: 5px;margin-right: .1rem;padding: .5rem 1rem;">
                                    <div class="soc-item">
                                        @if(!Auth::guest())
                             
                                        <ul class="navbar-nav nav-dropdown" data-app-modern-menu="true">
                                          <li class="nav-item dropdown">
                                          <a class="nav-link text-black link dropdown-toggle display-4" style="color:black;" href="#!" data-toggle="dropdown-submenu" aria-expanded="false">
                                           Hola {{auth()->user()->name}}!</a>
                                           <div class="dropdown-menu">
                                            <a class="text-black dropdown-item display-4"  href="{{ route('home') }}">Mis Pedidos</a>
                                            <a class="text-black dropdown-item display-4"  href="{{ route('profile.index') }}">Perfil</a>
                                            <a class="text-black dropdown-item  display-4" href="{{ route('logout') }}"
                                                  onclick="event.preventDefault();
                                                                document.getElementById('logout-form').submit();">
                                                  Salir
                                              </a>
                      
                                              <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                                                  @csrf
                                              </form>
                                          </div>
                                        </li>
                                        </ul>
                                 
                                  @else
                               
                                     <a class="nav-link link text-black display-4 align-center" href="{{ route('login') }}">
                                                            Ingresar</a>
                                 
                                  @endif
                                      <!--a href="/ingresar">
                                        <span class="mbr-iconfont mbri-login" style="color: rgb(255, 255, 255); fill: rgb(255, 255, 255);"></span-->
                                      </a>
                                    </div>
                                    
                                    
                                    
                                    
                                  </div>
                              </div>
                            </li>
                            <li class="nav-item">
                              <div class="soc-item">
                                <a href="/cart" class="nav-link link mbr-black text-secondary display-4">  
                                  <span class="fa fa-shopping-bag mbr-iconfont mbr-iconfont-btn" style="color: rgb(0, 0, 0); fill: rgb(0, 0, 0);"></span>
                                  <span class="contador text-center" style="@if(Cart::count() == 0)display:none;@endif position: relative;color: white;width: 25px; height: 25px; padding: 2px;font-weight: bold;margin-left: 0px;margin-top: 0px; background-color:rgb(204, 23, 23); font-size: 0.7rem;">{{ Cart::count() }}</span>
                                </a>
                                {{-- comment 
                                
                                <a href="/cart" class="go-to-cart">
                                  <span class="contador" style="@if(Cart::count() == 0)display:none;@endif position: absolute;color: white;border-radius: 35px;width: 25px; height: 25px;font-size: 0.8rem;padding-left: -10px;padding-top: 2px;font-weight: bold;margin-left: 14px;margin-top: -10px; background-color:rgb(204, 23, 23)"> {{ Cart::count() }}</span>
                                  <span class="mbri-shopping-cart"></span>
                                </a>
                                --}}
                                <span class="popover-cart success pr-0 pl-0 text-center">
                                      
                                      <a class="p-0 m-0 text-center" href="/cart">Pagar</a>
                                </span>
                                <span class="popover-cart error">
                                      <div>OPS, intentelo nuevamente</div>
                                </span>
                              </div>
                            </li>

                            {{-- comment 
                            <li class="nav-item">
                              <div class="text-center">
                                <button type="button" class="btn btn-demo" data-toggle="modal" data-target="#exampleModal">
                                    Left Sidebar Modal
                                </button>
                            </div>
                            </li>
                            --}}
                            
                          </ul>

                

            </div>
            
            <button class="navbar-toggler " type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <div class="hamburger">
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                </div>
            </button>







        </div>
    </nav>
</section>


{{-- comment 

  <section class="menu popup-btn-cards cid-rf5Gg8AsWK" once="menu" id="menu2-0" data-sortbtn="btn-primary" style="height: 193.5px;">
    <nav class="navbar navbar-dropdown navbar-fixed-top navbar-expand-lg">
        <div class="mbr-overlay" style="opacity: 0.9;"></div>

      <a class="full-link" href="{{setting('url.descuento')}}">
        <div class="card-wrapper mbr-fonts-style mbr-white display-7" style="text-align: center;width: 100%;padding: .5rem 0;">{{setting('site.barra_superior')}}</div>
      </a>
      <div class="full-link" style="background-color: #d16512;text-align:center;">
        <div class="card-wrapper mbr-fonts-style mbr-white display-7" style="text-align: left;display: inline-block;    padding:1rem 0 0 0;padding-left: 1rem;">
            <form action="/resultados" method="POST" class="mbr-form">
              {{csrf_field()}}
                <input @if(isset($search)) value="{{$search}}" @endif type="search" name="search" class="field special-form display-7" placeholder="Buscar" style="font-size: .9rem;height: 2rem;border: 0px solid;border-radius: 5px;width: 400px;margin-right: .6rem;padding: .5rem 1rem; max-width:70vw;">
                <button class="btn btn-form btn-primary display-4" style="    margin-left: -17px;height: 2rem;border: 2px solid white;width: 50px;z-index: 9999999;border-color: white !important;padding: 0;padding-left: 6px;margin-bottom: 0;margin-top: 0;"> 
                  <span class="p-2 mbr-iconfont mbri-search" style="    padding: 0 !important;font-size: 1rem;"></span>
                </button>
              
            </form>
        </div>
        <div class="barraRight card-wrapper  mbr-fonts-style mbr-white display-7" style=" margin-right: 50px; display: inline-block; float: right;padding: .5rem 0;">
          <div class="icons-menu" style="display: -webkit-flex;padding-left: 1rem;text-align: center; font-size: .9rem;height: 2.5rem;border: 0px solid;border-radius: 5px;margin-right: .6rem;padding: .5rem 1rem;">
              <div class="soc-item">
                  @if(!Auth::guest())
       
                  <ul class="navbar-nav nav-dropdown" data-app-modern-menu="true">
                    <li class="nav-item dropdown">
                    <a class="nav-link text-white link dropdown-toggle display-4" style="color:black;" href="#!" data-toggle="dropdown-submenu" aria-expanded="false">
                     Hola {{auth()->user()->name}}!</a>
                     <div class="dropdown-menu">
                      <a class="text-white dropdown-item display-4"  href="{{ route('home') }}">Mis Pedidos</a>
                      <a class="text-white dropdown-item display-4"  href="{{ route('profile.index') }}">Perfil</a>
                      <a class="text-white dropdown-item  display-4" href="{{ route('logout') }}"
                            onclick="event.preventDefault();
                                          document.getElementById('logout-form').submit();">
                            Salir
                        </a>

                        <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                            @csrf
                        </form>
                    </div>
                  </li>
                  </ul>
           
            @else
         
               <a class="nav-link link text-white display-4" href="{{ route('login') }}">
                                      Ingresar</a>
           
            @endif
                <!--a href="/ingresar">
                  <span class="mbr-iconfont mbri-login" style="color: rgb(255, 255, 255); fill: rgb(255, 255, 255);"></span-->
                </a>
              </div>
              <div class="soc-item">
                <a href="/cart">  <span class="contador" style="@if(Cart::count() == 0)display:none;@endif position: absolute;color: white;border-radius: 35px;width: 25px;font-size: 1rem;padding-left: 10px;padding-top: 2px;font-weight: bold;margin-left: 14px;margin-top: -10px;"> {{ Cart::count() }}</span>
                  <span class="p-2 mbr-iconfont mbri-shopping-cart" style="color: rgb(255, 255, 255); fill: rgb(255, 255, 255);"></span>
                </a>
                <a href="/cart" class="go-to-cart">
        <span class="contador" style="@if(Cart::count() == 0)display:none;@endif position: absolute;color: white;border-radius: 35px;width: 25px;font-size: 1rem;padding-left: 10px;padding-top: 2px;font-weight: bold;margin-left: 14px;margin-top: -10px;"> {{ Cart::count() }}</span>
         <span class="mbri-shopping-cart"></span>
      </a>
                <span class="popover-cart success">
                      <div>Producto agregado correctamente</div>
                      <a href="/cart">Pagar</a>
                </span>
                <span class="popover-cart error">
                      <div>OPS, intentelo nuevamente</div>
                </span>
              </div>
              
              
              
            </div>
        </div>

        <div class="barraLeft card-wrapper  mbr-fonts-style mbr-white display-7" style="margin-right: 50px; display: inline-block; float: left;padding: .5rem 0;">
          <div class="icons-menu" style="display: -webkit-flex;padding-left: 1rem;text-align: center; font-size: .9rem;height: 2.5rem;border: 0px solid;border-radius: 5px;margin-right: .6rem;padding: .5rem 1rem;    margin-left: 1vw;">
              <div class="soc-item">
                <a href="https://api.whatsapp.com/send?phone=573005000453" target="_blank">
                  <span class="mbr-iconfont socicon-whatsapp socicon" style="color: rgb(255, 255, 255); fill: rgb(255, 255, 255);"></span>
                </a>
              </div>
              <div class="soc-item">
                <a href="https://www.facebook.com/expressnutrition.co/" target="_blank">
                  <span class="mbr-iconfont socicon-facebook socicon" style="color: rgb(255, 255, 255); fill: rgb(255, 255, 255);"></span>
                </a>
              </div>
              <div class="soc-item">
                <a href="https://www.instagram.com/expressnutrition.co/" target="_blank">
                  <span class="mbr-iconfont socicon-instagram socicon" style="color: rgb(255, 255, 255); fill: rgb(255, 255, 255);"></span>
                </a>
              </div>
              <!--div class="soc-item">
                <a  href="#!">
                    <span class="mbr-iconfont socicon-twitter socicon" style="color: rgb(255, 255, 255); fill: rgb(255, 255, 255);"></span>
                </a>
              </div-->
              
            </div>
        </div>
      </div>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
            
        <div class="left-menu">
          <ul class="navbar-nav nav-dropdown" data-app-modern-menu="true">
                <li class="nav-item">
                    <a class="nav-link link text-white display-4" href="/">TIENDA</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link link dropdown-toggle text-white display-4" href="#!" data-toggle="dropdown-submenu" aria-expanded="false">
                                   PRODUCTOS</a>
                    <div class="dropdown-menu">
            
                        @foreach (App\Brandscategory::where('show_on_front', 1)->orderBy('order', 'asc')->get() as $category)
                        <a class="text-white dropdown-item display-4" href="{{ url('/category/'.$category->slug.'') }}">{{ $category->name }}</a> @endforeach
            
                    </div>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link link text-white dropdown-toggle display-4" href="#!" data-toggle="dropdown-submenu" aria-expanded="false">
                                   MARCAS</a>
                    <div class="dropdown-menu">
                        <div class="dropdown">
                            <a class="text-white dropdown-item dropdown-toggle display-4" href="#!" data-toggle="dropdown-submenu" aria-expanded="false">Nacional</a>
                            <div class="dropdown-menu dropdown-submenu">
            
                                @foreach (App\Brand::orderBy('order', 'asc')->get() as $brand) @if($brand->global_name == "nacional")
                                <a class="text-white dropdown-item display-4" href="{{ url('/brand/'.$brand->slug.'') }}">{{ $brand->name }}</a> @endif @endforeach
            
                            </div>
                        </div>
                        <div class="dropdown">
                            <a class="text-white dropdown-item dropdown-toggle display-4" href="#!" aria-expanded="false" data-toggle="dropdown-submenu">Importado</a>
                            <div class="dropdown-menu dropdown-submenu fafafa">
            
                                @foreach (App\Brand::orderBy('order', 'desc')->get() as $brand) @if($brand->global_name == "importada")
                                <a class="text-white dropdown-item display-4" href="{{ url('/brand/'.$brand->slug.'') }}">{{ $brand->name }}</a> @endif @endforeach
            
                                
                            </div>
                        </div>
                        @php
                        $otrasMarcas = App\Brand::where('global_name', 'otras')->orderBy('order', 'desc')->get();
                        @endphp
                        @if(count($otrasMarcas) > 0 )
                        <div class="dropdown">
                            <a class="text-white dropdown-item dropdown-toggle display-4" href="#!" aria-expanded="false" data-toggle="dropdown-submenu">Otras Marcas</a>
                            <div class="dropdown-menu dropdown-submenu">
                                @foreach ($otrasMarcas as $brand) @if($brand->global_name == "otras")
                                <a class="text-white dropdown-item display-4" href="{{ url('/brand/'.$brand->slug.'') }}">{{ $brand->name }}</a> 
                                @endif @endforeach
                            </div>
                        </div>
                        @endif
                    </div>
                </li>
                <li class="nav-item"><a class="nav-link link text-white display-4" href="/kit">
                                   COMBOS EXPRESS</a></li>
            </ul>
        </div>

        <div class="brand-container">
          <div class="navbar-brand">
              <span class="navbar-logo">
                  <a href="/">
                      <img src="{{ asset('assets/images/logo-web-368x154.png') }}" alt="Mobirise" title="" style="height: 5rem;">
                  </a>
              </span>
              
          </div>
        </div>

        <div class="right-menu">
          <ul class="navbar-nav nav-dropdown" data-app-modern-menu="true"><li class="nav-item">
                <a class="nav-link link text-white display-4" href="/articles">
                    ARTICULOS NUTRITION</a>
            </li>
            <li class="nav-item">
                <a class="nav-link link text-white display-4" href="/faq">
                    PREGUNTAS FRECUENTES</a>
            </li><li class="nav-item"><a class="nav-link link text-white display-4" href="/contact">
                    CONTACTO</a></li></ul>
        </div>
      </div>

          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
            <div class="hamburger">
                <span></span>
                <span></span>
                <span></span>
                <span></span>
            </div>
          </button>
    </nav>
</section>--}}


  <!-- Header End -->

  @yield('content')

  <section class="extFeatures cid-s0jF2u65lG" id="extFeatures5-4k">
    
    

    
    <div class="container">
        <div class="row justify-content-center">
            <div class="card pb-5 col-12 col-md-10 col-lg-3">
                <div class="card-img">
                    <span class="mbr-iconfont mdi-maps-local-shipping" style="color: rgb(20, 157, 204); fill: rgb(20, 157, 204);"></span>
                </div>
                <div class="card-box">
                    <h4 class="card-title mbr-fonts-style display-7"><strong>Envío gratis</strong></h4>
                    <p class="mbr-text mbr-fonts-style mbr-lighter display-4">En pedidos superiores a $ 99
                    </p>
                    
                </div>
            </div>

            <div class="card pb-5 col-12 col-md-10 col-lg-3">
                <div class="card-img">
                    <span class="mbr-iconfont mdi-action-credit-card" style="color: rgb(20, 157, 204); fill: rgb(20, 157, 204);"></span>
                </div>
                <div class="card-box">
                    <h4 class="card-title mbr-fonts-style display-7"><strong>Pago seguro</strong></h4>
                    <p class="mbr-text mbr-fonts-style mbr-lighter display-4">
                        Protegido el pago en línea            
                    </p>
                    
                </div>
            </div>

            <div class="card pb-5 col-12 col-md-10 col-lg-3">
                <div class="card-img">
                    <span class="mbr-iconfont mdi-hardware-headset-mic" style="color: rgb(20, 157, 204); fill: rgb(20, 157, 204);"></span>
                </div>
                <div class="card-box">
                    <h4 class="card-title mbr-fonts-style display-7"><strong>Soporte</strong> <strong>24/7</strong></h4>
                    <p class="mbr-text mbr-fonts-style mbr-lighter display-4">
                        Línea directa : (+57 320 
                    </p>
                    
                </div>
            </div>

            <div class="card pb-5 col-12 col-md-10 col-lg-3">
              <div class="card-img">
                  <span class="mbr-iconfont mdi-action-credit-card" style="color: rgb(20, 157, 204); fill: rgb(20, 157, 204);"></span>
              </div>
              <div class="card-box">
                  <h4 class="card-title mbr-fonts-style display-7"><strong>Pago seguro</strong></h4>
                  <p class="mbr-text mbr-fonts-style mbr-lighter display-4">
                      Protegido el pago en línea            
                  </p>
                  
              </div>
          </div>

            

            

            
        </div>
    </div>
</section>

<section class="header3 cid-rQTbzFkptJ mbr-parallax-background" id="header3-g">

    

    <div class="mbr-overlay" style="opacity: 0.3;">
    </div>

    <div class="container align-center">
        <div class="row justify-content-center">
            <div class="media-container-column mbr-white col-md-10">
                
                <h1 class="mbr-section-title mbr-bold pb-3 mbr-fonts-style display-2">PRODUCTOS
<div>EN OFERTA!</div></h1>
                
                <div class="mbr-section-btn"><a class="btn btn-md btn-bgr btn-white display-4" href="#">VER PRODUCTOS</a></div>
            </div>
        </div>
    </div>
    
</section>

<section once="footers" class="cid-rQTcrahUyo" id="footer01-h">

    

    

    <div class="container">
        <div class="row mbr-white justify-content-center">


            <div class="col-md-12 col-lg-12 pb-5 my-auto md-pb">
                <div class="logo-wrap">
                    <a href="index.html"><img class="logo" src="assets/images/xycdi11704.png" alt="" title=""></a>
                </div>
            </div>






            <div class="col-md-6 align-center col-lg-3">
                <div class="item-content">
                    <h3 class="mbr-section-title pb-2 mbr-bold mbr-fonts-style display-7">CONTACTO</h3>
                    <p class="mbr-text pb-3 mbr-fonts-style display-4"><strong>Dirección</strong>: Carrera 58D No. 131 - 29 Bogotá / Colombia
<br><strong>Email</strong>:contacto@nortenajamones.com
<br><strong>Telefono</strong>: 253 3180 / 613 1055 / 492 9950
<br><strong>WhatsApp</strong>: 312 587 49 34</p>
                </div>


            </div>

            <div class="col-md-6 col-lg-3 align-center">
                <div class="item-content">
                    <h3 class="mbr-section-title pb-2 mbr-bold mbr-fonts-style display-7">MI CUENTA</h3>
                    <p class="mbr-text mbr-fonts-style display-4">Descuentos</p>
                    <p class="mbr-text mbr-fonts-style display-4">Info de Envío</p>
                    <p class="mbr-text mbr-fonts-style display-4">Políticas de Calidad</p>
                    
                 
                </div>

            </div>



            <div class="col-md-6 col-lg-3 align-center">
                <div class="item-content">
                    <h3 class="mbr-section-title pb-2 mbr-bold mbr-fonts-style display-7">INFORMACIÓN</h3>
                    <p class="mbr-text mbr-fonts-style display-4">Nuevos Productos</p>
                    <p class="mbr-text mbr-fonts-style display-4">Recetas</p>
                    <p class="mbr-text mbr-fonts-style display-4"><a href="page1.html" class="text-danger">Nosotros</a></p>
                    
                 
                </div>

            </div>


            <div class="col-md-6 col-lg-3 pb-5 align-center">
                <div class="item-content">
                    <h3 class="mbr-section-title pb-2 mbr-bold mbr-fonts-style display-7">Instagram feed
                    </h3>
                    <img class="feedimg" src="assets/images/jamon-de-pollo-pequeno-x-libra-270x270.jpg" alt="" title="">
                    <img class="feedimg" src="assets/images/jamon-pizza-norteno-pequeno-x-libra-420x420.jpg" alt="" title="">
                    <img class="feedimg" src="assets/images/pernil-de-cerdo-x-libra-270x270.jpg" alt="" title="">
                </div>

            </div>







        </div>
    </div>
</section>

{{-- comment 

<section class="cid-rf5VEjQFOR" id="footer3-a" data-sortbtn="btn-primary">
    

    

    <div class="container-fluid">
        <div class="row align-center justify-content-center">
            <div class="col-lg-6 col-xl-4">
                <div class="follow-section">
                    <div class="follow-heading mbr-fonts-style align-left display-7">
                        Seguir
                    </div>
                    <div class="social-media pb-3 align-left">
                        <ul>
                            <li>
                                <a class="icon-transition" href="https://www.facebook.com/expressnutrition.co/" target="_blank">
                                    <span class="mbr-iconfont socicon-facebook socicon"></span>
                                </a>
                            </li>
                            <li>
                                <a class="icon-transition" href="https://www.instagram.com/expressnutrition.co/" target="_blank">
                                    <span class="mbr-iconfont socicon-instagram socicon"></span>
                                </a>
                            </li>
                            <li>
                                <a class="icon-transition" href="https://api.whatsapp.com/send?phone=573005000453" target="_blank">
                                    <span class="mbr-iconfont socicon-whatsapp socicon"></span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="row column-menu">
                    <div class="col-xl-5 col-md-6">
                        <ul class="firstColumn align-left mbr-white mbr-fonts-style display-7">
                            <li><a href="https://www.expressnutrition.co/category/Proteinas" class="text-white">Proteinas</a></li>
                            <li><a href="https://www.expressnutrition.co/category/Quemadores" class="text-white">Quemadores de Grasa</a></li>
                            <li><a href="https://www.expressnutrition.co/category/Creatina" class="text-white">Creatininas</a></li>
                            <li><a href="https://www.expressnutrition.co/category/Pre-entreno" class="text-white">Pre Entrenos</a></li>
                        </ul>
                    </div>
                    <div class="col-xl-5 col-md-6">
                        <ul class="secondColumn align-left mbr-white mbr-fonts-style display-7">
                            <li><a href="https://www.expressnutrition.co/category/ganadores-de-peso" class="text-white">Ganadores de Peso</a></li>
                            <li><a href="https://www.expressnutrition.co/category/pro-hormonales" class="text-white">Pro Hormonales</a></li>
                            <li><a href="https://www.expressnutrition.co/category/aminos-bcaa" class="text-white">Aminos / Bcaa's</a></li>
                            <li><a href="https://www.expressnutrition.co/category/multivitaminicos" class="text-white">Multivitamínicos</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 col-xl-6 form-section">
                <ul class="mbr-list list-inline align-left">
                    <li class="list-inline-item mbr-fonts-style display-7">
                            <a href="/kit" class="text-white">Combos Express</a>
                    </li>
                    <li class="list-inline-item mbr-fonts-style display-7">
                            <a href="#!" class="text-white">Términos y Condiciones</a>
                    </li>
                    <li class="list-inline-item mbr-fonts-style display-7">
                            <a href="#!" class="text-white">Envíos y Pagos</a>
                    </li>
                    <li class="list-inline-item mbr-fonts-style display-7">
                            <a href="/contact" class="text-white">Contacto</a>
                    </li>
                </ul>
                <div class="input-form">
                    <span class="mbr-fonts-style form-text display-7">
                      Suscríbete para recibir las últimas novedades sobre ventas, nuevos lanzamientos y más ...
                    </span>
                    <div class="form1" data-form-type="formoid">
                        <div data-form-alert="" hidden="">
                            ¡Gracias por completar el formulario!
                        </div>
                        <form class="mbr-form suscribir" action="/" method="post" data-form-title="My Mobirise Form"><input type="hidden" name="email" data-form-email="true" value="gIm+PcRsIiTQKPt5ljAcrRful56SYrjCz8Zod9fhNwlXs/Z9WJaYtZvwNE0e/xvrrZPVBC7xQ+XDfW5r47fzCUDIs265BTCh4xD6h+Maam2Ek6kFaO4C6AeGLsfoXV8A">
                            <div class="input-wrap" data-for="email">
                                <input type="text" class="field special-form display-7" name="email" data-form-field="E-mail" required="" id="email-footer3-a">
                            </div>
                            <span class="input-group-btn"><button href="#!" type="submit" class="btn btn-form btn-primary display-4">Subscribirse</button></span>
                        </form>
                    </div>
                </div>
                <h3 class="subtext-1 mbr-fonts-style pb-3 display-7">Diseñado por&nbsp;<a href="http://designingsolutions.com.co" class="text-secondary" target="_blank">Designing Solutions</a></h3>
                <h3 class="subtext-2 mbr-fonts-style display-7">
                    Sistemas de pago soportados
                </h3>
                <ul class="card-support align-left">
                    <li>
                        <img src="{{ asset('assets/images/visa.png') }}" height="30" alt="Visa">
                    </li>
                    <li>
                        <img src="{{ asset('assets/images/master-card.png') }}" height="30" alt="Master Card">
                    </li>
                    <li>
                        <img src="{{ asset('assets/images/american-express.png') }}" height="30" alt="American Express">
                    </li>
                    <li>
                        <img src="{{ asset('assets/images/codensa.png') }}" height="30" alt="PayPal">
                    </li>
                    
                    <li>
                        <img src="{{ asset('assets/images/efecty.png') }}" height="30" alt="Discover">
                    </li>
                    
                    <li>
                        <img src="{{ asset('assets/images/baloto.jpg') }}" height="30" alt="Discover">
                    </li>

                    <li>
                        <img src="{{ asset('assets/images/bancolombia.jpg') }}" height="30" alt="Discover">
                    </li>
                    
                    
                    
                    
                </ul>
            </div>
        </div>
    </div>
</section>
<style>
    @media (max-width:767px){.hidden-sm-down{display:none!important}}
</style>
<div class="hidden-sm-down">
<div class="social">
  <ul>
    <li><a id="boton" onclick="divFacebook()" class="mbr-iconfont socicon-facebook socicon"></a>
      <!-- src="https://www.facebook.com/plugins/likebox.php?id=769257579840029&locale=&width=350&height=480&colorscheme=light&show_faces=true&border_color&stream=true&header=false" -->
      <iframe
        class="social2"
        id="facebook"
        src="https://www.facebook.com/plugins/page.php?href=https%3A%2F%2Fm.facebook.com%2Fexpressnutrition.co%2F&tabs=timeline&width=340&height=500&small_header=false&adapt_container_width=true&hide_cover=false&show_facepile=true&appId=128187881330003"
        frameborder="0"
        allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
        allowfullscreen
        scrolling="no"
        allowTransparency="true"
        allow="encrypted-media"
      >
      </iframe>
    </li>
    <li><a id="boton" onclick="divInstagram()" class="mbr-iconfont socicon-instagram socicon"></a>
      <iframe
        class="social2"
        id="instagram"
        src="{{setting('site.insta_widget')}}embed/"
        width="400"
        height="50vh"
        frameborder="0"
        scrolling="no"
        allowtransparency="true"
      ></iframe>
    </li>
  </ul>
</div>
</div>
--}}
<script src="{{asset('assets/web/assets/jquery/jquery.min.js')}}"></script>
<script src="{{asset('assets/popper/popper.min.js')}}"></script>
<script src="{{asset('assets/tether/tether.min.js')}}"></script>
<script src="https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.5"></script>
<script src="https://apis.google.com/js/plusone.js"></script>
<script src="{{asset('assets/facebook-plugin/facebook-script.js')}}"></script>
<script src="{{asset('assets/bootstrap/js/bootstrap.min.js')}}"></script>
<script src="{{asset('assets/smoothscroll/smooth-scroll.js')}}"></script>
<script src="{{asset('assets/parallax/jarallax.min.js')}}"></script>
<script src="{{asset('assets/popup-plugin/script.js')}}"></script>
<script src="{{asset('assets/popup-ontimer-plugin/script.js')}}"></script>
<script src="{{asset('assets/popup-overlay-plugin/script.js')}}"></script>
<script src="{{asset('assets/dropdown/js/nav-dropdown.js')}}"></script>
<script src="{{asset('assets/dropdown/js/navbar-dropdown.js')}}"></script>
<script src="{{asset('assets/touchswipe/jquery.touch-swipe.min.js')}}"></script>
<script src="{{asset('assets/viewportchecker/jquery.viewportchecker.js')}}"></script>
<script src="{{asset('assets/wowslider-plugin/wowslider.js')}}"></script>
<script src="{{asset('assets/theme/js/script.js')}}"></script>
<script src="{{asset('assets/wowslider-init/script.js')}}"></script>
<script src="{{asset('assets/formoid.min.js')}}"></script>
<script async src="{{asset('assets/wowslider-effect/kenburns/script.js')}}"></script>
<script src="{{asset('assets/formstyler/jquery.formstyler.js')}}"></script>
<script src="{{asset('assets/formstyler/jquery.formstyler.min.js')}}"></script>
<script src="{{asset('assets/datepicker/jquery.datetimepicker.full.js')}}"></script>
<script src="{{asset('assets/mbr-popup-btns/mbr-popup-btns.js')}}"></script>
<div id="scrollToTop" class="scrollToTop mbr-arrow-up"><a style="text-align: center;"><i class="mbr-arrow-up-icon mbr-arrow-up-icon-cm cm-icon cm-icon-smallarrow-up"></i></a></div>
<input name="animation" type="hidden">
<script>
  function suscribirse(){
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('.suscribir input[name="_token"]').val()
                }
              });
              $.ajax({
                url:'suscribe',
                method: 'post', 
                data: {email:$('.suscribir input[name="email"]').val()}, 
                success: resp => {
                  $("#modal_content").html(resp);
                }
              });
          }
         $(function() {
          $('form.suscribir').each(function() {
              $(this).find('input').keypress(function(e) {
                  // Enter pressed?
                  if(e.which == 10 || e.which == 13) {
                      this.form.submit();
                  }
              });

              $(this).find('input[type=submit]').hide();
          });
         });
      </script>
            <script type="text/javascript">
          function addProduct(id){
            //alert(id);
            $.get('/addtocart/' + id, function(response){
               
               $(".shopItemsModal_wraper").hide();

            }).always(function(response) {
               seePopover( response );
           });
          }

          function seePopover(result){
             if (result == "true") {
                  $(".popover-cart.success").toggle();
                   setTimeout(function(){
                        $(".popover-cart.success").toggle();
                   }, 5000);
                   $(".contador").text( parseInt($(".contador").text()) + 1);
                    $(".contador").show(); 
                    $(".go-to-cart").show();
             }else{
                debugger;
                $(".popover-cart.error").toggle();
                setTimeout(function(){
                     $(".popover-cart.error").toggle();
                }, 5000);
             }
          }
      </script>


  @yield('js')
  <!-- Modal HTML embedded directly into document -->
<div id="ex1" class="modal"> <div class="modal-body">
  <p>Para pedidos con pago contra entrega solo en Bogotà.</p>
  <a href="#!" onclick="$('#ex1').modal('toggle')" class="btn btn-form btn-primary display-4" rel="modal:close">Close</a></div>
</div>
<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
       
        <h4 class="modal-title">Información:</h4>
         <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
      <div class="modal-body">
        <p>Para pedidos con pago contra entrega solo en Bogotà.</p>
      </div>
      <div class="modal-footer">
        <button type="button" id="aceptarContra" class="btn btn-form btn-primary display-4" data-dismiss="modal"  onclick="window.location.href='/contra-entrega';">Aceptar</button>
      </div>
    </div>

  </div>
</div>

<!-- Modal -->
<div id="myModal2" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
       
        <h4 class="modal-title">Muchas gracias:</h4>
         <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
      <div class="modal-body">
        <p>Revisa tu bandeja de entrada, envíamos un correo para activar tu cuenta.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-form btn-primary display-4" data-dismiss="modal" onclick="window.location.href='/ingresar';">Aceptar</button>
      </div>
    </div>

  </div>
</div>

{{-- modal carrito --}}

<div class="modal left fade" id="exampleModal" tabindex="" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
      <div class="modal-content">
          <div class="modal-body">
            <section class="features05 cid-s0k8norKO3 mt-2 pt-1 ml-0 pl-0 mr-0 pr-0" id="features05-4r">
              <div class="container-fluid">
                <div class="row">
                  <div class="card item features-image col-12">
                    <div class="item-wrapper m-1 pl-0 pr-0 pt-5 pb-0">
                      
                        <div class="card-img" style="height: 100px; width: 100px;">
                          <a href="page14.html"><img src="assets/images/whatsapp-image-2020-05-28-at-11.05.08-am.jpeg" alt="" title="" style="height: 100px; width: 100px;"></a>
                        </div>
                      
                        
                      
                    </div>
                </div>
                </div>
              </div>
            </section>
            

            
          </div>
          <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          </div>
      </div>
  </div>
</div>

{{-- css modal right 
<style>
  .modal.left .modal-dialog {
	position:fixed;
	right: 0;
	margin: auto;
	width: 320px;
	height: 100%;
	-webkit-transform: translate3d(0%, 0, 0);
	-ms-transform: translate3d(0%, 0, 0);
	-o-transform: translate3d(0%, 0, 0);
	transform: translate3d(0%, 0, 0);
}

.modal.left .modal-content {
	height: 100%;
	overflow-y: auto;
}

.modal.right .modal-body {
	padding: 15px 15px 80px;
}

.modal.right.fade .modal-dialog {
	left: -320px;
	-webkit-transition: opacity 0.3s linear, left 0.3s ease-out;
	-moz-transition: opacity 0.3s linear, left 0.3s ease-out;
	-o-transition: opacity 0.3s linear, left 0.3s ease-out;
	transition: opacity 0.3s linear, left 0.3s ease-out;
}

.modal.right.fade.show .modal-dialog {
	right: 0;
}

/* ----- MODAL STYLE ----- */
.modal-content {
	border-radius: 0;
	border: none;
}

.modal-header {
	border-bottom-color: #eeeeee;
	background-color: #fafafa;
}

/* ----- v CAN BE DELETED v ----- */
body {
	background-color: #78909c;
}

.demo {
	padding-top: 60px;
	padding-bottom: 110px;
}

.btn-demo {
	margin: 15px;
	padding: 10px 15px;
	border-radius: 0;
	font-size: 16px;
	background-color: #ffffff;
}

.btn-demo:focus {
	outline: 0;
}

</style>

--}}



<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<a href="https://api.whatsapp.com/send?phone=573219106099&text=Hola%21%20Quisiera%20m%C3%A1s%20informaci%C3%B3n%20sobre%20." class="float" target="_blank">
<i class="fa fa-whatsapp my-float"></i>
</a>
</body>
</html>
