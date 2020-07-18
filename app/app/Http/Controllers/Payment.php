<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Order;
use App\Product;
use Cart;
use Auth;
use Session;
use DB;
use URL;
use App\Notifications\EntregaMail;


class Payment extends Controller
{
	function contraEntrega(){
	    
	    if(!Auth::check())
    	{
    		return redirect('/ingresar');
		}
    	else
    	{
    	    $order = \App\Order::where('referenceCode', $_REQUEST["referenceCode"])->first();

    	    if($order){
    	        return redirect('/order/' . $order->id);
    	    }
		$total = 0;

		$order = new Order;

		$order->value = $total;
        $order->referenceCode = $_REQUEST["referenceCode"];
        $order->stateCode = 1;
		$order->save();

		$productos= array();

		foreach(Cart::content() as $row){	
	        $total += $row->price;
	        DB::table('orders_products')->insert(
			    array('quantity' => $row->qty,
			          'order_id' => $order->id,
			          'tamaños' => $row->options->sabores,
			          'product_id' => explode("-", $row->id )[0])
			);


		}

		
		$updated = $order->update([
		            'value' => $total,
		            'user_id' => Auth::user()->id
				]);
				
		if($total == 0) return redirect('/cart');
		
	    $updated = $order->update([
            'reference' => 'CONTRA ENTREGA',
            'payu_order_id' => $order->id,
            'transaction_id' => '',
            'date' => date('Y-m-d h:m:s'),
            'state' => 'APPROVED'
		]);

		$productos=Cart::content();

		Cart::destroy(); 
        		
				$user=Auth::user();

				$user->notify(
					new EntregaMail($user,$order,$productos,$total)
				);
				   				
				
				$cart = Cart::count();
				$categories = \App\Brandscategory::where('show_on_front', 1)->get();  
				$brands = \App\Brand::all();  

    			return view('carts.success', [ 'order'=>$order ,  'brands'=>$brands ,  'categories'=>$categories ]);
	        }
	}

    function payment(){
   
    	if(!Auth::check())
    	{
    		return redirect('/register');
		}
    	else
    	{
	    	$total = 0;

	    	$order = new Order;

			$order->value = $total;

			$order->save();
   
			foreach(Cart::content() as $row){	
		        $total += $row->price;

		        DB::table('orders_products')->insert(
				    array('quantity' => $row->qty,
				          'order_id' => $order->id,
				          'product_id' => explode("-", $row->id )[0])
				);

				$productos[]= Product::find(explode("-", $row->id )[0]);

			}
			
			$updated = $order->update([
			            'value' => $total,
			            'user_id' => Auth::user()->id
			        ]);
            if($total == 0) return redirect('/cart');
			$data = [
			    \PayUParameters::ACCOUNT_ID => 512321,
			    \PayUParameters::REFERENCE_CODE => '11111',
			    \PayUParameters::DESCRIPTION => 'Compra de productos en SexTime',
			    
			    \PayUParameters::VALUE => $total,
			    \PayUParameters::CURRENCY => 'COP',
			    
			    //Session id del device
			    \PayUParameters::IP_ADDRESS => \Request::ip(),
			    \PayUParameters::DEVICE_SESSION_ID => Session::getId(),
			    \PayUParameters::PAYER_COOKIE => 'sextime.com.co',
			    \PayUParameters::USER_AGENT => 'sextime.com.co',
			    
			    //tarjeta
			    \PayUParameters::CREDIT_CARD_NUMBER => '4097440000000004',
			    \PayUParameters::CREDIT_CARD_EXPIRATION_DATE => '2019/12',
			    \PayUParameters::CREDIT_CARD_SECURITY_CODE => '321',
			    \PayUParameters::PAYMENT_METHOD => 'VISA',
			    
			    //cuotas
			    \PayUParameters::INSTALLMENTS_NUMBER => 1,
			    \PayUParameters::COUNTRY => \PayUCountries::CO,
			    
			    //COMPRADOR
			    \PayUParameters::BUYER_DNI => Auth::user()->name,
			    \PayUParameters::BUYER_NAME => Auth::user()->name,
			    \PayUParameters::BUYER_EMAIL => Auth::user()->email,
			    \PayUParameters::BUYER_CONTACT_PHONE => Auth::user()->phone,
			    \PayUParameters::BUYER_PHONE => Auth::user()->phone,
			    \PayUParameters::BUYER_STREET => Auth::user()->address,
			    \PayUParameters::BUYER_STREET_2 => '',
			    \PayUParameters::BUYER_CITY => Auth::user()->city,
			    \PayUParameters::BUYER_POSTAL_CODE => Auth::user()->state,
			    \PayUParameters::BUYER_STATE => Auth::user()->zip,
			    \PayUParameters::BUYER_COUNTRY => 'CO',
			    
			    //pagador
			    \PayUParameters::PAYER_NAME => 'APPROVED',
			    \PayUParameters::PAYER_EMAIL => 'payer_test@test.com',
			    \PayUParameters::PAYER_CONTACT_PHONE => '7563126',
			    \PayUParameters::PAYER_DNI => '5415668464654',
			    \PayUParameters::PAYER_STREET => 'calle 93',
			    \PayUParameters::PAYER_STREET_2 => '125544',
			    \PayUParameters::PAYER_CITY => 'Bogota',
			    \PayUParameters::PAYER_STATE => 'Bogota',
			    \PayUParameters::PAYER_COUNTRY => 'CO',
			    \PayUParameters::PAYER_POSTAL_CODE => '000000',
			    \PayUParameters::PAYER_PHONE => '7563126'

			];

			$resultado = $order->payWith($data, function($response, $order) {


			    if ($response->code == 'SUCCESS') {

			        $updated = $order->update([
			            'reference' => $response->transactionResponse->responseCode,
			            'payu_order_id' => $response->transactionResponse->orderId,
			            'transaction_id' => $response->transactionResponse->transactionId,
			            'date' => $response->transactionResponse->operationDate,
			            'state' => $response->transactionResponse->state
			        ]);
					

			    } else {
			    	
			   		$order->update([ 'state' => $error->payUCode ]);
			    	dd($response);
					die();
			    }
			}, function($error) {
			    	// ... Manejo de errores PayUException, InvalidArgument
					dd($error);	    
					die();	    	
			   
			    //$status = 'OPS, ocurrió un error intentelo nuevamente';
			   
			});

			//FIN
			
			if ($order->state == 'DECLINED') 
	        {
                return redirect('/cart')->with('status', 'OPS, ocurrió un error intentelo nuevamente');
	        }
	       
	        if ($order->state == 'APPROVED') 
	        {
        		Cart::destroy(); 
        		
				$user=Auth::user();

				$user->notify(
					new EntregaMail($user,$order,$productos,$total)
				);
				
				$cart = Cart::count();
				$categories = \App\Brandscategory::where('show_on_front', 1)->get();  
				$brands = \App\Brand::all();  

    			return view('carts.success', [ 'order'=>$order ,  'brands'=>$brands ,  'categories'=>$categories ]);
               // return view('success', [ 'cart'=>$cart, 'order'=>$order  ]);
	        }

		}
    }
}


