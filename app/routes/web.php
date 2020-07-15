<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', 'Controller@index');
Route::get('kit', 'Controller@kits');
Route::get('articles', 'Controller@articles');
Route::get('brand/{slug}', 'Controller@brand');
Route::get('detail/{id}', 'Controller@detail');
Route::get('faq', 'Controller@faq');
Route::get('category/{slug}', 'Controller@category');

Route::post('resultados', 'Controller@search');


Route::post('suscribe', 'Controller@suscribe');

Route::get('contra-entrega', 'Payment@contraEntrega');
#Route::get('payment', 'Payments@newpayment');


Auth::routes();

Route::get('home', 'HomeController@index')->name('home');

Route::group([      
    'prefix' => 'password'
], function () {    
    Route::post('create', '\App\Http\Controllers\Auth\PasswordResetController@create')->name('password.create');
    Route::get('find/{token}', '\App\Http\Controllers\Auth\PasswordResetController@find')->name('password.find');
    Route::post('reset', '\App\Http\Controllers\Auth\PasswordResetController@reset')->name('password.update');;
    Route::get('/', '\App\Http\Controllers\Auth\PasswordResetController@index');
    Route::put('update', '\App\Http\Controllers\Auth\PasswordResetController@create');
});


Route::group(['prefix' => 'auth'], function () {
    Route::post('signup', 'AuthController@signup');
    Route::get('signup/activate/{token}', 'AuthController@signupActivate');
});

Route::resource('profile', 'ProfileController');

Route::get('cart', 'CartController@index');
Route::get('cart/total', 'CartController@total');
Route::get('cart/delete/{id}', 'CartController@delete');
Route::get('cart/update/{id}/{cantidad}', 'CartController@updateQuantity');
Route::get('addtocart/{id}', 'CartController@add');

Route::get('categoria/{slug}', 'CategoryController@index2');


Route::get('order/{id}', 'OrderController@index2');

Route::get('reorder/{id}', 'OrderController@reOrder');
Route::get('cancelar/{id}', 'OrderController@cancelar');
Route::get('ingresar/{id}', 'OrderController@ingresar');
Route::post('success', 'OrderController@addOrder');
Route::get('success', 'OrderController@update');

Route::resource('contact', 'ContactController');
Route::get('noticias', 'NewsController@index');
Route::get('noticia/{slug}', 'NewsController@show');

Route::get('quienes-somos', 'Controller@aboutUs');
Route::get('politica-calidad', 'Controller@politics');

Route::get('ingresar', function(){
    return Redirect::to('/login');
});