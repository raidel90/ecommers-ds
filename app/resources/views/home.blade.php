@extends('layouts.app')

@section('content')
<section class="accordion1 cid-rhrAlEmgva" id="accordion1-18" data-sortbtn="btn-primary" style="margin-top:200px;">
@if (session('status'))
    <div class="alert alert-success" role="alert">
        {{ session('status') }}
    </div>
@endif
    <div class="container-fluid">
        <div class="media-container-row align-center">
            <div class="col-12 col-md-12">
                <h2 class="mbr-section-title mbr-fonts-style display-2">
                    <br>MIS<strong> PEDIDOS</strong></h2>
                <div class="underline align-center pb-3">
                    <div class="line"></div>
                </div>
                @php 
                date_default_timezone_set('Europe/Madrid');
                // Unix
                setlocale(LC_TIME, 'es_ES.UTF-8');
                // En windows
                setlocale(LC_TIME, 'spanish');
                $payUStates = new stdClass();
                $payUStates->{4} = 'Aprobado';
                $payUStates->{6} = 'Rechazado';
                $payUStates->{104} = 'Error';
                $payUStates->{5} = 'Expirado';
                $payUStates->{7} = 'Pendiente';
                @endphp
                <div id="bootstrap-accordion_29" class="panel-group accordionStyles accordion col-sm-12 col-md-10 col-lg-12 align-left pt-5" role="tablist" aria-multiselectable="true">
                    @php $orders = App\Order::where('user_id', auth()->user()->id)->orderBy('id', 'desc')->get() @endphp
                    @if(count($orders) > 0)
                    @foreach($orders as $order) 
                    <div class="card text-center">
                        <div class="card-header" role="tab" id="headingOne">
                            <a role="button" class="collapsed panel-title text-black" href="/order/{{$order->id}}" >
                                @if($order->payu_order_id)
                                <span class="sign mbr-iconfont mbri-share inactive"></span>@endif
                                <h4 style="    display: inline-block;margin-left: 20px;" class="mbr-fonts-style header-text display-5">
                                  {{date("j F, Y", strtotime($order->created_at))}} - Estado General: @if($order->stateCode == 0) Cancelado @elseif($order->stateCode == 1) Ingresado @elseif($order->stateCode ==2) En Camino @elseif($order->stateCode == 3) Entregado @endif - Estado Pago: @if($order->payu_order_id){{($order->reference=="APPROVED"?'PAGADA':$order->reference)}}@else INCOMPLETA @endif @if($order->transactionState) {{ $payUStates->{$order->transactionState} }} @endif
                                </h4>
                            </a>
                            
                        </div>
                    </div>
                    @endforeach
                    @else
                        <div class="row">
                            <div class="col-md-12 text-center">
                                <h4>0 pedidos encontrados!</h4>
                            </div>
                        </div>  
                    @endif
                </div>
            </div>
        </div>
    </div>
</section>
@endsection
