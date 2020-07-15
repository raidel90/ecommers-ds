<div class="card item features-image col-12 col-md-6 col-lg-3">
   <div class="item-wrapper">
       <div class="card-img">
         @if($producto->image)
           <a href="/detail/{{$producto->id}}"><img src="{{ Voyager::image( $producto->image ) }}" alt="" title=""></a>
         @else
            <a href="/detail/{{$producto->id}}"><img src="{{ Voyager::image( setting('site.default_image') ) }}" alt="" title=""></a>
         @endif  
       </div>
       <div class="card-box pt-4">
           <h4 class="card-title pb-3 mbr-bold mbr-fonts-style display-7">{{App\Brandscategory::find($producto->brandscategories_id)->name}}<div>
              <span style="font-weight: normal;">{{$producto->name}}</span></div></h4>
           <p class="mbr-text mbr-fonts-style display-7"><strong>${{number_format($producto->price,0,",",".")}} COP</strong><br></p>

           <div class="link-align">
               <div class="link-inline">
                   <div class="link-wrap">
                       <h5 class="link mbr-bold mbr-fonts-style display-4"><a href="/detail/{{$producto->id}}"><strong>VER MÁS</strong></a></h5>
                       <span class="mbr-iconfont mbr-bold mobi-mbri-right mobi-mbri"></span>
                   </div>
               </div>
           </div>

       </div>
   </div>
</div>



{{-- comment 

<div class="mbr-gallery-item" style="min-height:370px;">
     <div class="item_overlay" href="/detail/{{$producto->id}}" data-toggle="modal"></div>
     <div class="galleryItem" data-toggle="modal">
        <div class="style_overlay"></div>
        <div class="img_wraper">
            <a href="/detail/{{$producto->id}}">
               <h4 style="font-size: 1rem;text-align: center;padding-top: 15px;margin: 0 55px;color:black;">{{$producto->name}}</h4>
               @if($producto->image)
               <img src="{{ Voyager::image( $producto->image ) }}"  alt="" title="">
               @else
               <img src="{{ Voyager::image( setting('site.default_image') ) }}"  alt="" title="">
               @endif
            </a>
        </div>
        @if($producto->discount != "" && $producto->discount != 0) 
         <span class="onsale mbr-fonts-style display-7" data-onsale="false">-{{$producto->discount}}%</span>
        @endif
        <div class="sidebar_wraper">
           <h4 class="item-title mbr-fonts-style mbr-text display-5"><a href="/detail/{{$producto->id}}">{{$producto->name}}</a></h4>
           <div class="price-block">
              <span class="shop-item-price mbr-fonts-style display-5">$ @if($producto->discount != "" && $producto->discount != 0) {{number_format(($producto->price - (($producto->discount * $producto->price)/100)),0,",",".")}} @else {{number_format($producto->price,0,",",".")}} @endif</span>
              @if($producto->discount != "" && $producto->discount != 0)<span class="oldprice mbr-fonts-style display-7">${{number_format($producto->price,0,",",".")}}</span>@endif
           </div>
           <div class="card-description">
              {!!$producto->description!!}
              <br>Product code: <strong>{{$producto->code}}</strong>
           </div>
           <div class="mbr-section-btn" buttons="0">
           	  <a href="/detail/{{$producto->id}}"  class="btn btn-form btn-primary display-7 btnDescription">Ver descripciš®n</a>
           	  @if($producto->active == 0)
           	  <a href="#!" class="btn btn-form btn-primary display-7 disabled">Sin Stock</a>
           	  @else
              <a href="#!" onclick="addProduct({{$producto->id}})" class="btn btn-form btn-primary display-7">Comprar ahora</a>
              @endif
           </div>
        </div>
     </div>
  </div>
--}}