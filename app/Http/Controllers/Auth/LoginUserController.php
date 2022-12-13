<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\User;

class LoginUserController extends Controller
{
    /**
     * Handle an authentication attempt.
     *
     * @param  \Illuminate\Http\Request $request
     *
     * @return Response
     */
    public function authentication(Request $request)
    {
        $data =  request()->validate(
            [
                'email'      => 'required',
                'password'  => 'required'
            ],
            [
                'email.required' => 'Ingrese Usuario',
                'password.required' => 'Ingrese Contraseña',
            ]
        );



        $query = User::where('email', '=', $request->email)->get();

        if ($query->count() > 0) {
            $passDB = $query[0]->password;

            if (password_verify($request->password, $passDB)) {
                if ($query[0]->estado == 'ACTI') {
                    if (Auth::attempt(['email' => $request->email, 'password' => $request->password])) {
                        // Authentication passed...
                        return redirect()->intended('home');
 
                    }

                } else
                    return view('cuenta_inactiva');
            } else {
                return back()->withErrors(['password' => 'Contraseña no valida'])->withInput(['email' => $request->email]);
            }
        } else {
            return back()->withErrors(['email' => 'Usuario no valido'])->withInput(['email' => $request->email]);
        }
 

     }
}
