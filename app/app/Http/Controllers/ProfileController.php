<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use View;
use Validator;
use Illuminate\Support\Facades\Hash;

class ProfileController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $cart = \Cart::count();
        #return view('users.profile')->with(compact( 'cart'));

        $user = User::find(auth()->user()->id);
        return View::make('users.profile', compact('user','cart'))->with('status', 'Actualización exitosa!');
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
        $validator = Validator::make($request->all(), [ 
            'name' => ['required', 'string', 'min:8', 'max:255'],
            'email' => ['required', 'string', 'email', 'max:255'],
            'password' => ['confirmed'],
            'phone' => ['required', 'integer', 'min:8'],
            'city' => ['required', 'string', 'min:4'],
            'address' => ['required', 'string', 'min:8'],
        ]);
        
        if ($validator->fails()) { 
            return $this->index()->with('errors', $validator->errors());      
        }

        User::where('id', $id)
          ->update([
            'name' => $request->get('name'),
            'email' => $request->get('email'),
            'phone' => $request->get('phone'),
            'city' => $request->get('city'),
            'address' => $request->get('address'),
            #'password' => Hash::make($data['password']),
        ]);

        if($request->get('password')){
            $validator = Validator::make($request->all(), [ 
                'password' => ['min:8'],
            ]);
            
            if ($validator->fails()) { 
                return $this->index()->with('errors', $validator->errors());      
            }

            User::where('id', $id)
            ->update([
                'password' => Hash::make($request->get('password')),
            ]);
        }
        $request->session()->flash('success', 'Actualización exitosa!');
        return $this->index();
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
