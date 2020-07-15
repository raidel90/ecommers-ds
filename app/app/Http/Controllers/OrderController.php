<?php

namespace App\Http\Controllers;
use Cart;
use Illuminate\Http\Request;
use DB;
use App\User;
use Auth;
use URL;
use Redirect;

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
        
            Cart::add([ 'id' => $p->id . '-' . $p->code, 'weight' => 0, 'name' => $p->name, 'qty' => $order->quantity, 'price' => $p->price, 'options' => ['image' => $p->image, 'description' => $p->description, 'sabores'=>$order->sabores]]);
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
        $order = \App\Order::where('referenceCode', $request->get('referenceCode'))->firstOrFail();
        $order->payu_order_id = $_REQUEST["reference_pol"];
        $order->transaction_id = $_REQUEST["transactionId"];
        $order->state = $_REQUEST["lapTransactionState"];
        
        $cart = Cart::count();



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
        $order->currency = $request->get('currency');
        $order->transactionState = $request->get('transactionState');
        $order->reference_pol = $request->get('reference_pol');
        $order->cus = $request->get('cus');
        $order->extra1 = $request->get('extra1');
        $order->pseBank = $request->get('pseBank');
        $order->lapPaymentMethod = $request->get('lapPaymentMethod');
        $order->transactionId = $request->get('transactionId');
        
        
       

        
        $msg = 'con éxito, en la menor brevedad y te lo enviarémos lo antes posible';
        if ($_REQUEST['transactionState'] == 4 ) {
            $estadoTx = "Transacción aprobada";
            $user = User::find($order->user_id);
            $user->notify(new NewOrder($user));
        }

        else if ($_REQUEST['transactionState'] == 6 ) {
            $msg = 'pero la transacción fue rechazada';
            $estadoTx = "Transacción rechazada";
        }

        else if ($_REQUEST['transactionState'] == 104 ) {
            $msg = 'pero hubo un error, intentalo nuevamente';
            $estadoTx = "Error";
        }

        else if ($_REQUEST['transactionState'] == 7 ) {
            $msg = 'y está en estado pendiente, en cuanto se complete el pago enviaremos tus productos';
            $estadoTx = "Transacción pendiente";
        }

        else {
            $msg = $_REQUEST['mensaje'];
            $estadoTx=$_REQUEST['mensaje'];
        }

        $order->estadoTx = $request->get('estadoTx');


        $to = Auth::user()->email;

        $subject = 'Datos de la compra';

        $headers = "From: ".env('MAIL_USERNAME')."\r\n";
        $headers .= "CC: ".env('MAIL_CC')."\r\n";
        $headers .= "MIME-Version: 1.0\r\n";
        $headers .= "Content-Type: text/html; charset=UTF-8\r\n";
        
        $message = '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><html style="width:100%;font-family:\'open sans\', \'helvetica neue\', helvetica, arial, sans-serif;-webkit-text-size-adjust:100%;-ms-text-size-adjust:100%;padding:0;Margin:0;"><head><meta charset="UTF-8"><meta content="width=device-width, initial-scale=1" name="viewport"><meta name="x-apple-disable-message-reformatting"><meta http-equiv="X-UA-Compatible" content="IE=edge"><meta content="telephone=no" name="format-detection"><title>Copy of SexTime</title> <!--[if (mso 16)]><style type="text/css">a{text-decoration:none}</style><![endif]--> <!--[if gte mso 9]><style>sup{font-size:100% !important}</style><![endif]--> <!--[if !mso]><!-- --><link href="https://fonts.googleapis.com/css?family=Open+Sans:400,400i,700,700i" rel="stylesheet"> <!--<![endif]--><style type="text/css">@media only screen and (max-width:600px){p, ul li, ol li,a{font-size:16px!important;line-height:150%!important}h1{font-size:32px!important;text-align:center;line-height:120%!important}h2{font-size:26px!important;text-align:center;line-height:120%!important}h3{font-size:20px!important;text-align:center;line-height:120%!important}h1 a{font-size:32px!important}h2 a{font-size:26px!important}h3 a{font-size:20px!important}.es-menu td a{font-size:16px!important}.es-header-body p, .es-header-body ul li, .es-header-body ol li, .es-header-body a{font-size:16px!important}.es-footer-body p, .es-footer-body ul li, .es-footer-body ol li, .es-footer-body a{font-size:16px!important}.es-infoblock p, .es-infoblock ul li, .es-infoblock ol li, .es-infoblock a{font-size:12px!important}*[class="gmail-fix"]{display:none!important}.es-m-txt-c, .es-m-txt-c h1, .es-m-txt-c h2, .es-m-txt-c h3{text-align:center!important}.es-m-txt-r, .es-m-txt-r h1, .es-m-txt-r h2, .es-m-txt-r h3{text-align:right!important}.es-m-txt-l, .es-m-txt-l h1, .es-m-txt-l h2, .es-m-txt-l h3{text-align:left!important}.es-m-txt-r img, .es-m-txt-c img, .es-m-txt-l img{display:inline!important}.es-button-border{display:inline-block!important}a.es-button{font-size:16px!important;display:inline-block!important}.es-btn-fw{border-width:10px 0px!important;text-align:center!important}.es-adaptive table,.es-btn-fw,.es-btn-fw-brdr,.es-left,.es-right{width:100%!important}.es-content table, .es-header table, .es-footer table,.es-content,.es-footer,.es-header{width:100%!important;max-width:600px!important}.es-adapt-td{display:block!important;width:100%!important}.adapt-img{width:100%!important;height:auto!important}.es-m-p0{padding:0px!important}.es-m-p0r{padding-right:0px!important}.es-m-p0l{padding-left:0px!important}.es-m-p0t{padding-top:0px!important}.es-m-p0b{padding-bottom:0!important}.es-m-p20b{padding-bottom:20px!important}.es-mobile-hidden,.es-hidden{display:none!important}.es-desk-hidden{display:table-row!important;width:auto!important;overflow:visible!important;float:none!important;max-height:inherit!important;line-height:inherit!important}.es-desk-menu-hidden{display:table-cell!important}table.es-table-not-adapt, .esd-block-html table{width:auto!important}table.es-social{display:inline-block!important}table.es-social td{display:inline-block!important}}#outlook a{padding:0}.ExternalClass{width:100%}.ExternalClass, .ExternalClass p, .ExternalClass span, .ExternalClass font, .ExternalClass td, .ExternalClass div{line-height:100%}.es-button{mso-style-priority:100!important;text-decoration:none!important}a[x-apple-data-detectors]{color:inherit!important;text-decoration:none!important;font-size:inherit!important;font-family:inherit!important;font-weight:inherit!important;line-height:inherit!important}.es-desk-hidden{display:none;float:left;overflow:hidden;width:0;max-height:0;line-height:0;mso-hide:all}</style></head><body style="width:100%;font-family:\'open sans\', \'helvetica neue\', helvetica, arial, sans-serif;-webkit-text-size-adjust:100%;-ms-text-size-adjust:100%;padding:0;Margin:0;"><div class="es-wrapper-color" style="background-color:#EEEEEE;"> <!--[if gte mso 9]> <v:background xmlns:v="urn:schemas-microsoft-com:vml" fill="t"> <v:fill type="tile" color="#eeeeee"></v:fill> </v:background> <![endif]--><div style="width: 600px;margin: auto;background: #e2dfdf;"><a target="_blank" href="'.URL::to('/').'" style="-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-family:\'open sans\', \'helvetica neue\', helvetica, arial, sans-serif;font-size:14px;text-decoration:none;color:#333333;"> <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAXAAAACaCAMAAACHb+NdAAAAAXNSR0IB2cksfwAAAlVQTFRFAAAA4G8a////+OBr9dRl+eVt8sJe8bxc99pp++5w+/Fyglgz9s5j+upv7qlU64pI885j5ItG8LdZ/PRz8LJY9cdh7K5W8shh9tpo7JBL8a5X759R320Y4G8Z6YRF6X5E6HZA2IEz5WY6324Z6JpN76VT52w8324Z7ZZO55VK7ptP3mwZ5V021WQa53E+3W4b6aBP324a6qVR2GkW41My3GkW/v7+324a324Z32sZ324Z324a5pFJ3msY324Z324a3WoZ////324c320Z324Z////324Z320a+OrN3zwo324a4UYs324Z////6XtC/v7+32wZ/f39324a324Z////3nEi78ia////////3m4b324Z324a328a4HEd////4kwv////6bJU4G8Z////////5X4+////////////7LFW3kAn7rVX////8MNd9NRl7rxa////4G4b88ph8sVf////////+u/J////////545I7atU/f393Swi5o5E////8shg////////+eVs5IVE////8LhZ54lG88dg5odF6JlM////5otF9dZm324Z////7KNR6qBP////+OFr5oFD3mwg////8sRe8Lxb9Mxi6qNQ4U0v7q5W5Hw95GA49M9j9ddm5WQ59dNl8sRf6p1O77lZ8sVf3jYl7MBc6JhM6p1O5G857rdZ+OJr+ehu4lMx3jUl7rda66VS+ONr5oxH54xH7a1U55BI////6JZL9NBk8b1c9tlo5ohF+epu5GM04low8MNe5GM28b5c3jkn3TYg3z0o5nM/gfwFjgAAAMd0Uk5TAP////////////8C/////////////////////2D9////Bv9Z////9f///z7/C/8i/4H/Ef8YIO18R2ql/zfgrirgZIrU+Z+YCP7m/8A//ydSMNq68R0O2eZMzHbGMLj/fReRUHRz60hcNl1IhTx4JxVxV/loGhHBls14Qv1EjnPM0Xn2xmbctnpWs2FltKzDhTfL6DKfjvXiMfX2o/n4heXmn5DH2PQf+t6N553ceHaa6ve9q7G1m6G/0PWUs8+9TLGqz73l1EDqygUAABRuSURBVHic7Z2HXxNJ/8cXUiF0gdAChBYlxIh0kd4V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" alt="Beretun logo" style="display:block;border:0;outline:none;text-decoration:none;-ms-interpolation-mode:bicubic;margin:auto;" title="Beretun logo" > </a></div><table class="es-content" cellspacing="0" cellpadding="0" align="center" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;table-layout:fixed !important;width:100%;"><tr style="border-collapse:collapse;"><td align="center" style="padding:0;Margin:0;"><table class="es-content-body" width="600" cellspacing="0" cellpadding="0" bgcolor="#ffffff" align="center" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;background-color:#FFFFFF;"><tr style="border-collapse:collapse;"><td style="Margin:0;padding-bottom:35px;padding-left:35px;padding-right:35px;padding-top:40px;background-color:#F7F7F7;" bgcolor="#f7f7f7" align="left"><table width="100%" cellspacing="0" cellpadding="0" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;"><tr style="border-collapse:collapse;"><td width="530" valign="top" align="center" style="padding:0;Margin:0;"><table width="100%" cellspacing="0" cellpadding="0" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;"><tr style="border-collapse:collapse;"><td align="center" style="padding:0;Margin:0;padding-bottom:15px;"><h2 style="Margin:0;line-height:36px;mso-line-height-rule:exactly;font-family:\'open sans\', \'helvetica neue\', helvetica, arial, sans-serif;font-size:30px;font-style:normal;font-weight:bold;color:#333333;">Tu Orden Fué Confirmada!</h2></td></tr><tr style="border-collapse:collapse;"><td class="es-m-txt-l" align="left" style="padding:0;Margin:0;padding-top:20px;"><h3 style="Margin:0;line-height:22px;mso-line-height-rule:exactly;font-family:\'open sans\', \'helvetica neue\', helvetica, arial, sans-serif;font-size:18px;font-style:normal;font-weight:bold;color:#333333;">Hola '. Auth::user()->name .',</h3></td></tr><tr style="border-collapse:collapse;"><td align="left" style="padding:0;Margin:0;padding-bottom:10px;padding-top:15px;"><p style="Margin:0;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-size:16px;font-family:\'open sans\', \'helvetica neue\', helvetica, arial, sans-serif;line-height:24px;color:#777777;">Recibimos tu orden de compra '.$msg.'.&nbsp;</p><p style="Margin:0;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-size:16px;font-family:\'open sans\', \'helvetica neue\', helvetica, arial, sans-serif;line-height:24px;color:#777777;">Muchas gracias por tu compra!</p></td></tr><tr style="border-collapse:collapse;"><td align="center" style="Margin:0;padding-left:10px;padding-right:10px;padding-bottom:20px;padding-top:25px;"> <span class="es-button-border" style="border-style:solid;border-color:transparent;background:#D16512;border-width:0px;display:inline-block;border-radius:5px;width:auto;"> <a href="'. URL::to('/') . '/order/' . $order->id .'" class="es-button" target="_blank" style="mso-style-priority:100 !important;text-decoration:none !important;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-family:\'open sans\', \'helvetica neue\', helvetica, arial, sans-serif;font-size:18px;color:#060606;border-style:solid;border-color:#D16512;border-width:15px 30px;display:inline-block;background:#D16512;border-radius:5px;font-weight:normal;font-style:normal;line-height:22px;width:auto;text-align:center;">Ver Detalle</a> </span></td></tr></table></td></tr></table></td></tr></table></td></tr></table></div></body></html>';

        mail($to, $subject, $message, $headers);



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
