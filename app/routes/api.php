<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});
Route::get('/test', function () {
    return response('Test API', 200)
          ->header('Content-Type', 'application/json');
});
Route::get('success', function () {
  	$order = App\Order::where('reference', $_REQUEST["referenceCode"])->firstOrFail();
  	$order->payu_order_id = $_REQUEST["reference_pol"];
  	$order->transaction_id = $_REQUEST["transactionId"];
  	$order->state = $_REQUEST["lapTransactionState"];
  	$order->save();
	$cart = Cart::count();


	sendMail($order);


    return view('success', [ 'cart'=>$cart, 'order'=>$order]);
});
Route::get('/cart', function () {
  //  var_dump(Cart::content());die();
	$cart = 0;
	$populares = App\Product::where(['active'  => '1'])->get();
    $categories = App\Brandscategory::where('show_on_front', 1)->get();
    $brands = App\Brand::all();
    return view('cart', ['populares' => $populares, 'categories' => $categories, 'cart'=>$cart, 'brands' =>$brands]);
});
