@extends('layouts.app')
@section('content')

<section class="cid-rf5VjUkWqe" id="content7-9" data-sortbtn="btn-primary">
   <div class="container-fluid">
      <div class="row justify-content-center">
         <div class="col-12 col-lg-6 col-md-8 align-center">
            <h2 class="mbr-section-title align-center mbr-fonts-style mbr-bold display-2">
               Artículos <span style="font-weight: normal;">Nutrition</span>
            </h2>
         </div>
      </div>
   </div>
</section>
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
                        <h5>Sin Artículos Disponibles</h5>         
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
@endsection