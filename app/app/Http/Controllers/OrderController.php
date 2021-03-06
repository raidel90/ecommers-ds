<?php

namespace App\Http\Controllers;
use Cart;
use Illuminate\Http\Request;
use DB;
use App\User;
use Auth;
use URL;
use Redirect;
use App\Product;
use App\Notifications\EntregaMail;


class OrderController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index2($id)
    {
        $order = \App\Order::where('id', $id)->firstOrFail();
        $categories = \App\Brandscategory::where('show_on_front', 1)->orderBy('order')->get();  
        $brands = \App\Brand::orderBy('order')->get();  
     
        return view('carts.success', [ 'order'=>$order ,  'brands'=>$brands ,  'categories'=>$categories ]);
    }

    public function reOrder($id){
        Cart::destroy(); 
    
        $order = \App\Order::where('id', $id)->firstOrFail();
        
        foreach(DB::SELECT('SELECT * FROM `orders_products` WHERE order_id = ' . $order->id) as $order){
            $p = \App\Product::where('id', $order->product_id)->firstOrFail();
        
            if($p->discount != "" && $p->discount != 0) { 
                $price = ($p->price - (($p->discount * $p->price)/100));
            } else {
                $price = $p->price;
            };
        
            Cart::add([ 'id' => $p->id . '-' . $p->code, 'weight' => $p->presentation, 'name' => $p->name, 'qty' => $order->quantity, 'price' => $p->price, 'options' => ['image' => $p->image, 'description' => $p->description, 'presentation'=>$p->presentation]]);
        }
        
        return redirect('/cart');
    }
    
    public function cancelar($id){
        
        $order = \App\Order::where('id', $id)->firstOrFail();
        
        $order->stateCode = 0;
        
        $order->save();
        
         return redirect('/order/' . $order->id);
    }
    
    public function ingresar($id){
        
        $order = \App\Order::where('id', $id)->firstOrFail();
        
        $order->stateCode = 1;
        
        $order->save();
        
        return redirect('/order/' . $order->id);
    }

    public function addOrder(Request $request){
        $order = new \App\Order;
        
       
        $order->referenceCode = $request->get('referenceCode');
        $order->description = $request->get('description');
        $order->user_id = auth()->user()->id;
    
        $order->save();
        $total = 0;
        foreach(Cart::content() as $row){	
            $total += $row->price;

            DB::table('orders_products')->insert(
                array('quantity' => $row->qty,
                      'order_id' => $order->id,
                      'product_id' => explode("-", $row->id )[0])
            );
        }
        
         $order->update([
            'value' => $total
        ]);
        Cart::destroy(); 
        return "true";
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request)
    {
        /*
        http://localhost:8000/success?merchantId=878812&merchant_name=Carlos+Andres+Romero+Ortiz&merchant_address=calle+26bsur+12i-65&telephone=3204358842&merchant_url=&transactionState=6&lapTransactionState=DECLINED&message=APPROVED&referenceCode=jdWSg8ilYyBlhnzYwXc&reference_pol=483869173&transactionId=c6ed286e-3b83-4d4c-86d3-3403554d0a1a&description=Compra+de+productos%3A+Mora+Deshidratada.&trazabilityCode=&cus=&orderLanguage=es&extra1=&extra2=&extra3=&polTransactionState=4&signature=38262e168504d5dca86375fc55cbdd31&polResponseCode=23&lapResponseCode=ANTIFRAUD_REJECTED&risk=&polPaymentMethod=12&lapPaymentMethod=AMEX&polPaymentMethodType=2&lapPaymentMethodType=CREDIT_CARD&installmentsNumber=1&TX_VALUE=22000.00&TX_TAX=.00&currency=COP&lng=es&pseCycle=&buyerEmail=guerrerodel90%40gmail.com&pseBank=&pseReference1=&pseReference2=&pseReference3=&authorizationCode=&TX_ADMINISTRATIVE_FEE=.00&TX_TAX_ADMINISTRATIVE_FEE=.00&TX_TAX_ADMINISTRATIVE_FEE_RETURN_BASE=.00&processingDate=2020-07-17
        http://localhost:8000/success?merchantId=878812&merchant_name=Carlos+Andres+Romero+Ortiz&merchant_address=calle+26bsur+12i-65&telephone=3204358842&merchant_url=&transactionState=6&lapTransactionState=DECLINED&message=DECLINED&referenceCode=zzcIAWJrT1dgiI5nOuw&reference_pol=483869173&transactionId=c6ed286e-3b83-4d4c-86d3-3403554d0a1a&description=Compra+de+productos%3A+Mora+Deshidratada.&trazabilityCode=&cus=&orderLanguage=es&extra1=&extra2=&extra3=&polTransactionState=6&signature=38262e168504d5dca86375fc55cbdd31&polResponseCode=23&lapResponseCode=ANTIFRAUD_REJECTED&risk=&polPaymentMethod=12&lapPaymentMethod=AMEX&polPaymentMethodType=2&lapPaymentMethodType=CREDIT_CARD&installmentsNumber=1&TX_VALUE=22000.00&TX_TAX=.00&currency=COP&lng=es&pseCycle=&buyerEmail=guerrerodel90%40gmail.com&pseBank=&pseReference1=&pseReference2=&pseReference3=&authorizationCode=&TX_ADMINISTRATIVE_FEE=.00&TX_TAX_ADMINISTRATIVE_FEE=.00&TX_TAX_ADMINISTRATIVE_FEE_RETURN_BASE=.00&processingDate=2020-07-17
        */

        $order = \App\Order::where('referenceCode', $request->get('referenceCode'))->firstOrFail();
        $order->payu_order_id = $_REQUEST["reference_pol"];
        $order->transaction_id = $_REQUEST["transactionId"];
        $order->state = $_REQUEST["lapTransactionState"];
        
        $cart = Cart::count();
        $total=0;
        foreach(Cart::content() as $row){	
            $total += $row->price;

        }
        $productos=Cart::content();


        $ApiKey = env('PAYU_API_KEY', null);
        $merchant_id = $_REQUEST['merchantId'];
        $referenceCode = $_REQUEST['referenceCode'];
        $TX_VALUE = $_REQUEST['TX_VALUE'];
        $New_value = $TX_VALUE;
        $currency = $_REQUEST['currency'];
        $transactionState = $_REQUEST['transactionState'];
        $firma_cadena = "$ApiKey~$merchant_id~$referenceCode~$New_value~$currency~$transactionState";
        $firmacreada = md5($firma_cadena);
        $firma = $_REQUEST['signature'];


        $order->TX_VALUE = $request->get('TX_VALUE');
        $order->description = $request->get('description');
        $order->referenceCode = $request->get('referenceCode');
        $order->reference = $request->get('referenceCode');
        $order->currency = $request->get('currency');
        $order->transactionState = $request->get('transactionState');
        $order->reference_pol = $request->get('reference_pol');
        $order->cus = $request->get('cus');
        $order->extra1 = $request->get('extra1');
        $order->pseBank = $request->get('pseBank');
        $order->lapPaymentMethod = $request->get('lapPaymentMethod');
        $order->transactionId = $request->get('transactionId');
        $order->date = date('Y-m-d h:m:s');

        
       


        if ($_REQUEST['transactionState'] == 4 ) {
            $estadoTx = "Transacción aprobada";
        
            $user = User::find($order->user_id);

				$user->notify(
					new EntregaMail($user,$order,$productos,$total)
                );
                
        }

        else if ($_REQUEST['transactionState'] == 6 ) {
            $estadoTx = "Transacción rechazada";
        }

        else if ($_REQUEST['transactionState'] == 104 ) {
            $estadoTx = "Error";
        }

        else if ($_REQUEST['transactionState'] == 7 ) {
            $estadoTx = "Transacción pendiente";
        }

        else {
            $estadoTx=$_REQUEST['mensaje'];
        }

        $order->estadoTx = $request->get('estadoTx');

        //para no guardar en BD la orden sino fue exitosa.
        if($_REQUEST['transactionState'] != 4)
            {
                $order->delete();
                return redirect('/cart');

            }
 
        $order->save();



        return redirect('/order/' . $order->id);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
