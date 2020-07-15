@extends('layouts.app') 
@section('css')
<style>
  .post-bottom{
  background:#ffffff;
  padding:10px 0px;
  border-top:1px solid #e0e0e0; 
  border-bottom:1px solid #e0e0e0;  
}

.post-bottom .post-info{
  border:none;
  padding:0px;  
}

.post-bottom .post-info li{
  line-height:34px;
}

.post-bottom .share-options li{
  line-height:34px;
  margin-left:10px; 
  float:left; 
}

.post-bottom .share-options li a{
  position:relative;
  display:inline-block;
  font-size:14px;
  width:34px;
  height:34px;
  line-height:32px;
  border:1px solid #e9e9e9;
  text-align:center;
  color:#999999;
  border-radius:5px;
  transition:all 0.5s ease;
  -moz-transition:all 0.5s ease;
  -webkit-transition:all 0.5s ease;
  -ms-transition:all 0.5s ease;
  -o-transition:all 0.5s ease;
}

.post-bottom .share-options li a:hover{
  color:#ffffff;
  background:#b89b5e; 
}

.social-links-one a{
  position:relative;
  display:inline-block;
  font-size:14px;
  width:34px;
  height:34px;
  line-height:32px;
  border:1px solid #e9e9e9;
  text-align:center;
  color:#999999;
  margin:0px 10px 0px 0px;
  border-radius:5px;
  transition:all 0.5s ease;
  -moz-transition:all 0.5s ease;
  -webkit-transition:all 0.5s ease;
  -ms-transition:all 0.5s ease;
  -o-transition:all 0.5s ease;
}

.social-links-one a:hover{
  color:#ffffff;
  background:#b89b5e; 
}
</style>
@endsection
@section('content')

<section class="cid-rqmyFxAumj" id="content7-1x" style="padding-top: 15vh;">

    

    
    <div class="container-fluid">
        <div class="row justify-content-center">
            <div class="col-12 col-lg-6 col-md-8 align-center">
                
                <h2 class="mbr-section-title align-center mbr-fonts-style mbr-bold display-2"><br>{{$new->title}}</h2>
                <h2 class="mbr-section-title align-center mbr-fonts-style mbr-bold display-7"><br>{{$new->excerpt}}<br></h2>
            </div>
        </div>
    </div>
</section>

<section class="image1 cid-rqmz3aXz0Y" id="image1-1y">
    <!-- Block parameters controls (Blue "Gear" panel) -->
    
    <!-- End block parameters -->
    <figure class="mbr-figure container-fluid text-center">
        <div class="image-block" style="width: 50%;margin: auto;">
            <img src="{{Voyager::image($new->image)}}" alt="" title="">
            
        </div>
    </figure>
</section>

<section class="cid-rqmzxCu1K8" id="content7-20">

    

    
    <div class="container-fluid">
        <div class="row justify-content-center">
            <div class="col-12 col-lg-6 col-md-8 align-center">
                {!! $new->body !!}
            </div>
        </div>
        <div class="row">
          <div class="post-bottom clearfix">
                                    
                                    
                <ul class="share-options pull-right clearfix">
                    <li>Compartir esta noticia</li>
                    <li><a href="" data-image="https://www.fam.org.ar/storage/posts/May2019/gl0fM0d93pWNY3BpuePk.jpg" data-title="Curso on line: Liderazgo, gestión y administración judicial" data-desc="El próximo 23 de mayo inicia el un nuevo curso de formación on line de la FAM que tiene como objetivo brindar herramientas que contribuyan al mejor desempeño en la gestión a partir del liderazgo y el trabajo en equipo, la equitativa asignación de las tareas y eficiente administración del tiempo." class="btnShare"><span class="fa fa-facebook-f"></span></a></li>
                    <li><a class="twitter-share" data-js="twitter-share" href="#!"><span class="fa fa-twitter"></span></a></li>
                    
                      <li><a target="_blank" href="https://wa.me/?text=https%3A%2F%2Fwww.fam.org.ar%2Fnoticia%2Fcurso-on-line-liderazgo-gestion-y-administracion-judicial"><span class="fa fa-whatsapp"></span></a></li>
                </ul>
            </div>
        </div>
    </div>
</section>
@endsection