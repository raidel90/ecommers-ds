<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use App\Suscription;
use App\Brandscategory;
use App\Slider;
use App\User;
use App\Brand;
use App\Product;
use App\Kit;
use App\Article;
use Cart;
use DB;

class Controller extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;

    public function suscribe(\Illuminate\Http\Request $request){
        $email = $request->get('email');
        if(!filter_var( $email, FILTER_VALIDATE_EMAIL )) return 'invalid';
        if( Suscription::where('email', $email)->count() > 0) return 'mismatch';    
        if(!Suscription::create(['email' => $email]))
            return "false";
        else
            return view('helpers.modaltrue', ['message' => 'Has sido suscripto correctamente, muchas gracias!.']);
    }

    public function index(){
        $categories = Brandscategory::where('show_on_front', 1)->orderBy('order', 'asc')->get();  
		$sliders = Slider::orderBy('order')->get();  
		$dealers = User::where('role_id', 3)->get();  
		$brands = Brand::orderBy('order')->get();  
		$cart = Cart::count();
		$products = Product::where(['shop_link'  => '1'], ['active'  => '1'])->orderBy('order')->get(); 
	
	    return view('welcome')->with(compact( 'categories', 'sliders', 'dealers', 'brands', 'products', 'cart'));
    }

    public function kits(){
        $categories = Brandscategory::where('show_on_front', 1)->orderBy('order')->get();  
		$sliders = Slider::orderBy('order')->get();  
		$dealers = User::where('role_id', 3)->get();  
		$brands = Brand::orderBy('order')->get();  
		$cart = Cart::count();
		$products = Kit::where(['shop_link'  => '1'], ['active'  => '1'])->orderBy('order')->get(); 

	    return view('kits.index')->with(compact( 'categories', 'sliders', 'dealers', 'brands', 'products', 'cart'));
    }

    public function articles(){
        $categories = Brandscategory::where('show_on_front', 1)->orderBy('order')->get();  
		$sliders = Slider::orderBy('order')->get();  
		$dealers = User::where('role_id', 3)->get();  
		$brands = Brand::orderBy('order')->get();  
		$cart = Cart::count();
		$products = Article::where(['shop_link'  => '1'], ['active'  => '1'])->orderBy('order')->get(); 

	    return view('articles.index')->with(compact( 'categories', 'sliders', 'dealers', 'brands', 'products', 'cart'));
    }

    public function search(){
        #$products = Product::orWhere('name', 'like', '%' . $_REQUEST["search"] . '%')->orWhere('description', 'like', '%' . $_REQUEST["search"] . '%')->orderBy('order')->get();
        $products = DB::select('select p.* from products p LEFT JOIN brands b on b.id = p.brand_id LEFT JOIN brandscategories bc ON bc.id = p.brandscategories_id WHERE p.name like \'%'.$_REQUEST["search"].'%\' or p.description like \'%'.$_REQUEST["search"].'%\' or p.beneficios like \'%'.$_REQUEST["search"].'%\' or p.uso_sugerido like \'%'.$_REQUEST["search"].'%\' or p.advertencia like \'%'.$_REQUEST["search"].'%\' or b.name like \'%'.$_REQUEST["search"].'%\'or bc.name like \'%'.$_REQUEST["search"].'%\'or bc.description like \'%'.$_REQUEST["search"].'%\'');
        $cart = Cart::count();
        $search= $_REQUEST["search"];
        return view('search.index')->with(compact( 'search',  'products', 'cart'));
    }

    public function brand($slug){
        $category = Brand::where('slug', $slug)->firstOrFail();  
        return view('brands.index')->with(compact( 'category'));
    }

    public function category($slug){
        $category = Brandscategory::where('slug', $slug)->firstOrFail();
        return view('categories.index')->with(compact( 'category'));
    }

    public function faq(){

        return view('faqs.index');
    }

    public function detail($id){
        $cart = Cart::count();
        $brands = Brand::orderBy('order')->get();
        $destacados = Product::orderBy('order')->limit(4)->get();
        $categories = Brandscategory::where('show_on_front', 1)->orderBy('order')->get();

        $producto = Product::where(['id'  => $id])->firstOrFail();
        $brand = Brand::where('id', $producto->brand_id)->firstOrFail();


        return view('products.detail', ['id'=>$id, 'brands' => $brands, 'brand' => $brand, 'destacados' => $destacados, 'producto' => $producto, 'categories' => $categories, 'cart'=>$cart]);
    }

    public function aboutUs(){
        
        return view('us.aboutUs');
    }

    public function politics(){
        
        return view('us.politics');
    }
    
}
