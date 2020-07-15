@extends('layouts.app') 
@section('content')
<section class="header6 cid-roMaOQhfUq" id="header6-1n">

    

    <div class="mbr-overlay" style="opacity: 0.6; background-color: rgb(14, 64, 157);">
    </div>
    <div class="container-fluid">
        <div class="row justify-content-center">
            <div class="col-12 col-lg-6 col-md-8 align-center">
                <h3 class="mbr-section-subtitle align-center mbr-fonts-style mbr-light pb-3 mbr-white display-5"><br>Bienvenido a nuestro Blog</h3>
                <h2 class="mbr-section-title align-center mbr-fonts-style mbr-bold mbr-white display-2">De Noticias</h2>
            </div>
        </div>
    </div>
    
</section>
@php
setlocale(LC_ALL,"es_ES");
date_default_timezone_set('America/Bogota');

@endphp
@foreach($news as $noticia)
<section class="features1 cid-roMehh3uv0" id="features1-1p">
    <div class="container">
        <div class="row justify-content-center align-items-center">
            
            <div class="col-sm-12 text-block col-md-6">
                
                <h3 class="mbr-section-title mbr-fonts-style align-left display-4">Por: {{TCG\Voyager\Models\User::where('id', $noticia->author_id)->get()[0]->name}}/{{ date('j \d\e F o, H\:i', strtotime( $noticia->created_at))}}.</h3>
                <h3 class="mbr-section-title mbr-fonts-style align-left display-5"><strong>{{$noticia->title}}</strong></h3>
                <h3 class="mbr-section-title mbr-fonts-style align-left display-4">{{TCG\Voyager\Models\Category::where('id', $noticia->category_id)->get()[0]->name }}</h3>
                <div class="mbr-section-text mbr-fonts-style align-left display-7">{{$noticia->excerpt}}<br>  
<div>
</div><div><a href="/noticia/{{$noticia->slug}}" target="_blank" class="text-info">Seguir leyendo...</a></div></div>
            </div>
            <div class="col-sm-12 col-md-6 img-block align-center">
                <div class="mbr-figure">
                    <a href="#!"><img src="{{ Voyager::image( $noticia->image ) }}" alt="Mobirise" title=""></a>
                </div>
            </div>
        </div>
    </div>
</section>
@endforeach
@endsection