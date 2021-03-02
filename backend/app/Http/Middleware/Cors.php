<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class Cors
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next)
    {
      return $next($request)
      ->header('Access-Control-Allow-Origin', '*') //REPLACE STAR WITH YOUR URL
      ->header('Access-Control-Allow-Methods', 'GET, POST, PUT, PATCH, DELETE, OPTIONS')
      ->header('Access-Control-Allow-Headers', 'content-type, authorization, x-requested-with, x-csrf-token');
    }
}
