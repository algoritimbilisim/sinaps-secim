<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class Vote extends Model
{
    public function party()
    {
        return $this->belongsTo(Party::class);
    }
}
