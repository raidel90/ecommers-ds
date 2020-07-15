@extends('layouts.app')
@section('css')
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
             background-color: #e842f4;
             border-color: #c3e6cb;
             text-align: center;
             border-radius: 5px;
             margin-right: 10px;
             padding: 20px;
             display: none;
         }
         .popover-cart.success a{
            font-weight: 600;
            color: white;
            text-decoration: underline;
            cursor: pointer;
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
         .cid-qyY9JUAdBE {
  padding-top: 90px;
  padding-bottom: 90px;
  background-color: #ffffff;
}
.cid-qyY9JUAdBE .container-fluid {
  padding: 0 3rem;
}
.cid-qyY9JUAdBE .mbr-section-title {
  margin-bottom: 1.5em;
}
.cid-qyY9JUAdBE .input-main {
  width: 99.6%;
  margin-left: .1em;
  justify-content: center;
}
.cid-qyY9JUAdBE .input-main label {
  color: #000000;
}
.cid-qyY9JUAdBE .form-1 {
  margin: 0 1em;
  padding: 0;
}
.cid-qyY9JUAdBE .input-wrap {
  padding: 0;
  margin-bottom: 1.3em;
}
.cid-qyY9JUAdBE .input-wrap input {
  border: 1px solid #ddd;
  border-radius: 22px;
  background-color: #efefef;
  padding: 18px 25px;
  width: 96%;
}
.cid-qyY9JUAdBE .form-group {
  padding: 0;
}
.cid-qyY9JUAdBE .form-group textarea {
  background-color: #efefef;
  border-radius: 22px;
  padding: 1rem;
  width: 98%;
}
.cid-qyY9JUAdBE .btn-row {
  padding-left: 0;
}
.cid-qyY9JUAdBE .btn {
  padding: 1rem 4rem;
}
@media (max-width: 767px) {
  .cid-qyY9JUAdBE .container-fluid {
    padding: 0 1rem;
  }
  .cid-qyY9JUAdBE .btn {
    padding: 1rem 2rem;
    font-size: 16px !important;
  }
}
form{
  text-align: center;
}
      </style>
@endsection
@section('content') 

<section class="header3 cid-rQYSee2dZ9 mbr-parallax-background" id="header3-19">

    

  <div class="mbr-overlay" style="opacity: 0.4;">
  </div>

  <div class="container align-center">
      <div class="row justify-content-center">
          <div class="media-container-column mbr-white col-md-10">
              
              <h1 class="mbr-section-title mbr-bold pb-3 mbr-fonts-style display-2"><br>INICIAR SESION</h1>
              
              
          </div>
      </div>
  </div>
  
</section>
<section class="cid-qyY9JUAdBE" id="form3-68" data-rv-view="2720">
    <div class="container-fluid">
        <div class="row justify-content-center">
            <div class="form-1 col-md-10 col-lg-4" data-form-type="formoid">

                <form class="mbr-form" action="{{ route('login') }}" method="post" data-form-title="Contacto">
                  <h3 style="line-height: 35px;">Iniciar sesión para <br>un pago más rápido</h3><br>
                  @csrf
                    <div class="row input-main">
                        <div class="col-md-12 input-wrap" data-for="firstname">
                        <input id="email" placeholder="Email" type="email" class="field display-7 form-control{{ $errors->has('email') ? ' is-invalid' : '' }}" name="email" value="{{ old('email') }}" required autofocus>
                            @if ($errors->has('email'))
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('email') }}</strong>
                                    </span>
                                @endif
                        </div>
                        <div class="col-md-12 input-wrap" data-for="lastname">
                            <input id="password" placeholder="Contraseña" type="password" class="field display-7 form-control{{ $errors->has('password') ? ' is-invalid' : '' }}" name="password" required>

                                @if ($errors->has('password'))
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('password') }}</strong>
                                    </span>
                                @endif
                        </div>
                      
                    </div>
                   
                    <div class="row input-main">
                        <div class="col-md-12 btn-row">
                            <span class="input-group-btn">
                                <button type="submit" class="btn btn-form btn-primary display-4">ACEPTAR</button>
                            </span>
                        </div>
                        <div class="col-md-12 btn-row">
                            <a href="/password">Olvidé mi contraseña</a>
                        </div>
                    </div>
                    <div class="row input-main" style="text-align: center;">
                      <div class="col-md-12 btn-row">
                          <span class="input-group-btn">
                              <a href="/register" class="btn btn-form btn-primary display-4">REGISTRARSE</a>
                          </span>
                          <div class="row input-main"><center>Si aun no tienes cuenta registrate!</center></div>
                      </div>
                  </div>
                   </form>   


                  <hr>

            </div>
        </div>
   </div>
</section>
{{-- comment 


<section class="cid-qyY9JUAdBE" id="form3-68" data-rv-view="2720">
    <div class="container-fluid">
        <div class="row justify-content-center">
            <div class="form-1 col-md-10 col-lg-4" data-form-type="formoid">

                <form class="mbr-form" action="{{ route('login') }}" method="post" data-form-title="Contacto">
                  <h3 style="line-height: 35px;">Iniciar sesión para <br>un pago más rápido</h3><br>
                  @csrf
                    <div class="row input-main">
                        <div class="col-md-12 input-wrap" data-for="firstname">
                        <input id="email" placeholder="Email" type="email" class="field display-7 form-control{{ $errors->has('email') ? ' is-invalid' : '' }}" name="email" value="{{ old('email') }}" required autofocus>
                            @if ($errors->has('email'))
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('email') }}</strong>
                                    </span>
                                @endif
                        </div>
                        <div class="col-md-12 input-wrap" data-for="lastname">
                            <input id="password" placeholder="Contraseña" type="password" class="field display-7 form-control{{ $errors->has('password') ? ' is-invalid' : '' }}" name="password" required>

                                @if ($errors->has('password'))
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('password') }}</strong>
                                    </span>
                                @endif
                        </div>
                    </div>
                    
                    <div class="row input-main">
                        <div class="col-md-12 btn-row">
                            <span class="input-group-btn">
                                <button type="submit" class="btn btn-form btn-primary display-4">ACEPTAR</button>
                            </span>
                        </div>
                        <div class="col-md-12 btn-row">
                            <a href="/password">Olvidé mi contraseña</a>
                        </div>
                    </div>
                </form>


                  <hr>
                  <div class="row input-main" style="text-align: center;"><center>Si aun no tienes cuenta registrate!</center></div>
                    <div class="row input-main" style="text-align: center;">
                        <div class="col-md-12 btn-row">
                            <span class="input-group-btn">
                                <a href="/register" class="btn btn-form btn-primary display-4">REGISTRARSE</a>
                            </span>
                        </div>
                    </div>

            </div>
        </div>
   </div>
</section>
--}}

      @endsection