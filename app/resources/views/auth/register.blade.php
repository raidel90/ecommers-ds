@extends('layouts.app')

@section('content')

<section class="header3 cid-rQYSee2dZ9 mbr-parallax-background" id="header3-19">

    

    <div class="mbr-overlay" style="opacity: 0.4;">
    </div>
  
    <div class="container align-center">
        <div class="row justify-content-center">
            <div class="media-container-column mbr-white col-md-10">
                
                <h1 class="mbr-section-title mbr-bold pb-3 mbr-fonts-style display-2"><br>REGISTRARSE</h1>
                
                
            </div>
        </div>
    </div>
    
  </section>   
            
  
                  <div class="container-fluid">
                    <div class="row">
                        
                        <div class="col-12 col-sm-3"></div>
                      <div class="col-12 col-sm-6">
                        <div class="col-12 text-center">
                            ¿ya tienes cuenta?
                            <a href="{{ route('login') }}">Iniciar sesion</a>
                        </div>
                        <div class="menu-logo">
                          <div class="navbar-brand">
                              <span class="navbar-logo">
                                  <a href="index.html"><br><br><br>
                                  
                                  </a>
                                  
                                </span>
                                <h3>Información de contacto</h3>
                              </div>
                            </div><br>
                            <form method="POST" action="{{ route('register') }}">
                                @csrf
                              
                                
                                <input id="email" type="email" class="form-control{{ $errors->has('email') ? ' is-invalid' : '' }}" placeholder="{{ __('Dirección de E-Mail') }}" name="email" value="{{ old('email') }}" required autofocus>

                                @if ($errors->has('email'))
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('email') }}</strong>
                                    </span>
                                @endif
                              <div class="form-group form-check"><br>
                                
                              </div>
                            
                            <h2>Datos de usuario</h2><br>
                            
                              <div class="row">
                                <div class="col-sm">
                                    <input id="name" type="text" placeholder="{{ __('Nombre') }}" class="form-control{{ $errors->has('name') ? ' is-invalid' : '' }}" name="name" value="{{ old('name') }}" required>

                                    @if ($errors->has('name'))
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $errors->first('name') }}</strong>
                                        </span>
                                    @endif
                                </div>
                                <div class="col">
                                    <input type="number"  placeholder="{{ __('Teléfono') }}" class="form-control{{ $errors->has('phone') ? ' is-invalid' : '' }}" name="phone" value="{{ old('phone') }}" required>
                                    @if ($errors->has('phone'))
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $errors->first('phone') }}</strong>
                                        </span>
                                    @endif
                                </div>
                              </div>
                              <br>
                              <div class="row">
                                <div class="col-sm">
                                    <input type="text"  placeholder="{{ __('Dirección') }}" class="form-control{{ $errors->has('address') ? ' is-invalid' : '' }}" name="address" value="{{ old('address') }}" required>
                                    @if ($errors->has('address'))
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $errors->first('address') }}</strong>
                                        </span>
                                    @endif
                                </div>
                                <div class="col">
                                    <input type="text"  placeholder="{{ __('Ciudad') }}" class="form-control{{ $errors->has('city') ? ' is-invalid' : '' }}" name="city" value="{{ old('city') }}" required>
                                    @if ($errors->has('city'))
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $errors->first('city') }}</strong>
                                        </span>
                                    @endif
                                </div>
                              </div>
                              <br>
                              <div class="row">
                                <div class="col-sm">
                                    <input id="password" placeholder="{{ __('Contraseña') }}" type="password" class="form-control{{ $errors->has('password') ? ' is-invalid' : '' }}" name="password" required>
                                    @if ($errors->has('password'))
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('password') }}</strong>
                                    </span>
                                @endif
                                </div>
                                <div class="col">
                                    <input id="password-confirm" type="password" class="form-control" name="password_confirmation" placeholder="{{ __('Confirmar Contraseña') }}" required>
                                </div>
                              </div>
                              <br>
                              <div class="form-group row mb-0">
                                    <div class="col-md-12 col-lg-6 offset-lg-4">
                                        <button type="submit" class="btn btn-primary">
                                            {{ __('Continuar') }}
                                        </button>
                                    </div>
                                </div>
                              
                               
                            </form>
                              
                            </div>
                          
                            
                            
                          
                            
                          </div>
                          <div class="col-12 col-sm-3"></div>

                      </div>                
                  </div>
{{-- comment 


<div class="container" style="margin-top:200px;">
    <div class="row justify-content-center">
        <div class="col-md-12 col-lg-10 offset-lg-1">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">{{ __('Datos de la cuenta') }}</h4>
                </div>

                <div class="card-body">
                    <form method="POST" action="{{ route('register') }}">
                        @csrf

                        <div class="form-group row">
                            <!--label for="email" class="col-md-4 col-form-label text-md-right">{{ __('E-Mail Address') }}</label-->

                            <div class="col-md-12 mb-20">
                                <input id="email" type="email" class="form-control{{ $errors->has('email') ? ' is-invalid' : '' }}" placeholder="{{ __('Dirección de E-Mail') }}" name="email" value="{{ old('email') }}" required autofocus>

                                @if ($errors->has('email'))
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('email') }}</strong>
                                    </span>
                                @endif
                            </div>

                            <!--label for="password" class="col-md-4 col-form-label text-md-right">{{ __('Password') }}</label-->

                            <div class="col-md-12 col-lg-6 mb-20">
                                <input id="password" placeholder="{{ __('Contraseña') }}" type="password" class="form-control{{ $errors->has('password') ? ' is-invalid' : '' }}" name="password" required>

                                @if ($errors->has('password'))
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('password') }}</strong>
                                    </span>
                                @endif
                            </div>

                            <!--label for="password-confirm" class="col-md-4 col-form-label text-md-right">{{ __('Confirm Password') }}</label-->

                            <div class="col-md-12 col-lg-6 mb-20">
                                <input id="password-confirm" type="password" class="form-control" name="password_confirmation" placeholder="{{ __('Confirmar Contraseña') }}" required>
                            </div>

                            <!--label for="name" class="col-md-4 col-form-label text-md-right">{{ __('Name') }}</label-->

                            <div class="col-md-12 col-lg-6 mb-20">
                                <input id="name" type="text" placeholder="{{ __('Nombre') }}" class="form-control{{ $errors->has('name') ? ' is-invalid' : '' }}" name="name" value="{{ old('name') }}" required>

                                @if ($errors->has('name'))
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('name') }}</strong>
                                    </span>
                                @endif
                            </div>

                            <div class="col-md-12 col-lg-6 mb-20">
                                <input type="number"  placeholder="{{ __('Teléfono') }}" class="form-control{{ $errors->has('phone') ? ' is-invalid' : '' }}" name="phone" value="{{ old('phone') }}" required>
                                @if ($errors->has('phone'))
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('phone') }}</strong>
                                    </span>
                                @endif
                            </div>

                            <div class="col-md-12 col-lg-6 mb-20">
                                <input type="text"  placeholder="{{ __('Dirección') }}" class="form-control{{ $errors->has('address') ? ' is-invalid' : '' }}" name="address" value="{{ old('address') }}" required>
                                @if ($errors->has('address'))
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('address') }}</strong>
                                    </span>
                                @endif
                            </div>

                            <div class="col-md-12 col-lg-6 mb-20">
                                <input type="text"  placeholder="{{ __('Ciudad') }}" class="form-control{{ $errors->has('city') ? ' is-invalid' : '' }}" name="city" value="{{ old('city') }}" required>
                                @if ($errors->has('city'))
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('city') }}</strong>
                                    </span>
                                @endif
                            </div>


                        </div>

                        <div class="form-group row mb-0">
                            <div class="col-md-12 col-lg-6 offset-lg-4">
                                <button type="submit" class="btn btn-primary">
                                    {{ __('Continuar') }}
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
--}}
@endsection
