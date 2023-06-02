<?php

namespace App\Http\Controllers;

use App\News;
use Illuminate\Http\Request;

class Home extends Controller
{
    public function browse()
    {
        $slides = News::all();
        return view("home")->with("slides", $slides);
    }
}
