<?php

use App\Vote;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

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

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get('/vote_counts', function ($id) {
    $votes = Vote::all();
    return response()->json($votes);
});

Route::get('/vote_counts/{id}', function ($id) {
    $votes = Vote::where('case_no', $id)->get();
    return response()->json($votes);
});

Route::post('/vote_counts', function (Request $request) {
    $data = $request->all();
    foreach ($data as $datum) {
        $vote = Vote::where('party_id', $datum['party_id'])
            ->where('case_no', $datum['case_no'])
            ->first();
        if (!$vote) {
            $vote = new Vote();
        }
        $vote->vote_count = $datum['vote_count'];
        $vote->case_no = $datum['case_no'];
        $vote->party_id = $datum['party_id'];
        $vote->save();
    }
    return response()->json([
        'message' => 'Oylar Güncellendi',
        'status' => 'success'
    ]);
});
