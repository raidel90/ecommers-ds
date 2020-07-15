@extends('layouts.app')
@section('content')

<section class="header3 cid-rQYSee2dZ9 mbr-parallax-background" id="header3-19">

    

   <div class="mbr-overlay" style="opacity: 0.4;">
   </div>

   <div class="container align-center">
       <div class="row justify-content-center">
           <div class="media-container-column mbr-white col-md-10">
               
               <h1 class="mbr-section-title mbr-bold pb-3 mbr-fonts-style display-2"><br>RESULTADOS DE BÚSQUEDA</h1>
               
               
           </div>
       </div>
   </div>
   
</section>

{{-- codigo viejo --}}

<section class="features05 cid-s0k8norKO3" id="features05-4r">

    

    
   <div class="container">
       <div class="row">


           <div class="col-md-12 pb-5 col-lg-12 align-center">

               
               <h1 class="mbr-section-title pb-3 mbr-exbold mbr-fonts-style display-5"><span style="font-weight: normal;">PRODUCTOS</span></h1>
           </div>

           @if(count($products) > 0)
                      @foreach($products as $producto)
                               @component('components.product', ['producto' => $producto]) @endcomponent
                              @endforeach
                              @else
                        <h5>0 Resultados encontrados</h5>         
                              @endif

       </div>
   </div>

</section>

{{-- comment 

<section class="mbr-gallery cid-rf5SHc5jTK" id="shop4-8" data-sortbtn="btn-primary">
   <div class="container">
      <div class="mbr-shop" card-buttons="">
         <!-- Shop Gallery -->
         <div class="row col-md-12">
            <div class="wrapper-shop-items col-md-12">
               <div class="mbr-gallery-row">
                  <div>
                     <div class="shop-items">

                     @if(count($products) > 0)
                      @foreach($products as $producto)
                               @component('components.product', ['producto' => $producto]) @endcomponent
                              @endforeach
                              @else
                        <h5>0 Resultados encontrados</h5>         
                              @endif
                     </div>
                  </div>
                  <div class="clearfix"></div>
               </div>
            </div>
         </div>
         <!-- Lightbox -->
         <div class="shopItemsModal_wraper" style="z-index: 100;">
            <div class="shopItemsModalBg"></div>
            <div class="shopItemsModal row">
               <div class="col-md-6 image-modal"></div>
               <div class="col-md-6 text-modal"></div>
               <div class="closeModal">
                  <div class="close-modal-wrapper"></div>
               </div>
            </div>
         </div>
      </div>
   </div>
</section>
--}}
@endsection