@extends('layouts.app')

@section('content')
<div class="container" style="margin-top:200px;">
    <div class="row justify-content-center">
        <div class="col-md-12 col-lg-10 offset-lg-1">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">{{ __('Datos de mi cuenta') }}</h4>
                </div>

                <div class="card-body">
                {{ Form::model($user, ['route' => ['profile.update', $user->id], 'method' => 'patch']) }}
                        @csrf

                        <div class="form-group row">
                            <!--label for="email" class="col-md-4 col-form-label text-md-right">{{ __('E-Mail Address') }}</label-->

                            <div class="col-md-12 mb-20">
                                <input id="email" type="email" class="form-control{{ $errors->has('email') ? ' is-invalid' : '' }}" placeholder="{{ __('Dirección de E-Mail') }}" name="email" value="{{ old('email', optional($user)->email) }}" required autofocus>

                                @if ($errors->has('email'))
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('email') }}</strong>
                                    </span>
                                @endif
                            </div>

                            <!--label for="password" class="col-md-4 col-form-label text-md-right">{{ __('Password') }}</label-->

                            <div class="col-md-12 col-lg-6 mb-20">
                                <input id="password" placeholder="{{ __('Contraseña') }}" type="password" class="form-control{{ $errors->has('password') ? ' is-invalid' : '' }}" name="password">

                                @if ($errors->has('password'))
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('password') }}</strong>
                                    </span>
                                @endif
                            </div>

                            <!--label for="password-confirm" class="col-md-4 col-form-label text-md-right">{{ __('Confirm Password') }}</label-->

                            <div class="col-md-12 col-lg-6 mb-20">
                                <input id="password-confirm" type="password" class="form-control" name="password_confirmation" placeholder="{{ __('Confirmar Contraseña') }}">
                            </div>

                            <!--label for="name" class="col-md-4 col-form-label text-md-right">{{ __('Name') }}</label-->

                            <div class="col-md-12 col-lg-7 mb-20">
                                <input id="name" type="text" placeholder="{{ __('Nombre') }}" class="form-control{{ $errors->has('name') ? ' is-invalid' : '' }}" name="name" value="{{ old('name', optional($user)->name) }}" required>

                                @if ($errors->has('name'))
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('name') }}</strong>
                                    </span>
                                @endif
                            </div>

                            <div class="col-md-12 col-lg-5 mb-20">
                                <input type="number"  placeholder="{{ __('Teléfono') }}" class="form-control{{ $errors->has('phone') ? ' is-invalid' : '' }}" name="phone" value="{{ old('phone', optional($user)->phone) }}" required>
                                @if ($errors->has('phone'))
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('phone') }}</strong>
                                    </span>
                                @endif
                            </div>

                            <div class="col-md-12 col-lg-7 mb-20">
                                <input type="text"  placeholder="{{ __('Dirección') }}" class="form-control{{ $errors->has('address') ? ' is-invalid' : '' }}" name="address" value="{{ old('address', optional($user)->address) }}" required>
                                @if ($errors->has('address'))
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('address') }}</strong>
                                    </span>
                                @endif
                            </div>

                            <div class="col-md-12 col-lg-5 mb-20">
                                <input type="text"  placeholder="{{ __('Ciudad') }}" class="form-control{{ $errors->has('city') ? ' is-invalid' : '' }}" name="city" value="{{ old('city', optional($user)->city) }}" required>
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
                                    {{ __('Actualizar') }}
                                </button>
                            </div>
                        </div>
                        {{ Form::close() }}
                </div>
            </div>
        </div>
    </div>
</div>
@endsection