@extends('layouts.app')
@section('content') 
<section class="table1 section-table cid-rhpFL4BvYc" style="padding-top: 20vh;" id="table1-r" data-sortbtn="btn-primary">
   <div class="container-fluid">
      <div class="media-container-row align-center">
         <div class="col-12 col-md-12">
             @if($order->stateCode == 0)
            <h2 class="mbr-section-title mbr-fonts-style mbr-black display-5"><br>Pedido Cancelado !!!.</h2> 
             @else
            <h2 class="mbr-section-title mbr-fonts-style mbr-black display-5"><br>Listo!, estamos preparando tu pedido, lo enviarémos lo antes posible!, muchas gracias.</h2>
            @endif
            <div class="underline align-center pb-3">
               <div class="line"></div>
            </div>
            <div class="table-wrapper pt-5" style="width: 82%; margin:auto;">
               <div class="container-fluid">
                  <div class="row search">
                     <div class="col-md-6"></div>
                     <div class="col-md-6">
                        <!--div class="dataTables_filter">
                           <label class="searchInfo mbr-fonts-style display-7">Buscar:</label>
                           <input class="form-control input-sm" disabled="">
                        </div-->
                        @if($order->stateCode == 1)
                        <a href="/cancelar/{{$order->id}}" class="btn btn-form btn-warning display-4">Cancelar Pedido</a>
                        @endif
                        @if($order->stateCode == 0)
                        <a href="/ingresar/{{$order->id}}" class="btn btn-form btn-warning display-4">Ingresar Pedido</a>
                        @endif
                        <a href="/reorder/{{$order->id}}" class="btn btn-form btn-primary display-4">Encargar nuevamente</a>
                     </div>
                  </div>
               </div>
               <div class="container-fluid scroll">
                  <table class="table table-striped isSearch" cellspacing="0">
                     <thead>
                        <tr class="table-heads">
                           <th class="head-item mbr-fonts-style display-4"><strong>Producto</strong></th>
                           <th class="head-item mbr-fonts-style display-4"><strong></strong></th>
                           <th class="head-item mbr-fonts-style display-4"><strong>Cantidad</strong></th>
                           <th class="head-item mbr-fonts-style display-4"><strong>Total</strong></th>
                        </tr>
                     </thead>
                     <tbody>
                         @php $total = 0; @endphp
                        @foreach(DB::table('orders_products')->where('order_id', '=', $order->id)->get() as $order_product) 
                        @foreach(DB::table('products')->where('id', '=', $order_product->product_id)->get() as $product) 
                        @php
                            $total += $order_product->quantity * $product->price;
                        @endphp
                        <tr>
                           <td class="body-item mbr-fonts-style display-7">{{$product->name}}</td>
                           <td class="body-item mbr-fonts-style display-7"><img style="max-width:150px;" src="{{ Voyager::image( $product->image ) }}" alt="" title=""> </td>
                           <td class="body-item mbr-fonts-style display-7">{{$order_product->quantity}}</td>
                           <td class="body-item mbr-fonts-style display-7">$ {{$product->price}}</td>
                        </tr>
                        @endforeach
                        @endforeach
                        <tr>
                           <td class="body-item mbr-fonts-style display-7"></td><td class="body-item mbr-fonts-style display-7"></td>
                           <td class="body-item mbr-fonts-style display-7">Total:</td>
                           <td class="body-item mbr-fonts-style display-7">$ {{$total}}</td>
                        </tr>
                     </tbody>
                  </table>
               </div>

            </div>
         </div>
      </div>
   </div>
</section>
@php
    $user = App\User::where('id', $order->user_id)->firstOrFail();
