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
         
      </style>
@endsection
@section('content') 


<section class="header3 cid-rQYSee2dZ9 mbr-parallax-background" id="header3-19">

    

   <div class="mbr-overlay" style="opacity: 0.4;">
   </div>

   <div class="container align-center">
       <div class="row justify-content-center">
           <div class="media-container-column mbr-white col-md-10">
               
               <h1 class="mbr-section-title mbr-bold pb-3 mbr-fonts-style display-2"><br>{{$category->name}}</h1>
               
               
           </div>
       </div>
   </div>
   
</section>

<section class="features05 cid-s0k8norKO3" id="features05-4r">

    

    
   <div class="container">
       <div class="row">


           <div class="col-md-12 pb-5 col-lg-12 align-center">

               
               <h1 class="mbr-section-title pb-3 mbr-exbold mbr-fonts-style display-5"><span style="font-weight: normal;">PRODUCTOS {{$category->name}}</span></h1>
           </div>

           @foreach(\App\Product::where('brandscategories_id', $category->id)->get() as $producto)
               @component('components.product', ['producto' => $producto]) @endcomponent
            @endforeach

       </div>
   </div>

</section>


{{-- codigo viejo 

<section class="mbr-section article content1 cid-rhryNDNGwB mbr-gallery cid-rhrzQ8q8HS" id="shop4-15" style="margin-top:3vh;">
   <div class="container">
      <div class="mbr-shop" card-buttons="">
         <!-- Shop Gallery -->
         <div class="row col-md-12">
            <div class="wrapper-shop-items col-md-12">
               <div class="mbr-gallery-row">
                  <div>
                     <div class="shop-items">
  
                    @foreach(\App\Product::where('brandscategories_id', $category->id)->get() as $producto)
                      @component('components.product', ['producto' => $producto]) @endcomponent
                      @endforeach
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