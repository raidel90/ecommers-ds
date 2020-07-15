@extends('layouts.app') 
@section('content')
<section class="cid-qyY9JUAdBE" id="form3-68" data-rv-view="2720">
    <div class="container-fluid">
        <div class="row justify-content-center">
            <div class="form-1 col-md-12 col-lg-8" data-form-type="formoid">
                <h1 class="mbr-fonts-style mbr-section-title text-center display-2">
                    CONTACTANOS!
                </h1>
      

                <form class="mbr-form" action="{{ route('contact.store') }}" method="POST" data-form-title="Contacto">
                @csrf
                    <div class="row input-main">
                        <div class="col-md-12 col-lg-6 input-wrap" data-for="firstname">
                            <label class="form-label-outside" for="form-1-firstname">Nombre</label>
                            <input id="name" type="text" class="form-control{{ $errors->has('name') ? ' is-invalid' : '' }}" name="name" value="{{ old('name') }}" required>
                            @if ($errors->has('name'))
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $errors->first('name') }}</strong>
                                </span>
                            @endif
                        </div>
                        <div class="col-md-12 col-lg-6 input-wrap" data-for="lastname">
                            <label class="form-label-outside" for="form-1-lastname">Apellido</label>
                            <input id="lastname" type="text" class="form-control{{ $errors->has('lastname') ? ' is-invalid' : '' }}" name="lastname" value="{{ old('lastname') }}" required>
                            @if ($errors->has('lastname'))
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $errors->first('lastname') }}</strong>
                                </span>
                            @endif
                        </div>
                    </div>
                    <div class="row input-main">
                        <div class="col-md-12 col-lg-6 input-wrap" data-for="email">
                            <label class="form-label-outside" for="form-1-email">E-mail</label>
                            <input type="text" class="form-control{{ $errors->has('email') ? ' is-invalid' : '' }}" name="email" value="{{ old('email') }}" required autofocus>
                            @if ($errors->has('email'))
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $errors->first('email') }}</strong>
                                </span>
                            @endif
                        </div>
                        <div class=" col-md-12 col-lg-6 input-wrap" data-for="phone">
                            <label class="form-label-outside" for="form-1-phone">Teléfono</label>
                            <input type="text"  class="form-control{{ $errors->has('phone') ? ' is-invalid' : '' }}" name="phone" value="{{ old('phone') }}" required>
                            @if ($errors->has('phone'))
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $errors->first('phone') }}</strong>
                                </span>
                            @endif
                        </div>
                    </div>
                    <div class="row input-main">
                        <div class="col-md-12 form-group" data-for="message">
                            <label class="form-label-outside" for="form-1-message">Mensaje</label>
                            <textarea type="text" class="form-control{{ $errors->has('message') ? ' is-invalid' : '' }}" name="message" rows="7" data-form-field="Message" id="message-form3-68">{{ old('message') }}</textarea>
                        </div>
                    </div>
                    <div class="row input-main">
                        <div class="col-md-12 btn-row">
                            <span class="input-group-btn">
                                <button onclick="document.getElementsByClassName('mbr-form') [0].submit();" type="submit" class="btn btn-form btn-primary display-4">ENVIAR</button>
                            </span>
                        </div>
                    </div>
                </form>
            </div>
        </div>
   </div>
</section>
@endsection