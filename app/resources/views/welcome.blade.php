@extends('layouts.app')
@section('content')
<section class="mbr-wowslider-container mbr-section mbr-section__container carousel slide mbr-section-nopadding mbr-wowslider-container--boundary" data-ride="carousel" data-keyboard="false" data-wrap="true" data-interval="false" id="wowslider-6" data-rv-view="2" style="background-color: rgb(255, 255, 255);">
   <div class="mbr-wowslider">
       <div class="ws_images">
           <ul>
            @foreach($sliders as $key => $slider)
               <li>
                   
                   <img src="{{ Voyager::image($slider->image)}}" alt="title 1" title="title 1"> text 1
               </li>
            @endforeach   
           </ul>
       </div>
       <div class="ws_bullets">
           <div>
            @foreach($sliders as $key => $slider)
               <a href="#" title="">
                   <span>
                      <img alt="slide1" src="{{ Voyager::image($slider->image)}}">
                     </span>
               </a>
            @endforeach
           </div>
       </div>
       <div class="ws_shadow"></div>
       <div class="mbr-wowslider-options">
           <div class="params" data-paddingbottom="0" data-anim-type="kenburns" data-theme="boundary" data-autoplay="true" data-paddingtop="0" data-fullscreen="true" data-showbullets="false" data-timeout="2" data-duration="3" data-height="768" data-width="1024" data-responsive="2" data-showcaptions="false" data-captionseffect="slide" data-hidecontrols="false"></div>
       </div>
</div></section>

<section class="extFeatures cid-rQT9ihbOrQ" id="extFeatures8-d">

	

	
	<div class="container">
		
		
		<div class="row justify-content-center pt-4">

			
         @foreach ($categories as $category)
			<a href="{{ url('/category/'.$category->slug.'') }}" class="col-md-6 col-lg-3 row-item">
				<div class="wrapper">
					<div class="card-img pb-3 align-center display-5">
						<span class="{{ $category->icon }}"></span>
					</div>
					<h4 class="mbr-fonts-style mbr-card-title align-center display-4"><strong>{{ $category->name }}</strong></h4>
				</div>
			</a>
         @endforeach
			
			
			
			
			
		</div>
	</div>
</section>

<section class="features05 cid-rQT9TGzS9D" id="features05-e">

    

    
   <div class="container">
       <div class="row">


           <div class="col-md-12 pb-5 col-lg-12 align-center">

               <h2 class="mbr-section-subtitle mbr-exbold mbr-light mbr-fonts-style display-5">NUESTROS</h2>
               <h1 class="mbr-section-title pb-3 mbr-exbold mbr-fonts-style display-5">PRODUCTOS DESTACADOS</h1>
           </div>

           @foreach($products as $producto)
                    @component('components.product', ['producto' => $producto]) @endcomponent
            @endforeach


           


       </div>
   </div>

</section>
@endsection
