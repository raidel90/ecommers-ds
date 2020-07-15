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
         .go-to-cart{
             border-radius: 100%;
             color: #f6f6f6 !important;
             background-color: #e842f4;
             border-color: transparent;
             margin: 2%;
             z-index: 999999;
             position: fixed;
             top: 85%;
             height: 50px;
             right: 0;
             font-size: 1.5rem !important;
             width: 50px;
             padding: 10px 12px;
             @if($cart == 0) display: none; @endif
         }
      .cart-page section{padding:50px 0 100px}.cart-page .arrow{margin:50px auto}.cart-page .arrow span{display:inline-block;-webkit-transform-origin:bottom left;transform-origin:bottom left;width:50px;height:1px;background:#888}.cart-page .arrow span:first-of-type{-webkit-transform-origin:bottom right;transform-origin:bottom right;-webkit-transform:rotate(25deg);transform:rotate(25deg)}.cart-page .arrow span:last-of-type{-webkit-transform:rotate(-25deg);transform:rotate(-25deg)}section.cart{padding-bottom:0}section.cart .cart-heading{background:#212529;color:#fff;padding:10px 20px;font-size:1em;font-weight:400}section.cart .cart-body{padding:10px 0 0;overflow:hidden;border-bottom:1px solid #ccc;font-family:"Roboto",sans-serif}section.cart .cart-body a{color:#333}section.cart .cart-body .cart-item{padding:30px;border-bottom:1px solid #eee}section.cart .product-details{padding:0 20px}section.cart .product-details h3{font-weight:400}section.cart .product-img{max-width:150px}section.cart .total-price{margin-top:20px}section.cart .total-price span,section.cart .total-price strong{font-family:"Roboto",sans-serif;font-weight:700}section.cart .product-quantity .minus-btn,section.cart .product-quantity .plus-btn{width:35px;height:35px;line-height:35px;color:#555;text-align:center;border:1px solid #ccc;cursor:pointer}section.cart .product-quantity .minus-btn{border-top-left-radius:40px;border-bottom-left-radius:40px}section.cart .product-quantity .plus-btn{border-top-right-radius:40px;border-bottom-right-radius:40px}section.cart .product-quantity input{width:60px;height:35px;font-size:1em;font-weight:300;color:#555;text-align:center;outline:none;border:1px solid #ccc;background:none}section.cart a:hover,section.cart a:focus{color:#ff6b6b;text-decoration:none}section.shipping{padding:0}section.shipping form h3{margin:30px 0}section.shipping .bootstrap-select{position:relative;height:60px}section.shipping .bootstrap-select button{height:auto !important}section.shipping .shipping-alternative{display:none}section.shipping .payment-cards{margin-bottom:10px}@media (max-width: 768px){section.cart>.container{width:100%;overflow:scroll !important}section.cart>.container .cart-holder{min-width:768px}section.cart .product-quantity input{width:40px}}
      
      @media only screen and (max-width: 600px) {
          .total-price button {
            display:inline-block;
          }
        }
        
        
        
        
        table {
  border: 1px solid #ccc;
  border-collapse: collapse;
  margin: 0;
  padding: 0;
  width: 100%;
  table-layout: fixed;
}

table caption {
  font-size: 1.5em;
  margin: .5em 0 .75em;
}

table tr {
  /*background-color: #f8f8f8;*/
  border: 1px solid #ddd;
  padding: .35em;
}

table th,
table td {
  padding: .625em;
  text-align: center;
}

table th {
  font-size: .85em;
  letter-spacing: .1em;
  text-transform: uppercase;
}

@media screen and (max-width: 600px) {
  table {
    border: 0;
  }

  table caption {
    font-size: 1.3em;
  }
  
  table thead {
    border: none;
    clip: rect(0 0 0 0);
    height: 1px;
    margin: -1px;
    overflow: hidden;
    padding: 0;
    position: absolute;
    width: 1px;
  }
  
  table tr {
    border-bottom: 3px solid #ddd;
    display: block;
    margin-bottom: .625em;
  }
  
  table td {
    border-bottom: 1px solid #ddd;
    display: block;
    font-size: .8em;
    text-align: right;
  }
  
  table td::before {
    /*
    * aria-label has no advantage, it won't be read inside a table
    content: attr(aria-label);
    */
    content: attr(data-label);
    float: left;
    font-weight: bold;
    text-transform: uppercase;
  }
  
  table td:last-child {
    border-bottom: 0;
  }
}
      </style>
@endsection
@section('content') 
<br><br><br><br><br>

     <section class="cart" style="    margin: 10vh 0px 15vh 0;background: white;">
        <div class="container" style="max-width: 1500px;">
          <!--div class="cart-holder">
            <div class="cart-heading text-center">
              <div class="row">
                <div class="col-2 text-center">Producto</div>
                <div class="col-3">Descripci��n</div>
                <div class="col-2">Precio</div>
                <div class="col-2">Sabores Disponibles</div>
                <div class="col-2">Cantidad</div>
                <div class="col-2">Sub Total</div>
                <div class="col-1"></div>
              </div>
            </div>
            <div class="cart-body text-center">
              @php $total = 0; @endphp
              @foreach(Cart::content() as $row)
              @php $total += $row->price * $row->qty; @endphp
              <div class="row cart-item">
                <div class="col-2">
                  <div class="product-overview text-left d-flex"><a style="margin: auto;" href="#!" class="product-img"><img src="{{ Voyager::image( $row->options["image"] ) }}" alt="product" class="img-fluid"></a>
                    
                  </div>
                  <div class="product-details"><a href="detail.html">
                        <h3 class="h4">{{$row->name}}</h3></a></div>
                </div>
                <div class="col-3" style="    max-height: 150px;overflow: hidden;overflow-y: scroll;">{!!$row->options["description"]!!}</strong></div>
                <div class="col-2"><strong>${{$row->price}}</strong></div>
                <div class="col-2">
                  @php 
                  $flavors = DB::SELECT( 'SELECT * FROM `flavors` f JOIN products_flavors pf ON pf.flavor_id = f.id WHERE pf.product_id = ' . explode("-", $row->id)[0]);
                  @endphp
                  @if(count($flavors) > 0)
                    <select onchange="sabores('{{$row->rowId}}', this);" multiple="" style="width: 100%;">
                      @foreach( $flavors as $flavor)
                      <option @if(strpos($row->options->sabores, $flavor->name) !== false) selected @endif >{{$flavor->name}}</option>
                      @endforeach
                    </select>
                  @else
                  <h5>No hay sabores disponibles</h5>
                  @endif
                </div>
                <div class="col-2">
                  <div class="product-quantity d-flex align-items-center justify-content-center">
     
                    <input type="number" onchange="qty('{{$row->rowId}}')" value="{{$row->qty}}" class="quantity">
     
                  </div>
                </div>
                <div class="col-2"><strong value="{{$row->price}}">${{$row->qty * $row->price}}</strong></div>
                <div class="col-1"><a href="#!" onclick="deleteRow('{{$row->rowId}}')"><i class="fa fa-close"></i></a></div>
              </div>
              @endforeach
            </div>
          </div-->
          <div class="cart">
              <div style="overflow-x:auto;">
                  <table>
                      <thead>
                    <tr>
                        <th class="text-center">Producto</th>
                            <!--th class="col-3">Descripcion</th-->
                            <th scope="col">Precio</th>
                            <th scope="col">Sabores Disponibles</th>
                            <th scope="col">Cantidad</th>
                            <th scope="col">Sub Total</th>
                            <th scope="col">Acciones</th>
                    </tr>
                    </thead>
  <tbody>
                    @php $total = 0; $nameProductos = ''; @endphp
                      @foreach(Cart::content() as $row)
                      @php $total += $row->price * $row->qty; $nameProductos .= $row->name . ','; @endphp
                      <tr>
                      <td style="text-align:center;"><a style="margin: auto;display:block;" href="#!" class="product-img"><img style="max-width:150px;" src="{{ Voyager::image( $row->options["image"] ) }}" alt="product" class="img-fluid"></a>
                            
                          
                          
                                <h3 class="h4" style="display:block;">{{$row->name}}</h3>
                        </td>
                        <!--td>{!!$row->options["description"]!!}</td-->
                        <td><strong>${{number_format($row->price,2,",",".")}}</strong></td>
                        <td>
                          @php 
                          $flavors = DB::SELECT( 'SELECT * FROM `flavors` f JOIN products_flavors pf ON pf.flavor_id = f.id WHERE pf.product_id = ' . explode("-", $row->id)[0]);
                          @endphp
                          @if(count($flavors) > 0)
                            <select class="js-example-basic-multiple" onchange="sabores('{{$row->rowId}}', this);" multiple="" style="width: 100%;">
                              @foreach( $flavors as $flavor)
                              <option @if(strpos($row->options->sabores, $flavor->name) !== false || ($flavor->name == "Vainilla2222" && ($row->options->sabores == ''))) selected @endif >{{$flavor->name}}</option>
                              @endforeach
                            </select>
                          @else
                          <h5>No hay sabores disponibles</h5>
                          @endif
                        </td>
                        <td>
                          <div class="product-quantity d-flex align-items-center justify-content-center">
             
                            <input min="1" type="number" onchange="qty('{{$row->rowId}}', this)" value="{{$row->qty}}" class="quantity">
                            
                          </div>
                        </td>
                        <td><strong value="{{$row->price}}">${{number_format(($row->qty * $row->price),2,",",".")}}</strong>
                        </td>
                        <td>
                            <a href="#!" onclick="deleteRow('{{$row->rowId}}', this)">Borrar <span class="p-2 mbr-iconfont mbri-close"></span>
                            </a></td>
                      
                      </tr>
                      @endforeach
                      </tbody>
                  </table>
                </div>
          </div>
          <div class="total-price text-right">
            <div class="container">
              <div class="justify-content-end align-items-center"><span class="h3">Total: &nbsp;</span><strong class="h2 totaltotal text-primary">${{number_format($total,2,",",".")}}</strong></div>
            </div>
          </div>
          @if($total > 0) 
          <div class="total-price text-right" style="    margin-bottom: 72px;">
            <div class="container">
              <div class="justify-content-end align-items-center">
                @if(\Auth::check() ||  session('suscripto'))
                <!--button onclick="if (confirm('¡Solo para bogota!')) window.location.href='/contra-entrega';" class="btn btn-form btn-primary display-4">
                    Pagar Contraentrega
                    
                    </button-->
                    @php
                    function randomStr($length = 19) {
    $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    $charactersLength = strlen($characters);
    $randomString = '';
    for ($i = 0; $i < $length; $i++) {
        $randomString .= $characters[rand(0, $charactersLength - 1)];
    }
    return $randomString;
}
$stringRamdom = randomStr();
                    @endphp
                <button type="button" onclick="$('#aceptarContra').attr('href', '#!');$('#aceptarContra').attr('onclick', 'window.location.href=\'/contra-entrega?referenceCode='+$('input[name=referenceCode]').val()+'\';');$('#myModal .hidden').removeClass('hidden');" class="btn btn-form btn-primary display-4" data-toggle="modal" data-target="#myModal">Confirmar Contraentrega</button>
                    <form method="post" style="    display: contents;" action="https://checkout.payulatam.com/ppp-web-gateway-payu/">
                      <input name="merchantId"    type="hidden"  value="{{env('PAYU_MERCHANT_ID')}}"   >
                      <input name="accountId"     type="hidden"  value="{{env('PAYU_ACCOUNT_ID')}}" >
                      <input name="description"   type="hidden"  value="Compra de productos: {{rtrim($nameProductos,',')}}."  >
                      <input name="referenceCode" type="hidden"  value="{{$stringRamdom}}" >
                      <input name="amount"        type="hidden"  value="{{$total}}"   >
                      <input name="tax"           type="hidden"  value="0"  >
                      <input name="taxReturnBase" type="hidden"  value="0" >
                      <input name="currency"      type="hidden"  value="COP" >
                      <input name="signature"     type="hidden"  value="{{md5(env('PAYU_API_KEY') . '~'.env('PAYU_MERCHANT_ID').'~'.$stringRamdom.'~'.$total .'~COP')}}">
                      <input name="buyerFullName"          type="hidden"  value="{{Auth::user()->name}}" >
                      <input name="buyerEmail"    type="hidden"  value="{{Auth::user()->email}}" >
                      <input name="shippingAddress"    type="hidden"  value="{{Auth::user()->address}}" >
                      <input name="shippingCity"    type="hidden"  value="{{Auth::user()->city}}" >
                      <input name="shippingCountry"    type="hidden"  value="COL" >
                      <input name="telephone"    type="hidden"  value="{{Auth::user()->phone}}" >
                      <input name="responseUrl"    type="hidden"  value="https://www.expressnutrition.co/success" >
                      <input name="confirmationUrl"    type="hidden"  value="https://www.expressnutrition.co/cart" >
                      <input style="    min-width: 282px;" id="submitBTN" name="Submit"        type="button"  value="Confirmar Pago" class="btn btn-form btn-primary display-4" >
                    </form>

                    @else
                    <button type="button" class="btn btn-form btn-primary display-4" data-toggle="modal" onclick="$('#aceptarContra').attr('href', '#!');$('#aceptarContra').attr('onclick', 'window.location.href=\'/contra-entrega?referenceCode='+$('input[name=referenceCode]').val()+'\';');$('#myModal .hidden').removeClass('hidden');" data-target="#myModal">Pagar Contraentrega</button>
                    <a href="/ingresar" style="    min-width: 204px;" class="btn btn-form btn-primary display-4">
                    Pagar Ahora
                    
                    </a>
                @endif
              </div>
            </div>
          </div>
          @else
            <a href="/" class="btn btn-form btn-primary display-4"> Ir a comprar! </a>
          @endif
        </div>
      </section>
      @endsection
      @section('js')
      <script type="text/javascript">
      var elemento = '';
           function qty(id, elem){
            //alert(id);
            $.get('/cart/update/' + id+ '/' + $(elem).val(), function(response){
                $(".totaltotal").text("$"  + response);
            });
          }
          $(".quantity").on("change", function(){ 
              
        $(this).parent().parent().next().find("strong").text("$" + ins1000Sep(formatNum( ($(this).val() * $(this).parent().parent().next().find("strong").attr("value")))));
        })
        function sabores(id, elem){
            elemento = elem;
            $.get('/cart/updateSabores/' + id + '/' + $(elem).val(), function(response){  $(elemento).attr("onchange", $(elemento).attr("onchange").replace(JSON.parse(response)[1], JSON.parse(response)[0]));
                
            });
          }
          function deleteRow(id, elem){
            elemento = elem;
            $.get('/cart/delete/' + id, function(response){ if(response == 0){
                window.location = "/cart";
                
            }else{ $(".totaltotal").text("$"  + response);  $(elemento).parent().parent().remove(); }
            });
          }
          function ins1000Sep(val){
  val = val.split(".");
  val[0] = val[0].split("").reverse().join("");
  val[0] = val[0].replace(/(\d{3})/g,"$1,");
  val[0] = val[0].split("").reverse().join("");
  val[0] = val[0].indexOf(",")==0?val[0].substring(1):val[0];
  return val.join(".");
}
function rem1000Sep(val){
  return val.replace(/,/g,"");
}
function formatNum(val){
  val = Math.round(val*100)/100;
  val = (""+val).indexOf(".")>-1 ? val + "00" : val + ".00";
  var dec = val.indexOf(".");
  return dec == val.length-3 || dec == 0 ? val : val.substring(0,dec+3);
}
      </script>
      <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
       <script> $(document).ready(function() {
    $('.js-example-basic-multiple').select2({
    placeholder: "Selecciona el/los Sabore/s",
    allowClear: false
});
});
$("#submitBTN").on("click", () => {
  $.ajaxSetup({
    headers: {
        'X-CSRF-TOKEN': $('input[name="_token"]').val()
    }
  });
  $.ajax({
    url:'success',
    method: 'post', 
    data: $('#submitBTN').parent("form").serialize(), 
    success: resp => {
      if($.trim(resp) == "true"){
        $('#submitBTN').parent("form").submit();
      }
    }
  });
})
</script>
   @endsection  