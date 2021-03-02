<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\CustomerController;

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

Route::group(['namespace' => 'Api'], function () {
    Route::prefix('customer')->group(function () {
        Route::get('/get', [CustomerController::class, 'get'])->name('api.customer.get');
        Route::post('/save', [CustomerController::class, 'save'])->name('api.customer.save');
        Route::post('/delete', [CustomerController::class, 'delete'])->name('api.customer.delete');
    });
});
