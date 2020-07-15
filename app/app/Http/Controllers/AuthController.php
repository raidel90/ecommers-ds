<?php
namespace App\Http\Controllers;
use App\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Notifications\SignupActivate;
use Validator;
use App\Sale;

class AuthController extends Controller
{
    public function signup(Request $request)
    {
    	$validator = Validator::make($request->all(), [ 
            'name' => 'required', 
            'last_name' => 'required', 
            'documentType' => 'required', 
            'documentNumber' => 'required|integer', 
            'phone' => 'required', 
            'birthDate' => 'required|date', 
            'favoriteName' => 'required', 
            'mobile' => 'required', 
            'gender' => 'required', 
            'departament' => 'required', 
            'city' => 'required', 
            'district' => 'required', 
            'address' => 'required', 
            'reference' => 'required', 
            'otherDeliveryAddress' => 'required', 
            'email' => 'required|email', 
            'password' => 'required', 
            'c_password' => 'required|same:password', 
        ]);
		if ($validator->fails()) { 
            return response()->json(['error'=>$validator->errors()], 401);            
        }
		$input = $request->all(); 
        
        $input['password'] = bcrypt($input['password']); 
        $input['activation_token'] = str_random(60); 
        $user = User::create($input); 
//DESCOMENTAR
        $user->notify(new SignupActivate($user));
        return response()->json([
            'message' => 'Successfully created user!'], 201);
    }
    public function login(Request $request)
    {
        $request->validate([
            'email'       => 'required|string|email',
            'password'    => 'required|string',
            'remember_me' => 'boolean',
        ]);
        $credentials = request(['email', 'password']);
        $credentials['active'] = 1;
    	$credentials['deleted_at'] = null;
        
        if (!Auth::attempt($credentials)) {
            return response()->json([
                'message' => 'Unauthorized'], 401);
        }
        $user = $request->user();
        $tokenResult = $user->createToken('MyApp');
        $token = $tokenResult->token;
        if ($request->remember_me) {
            $token->expires_at = Carbon::now()->addWeeks(1);
        }
        $token->save();
        return response()->json([
            'access_token' => $tokenResult->accessToken,
            'token_type'   => 'Bearer',
            'expires_at'   => Carbon::parse(
                $tokenResult->token->expires_at)
                    ->toDateTimeString(),
        ]);
    }

    public function logout(Request $request)
    {
        $request->user()->token()->revoke();
        return response()->json(['message' => 
            'Successfully logged out']);
    }

    public function user(Request $request)
    {
        $result = User::where('id', $request->user()->id)->with('roles')->get();
        $result[1] = (Sale::where('created_by', $result[0]->id)->sum('amount') <= '120000' )? '/welcome':'/dashboard';   
        return $result;
        //return response()->json($request->user());
    }

    public function signupActivate($token)
	{
	    $user = User::where('activation_token', $token)->first();
	    if (!$user) {
	        return response()->json(['message' => 'El token de activación es inválido'], 404);
	    }
	    $user->active = true;
	    $user->activation_token = '';
        $user->save();
        return \Redirect::to(env('PAULA_LOGIN', null));
	    return $user;
	}
}