@endphp
<section class="table2 section-table cid-rhpIqIFoI4" id="table2-t" data-sortbtn="btn-primary">
   <div class="container-fluid">
      <div class="media-container-row align-center">
         <div class="col-12 col-md-12">
            <h2 class="mbr-section-title mbr-fonts-style mbr-black display-5 text-center">Detalles</h2>
            <div class="table-wrapper pt-5" style="width: 82%;margin:auto;">
               <div class="container-fluid">
               </div>
               <div class="container-fluid scroll">
                  <table class="table table-striped" cellspacing="0">
                     <thead>
                         <tr class="table-heads">
                           <th class="head-item mbr-fonts-style display-4">Estado del pedido:</th>
                           <th class="head-item mbr-fonts-style display-4">
                               @php
                               $estadoPedido = 'Ingresado';
                               if($order->stateCode == 2){
                                $estadoPedido = 'En camino';
                               }else if($order->stateCode == 3){
                                 $estadoPedido = 'Entregado';
                               }else if($order->stateCode == 0){
                               $estadoPedido = 'Cancelado';
                               }
                               @endphp
                               {{  $estadoPedido  }}
                            </th>
                        </tr>
                         
                         <tr class="table-heads">
                           <th class="head-item mbr-fonts-style display-4">Estado de Pago:</th>
                           <th class="head-item mbr-fonts-style display-4">
                            @if($order->transactionState == 4) APROBADA
                            @elseif($order->transactionState == 6) DECLINADA
                            @elseif($order->transactionState == 104) ERROR
                            @elseif($order->transactionState == 5) EXPIRÓ
                            @elseif($order->transactionState == 7) PENDIENTE
                            @else No Pagado
                            @endif
                            </th>
                        </tr>
                        
                        <tr class="table-heads">
                           <th class="head-item mbr-fonts-style display-4">Tipo de pago:</th>
                           <th class="head-item mbr-fonts-style display-4">
                               @if($order->reference)
                                    Contra Entrega
                                @else
                                
                                   PayU
                                @endif
                            </th>
                        </tr>
                        
                        <tr class="table-heads">
                           <th class="head-item mbr-fonts-style display-4">Email:</th>
                           <th class="head-item mbr-fonts-style display-4">{{$user->email}}</th>
                        </tr>
                     </thead>
                     <tbody>
                        <tr>
                           <td class="body-item mbr-fonts-style display-7">Teléfono:</td>
                           <td class="body-item mbr-fonts-style display-7">{{$user->phone}}</td>
                        </tr>
                     </tbody>
                  </table>
               </div>
               <div class="container-fluid table-info-container">
               </div>
            </div>
         </div>
      </div>
   </div>
</section>
<section class="table1 section-table cid-rhpJumSyYf" id="table1-v" data-sortbtn="btn-primary">
   <div class="container-fluid">
      <div class="media-container-row align-center">
         <div class="col-12 col-md-12">
            <div class="table-wrapper pt-5" style="width: 82%;margin:auto;">
               <div class="container-fluid">
               </div>
               <div class="container-fluid scroll">
                  <table class="table table-striped" cellspacing="0">
                     <thead>
                        <tr class="table-heads">
                           <th class="head-item mbr-fonts-style display-4"><strong>Dirección de Envío</strong></th>
                           <th class="head-item mbr-fonts-style display-4"><strong>Dirección de Envío</strong></th>
                        </tr>
                     </thead>
                     <tbody>
                        <tr>
                           <td class="body-item mbr-fonts-style display-7">
                              <br>{{$user->name}}
                              <br>{{$user->address}}
                              <br>{{$user->dni}}
                              <br>{{$user->state}}
                              <br>{{$user->zip}}, {{$user->city}} 
                           </td>
                           <td class="body-item mbr-fonts-style display-7">
                              <br>{{$user->name}}
                              <br>{{$user->address}}
                              <br>{{$user->dni}}
                              <br>{{$user->state}}
                              <br>{{$user->zip}}, {{$user->city}} 
                           </td>
                        </tr>
                     </tbody>
                  </table>
               </div>
               <div class="container-fluid table-info-container">
               </div>
            </div>
         </div>
      </div>
   </div>
</section>
@endsection