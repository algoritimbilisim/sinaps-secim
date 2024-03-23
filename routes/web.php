<?php

use App\Http\Controllers\Home;
use App\Http\Controllers\MailController;
use App\Party;
use App\VoteCase;
use Illuminate\Support\Facades\Route;

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

Route::get('/', [Home::class, 'browse'])->name('home');


Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();

    Route::get('/oy-kayit', function () {
        $voteCases = VoteCase::all();
        $parties = Party::all();

        return view("pages.admin.vote-count")
            ->with("voteCases", $voteCases)
            ->with("parties", $parties);
    })->name('oy-kayit');
});
