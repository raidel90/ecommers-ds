<?php
namespace App\Http\Controllers\Auth;
use App\User;
use Carbon\Carbon;
use App\PasswordReset;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Notifications\PasswordResetRequest;
use App\Notifications\PasswordResetSuccess;

class PasswordResetController extends Controller
{

    public function index(){
        return view('auth.passwords.email');
    }
    /**
     * Create token password reset
     *
     * @param  [string] email
     * @return [string] message
     */
    public function create(Request $request)
    { 
        $request->validate([
            'email' => 'required|string|email',
        ]);
        $user = User::where('email', $request->email)->first();
        if (!$user)
            return response()->json([
                'message' => 'We can\'t find a user with that e-mail address.'
            ], 404);
        $passwordReset = PasswordReset::updateOrCreate(
            ['email' => $user->email],
            [
                'email' => $user->email,
                'token' => str_random(60)
            ]
        );
        if ($user && $passwordReset)
            $user->notify(
                new PasswordResetRequest($passwordReset->token)
            );

            $request->session()->flash('success', 'Revisa tu bandeja de entrada');
            return $this->index();
    }
    /**
     * Find token password reset
     *
     * @param  [string] $token
     * @return [string] message
     * @return [json] passwordReset object
     */
    public function find($token)
    {
        $passwordReset = PasswordReset::where('token', $token)
            ->first();
        if (!$passwordReset)
            return response()->json([
                'message' => 'This password reset token is invalid.'
            ], 404);
        if (Carbon::parse($passwordReset->updated_at)->addMinutes(720)->isPast()) {
            $passwordReset->delete();
            return response()->json([
                'message' => 'This password reset token is invalid.'
            ], 404);
        }


        
	    return view('auth.passwords.reset')->with(compact( 'passwordReset'));
    }
     /**
     * Reset password
     *
     * @param  [string] email
     * @param  [string] password
     * @param  [string] password_confirmation
     * @param  [string] token
     * @return [string] message
     * @return [json] user object
     */
    public function reset(Request $request)
    {
        $request->validate([
            'email' => 'required|string|email',
            'password' => 'required|string|confirmed',
            'token' => 'required|string'
        ]);
        $passwordReset = PasswordReset::where('token', $request->token)->first();
        if (!$passwordReset)
            return response()->json([
                'message' => 'This password reset token is invalid.'
            ], 404);
        $user = User::where('email', $request->email)->first();
        if (!$user)
            return response()->json([
                'message' => 'We can\'t find a user with that e-mail address.'
            ], 404);
        $user->password = bcrypt($request->password);
        $user->save();
        $passwordReset->delete();
        $user->notify(new PasswordResetSuccess($passwordReset));
        
        $request->session()->flash('success', 'Contraseña actualizada');
        return $this->index();
    }
}