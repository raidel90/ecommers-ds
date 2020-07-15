<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Cart;

class CartController extends Controller
{

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(){
        
        $cart = 0;
        $populares = \App\Product::all();
        $categories = \App\Brandscategory::where('show_on_front', 1)->get();  
        $brands = \App\Brand::all();  
        return view('carts.cart', ['populares' => $populares, 'categories' => $categories, 'cart'=>$cart, 'brands' =>$brands]);
    }

    public function total(){

        echo number_format(Cart::subtotal(),2,",",".");
    }

    public function delete($id){

        Cart::remove($id); 
       # echo Cart::subtotal();die();
        #return  (Cart::count() == 0)? 0 : number_format(Cart::subtotal(),2,",",".");
        return  (Cart::count() == 0)? 0 : Cart::subtotal();
    }

    public function updateQuantity($id, $cantidad){

        Cart::update($id, $cantidad); // Will update the quantity
        return  Cart::subtotal();
    }

    public function add($id){
        $p = \App\Product::where('id', $id)->firstOrFail();

        if($p->discount != "" && $p->discount != 0) { 
            $price = ($p->price - (($p->discount * $p->price)/100));
        } else {
            $price = $p->price;
        };

        Cart::add([ 'id' => $p->id . '-' . $p->code, 'weight' => 0, 'name' => $p->name, 'qty' => 1, 'price' => $price, 'options' => ['image' => $p->image, 'description' => $p->description, 'sabores'=>'']]);
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
    public function update(Request $request, $id)
    {
        //
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
