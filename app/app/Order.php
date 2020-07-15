<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Order extends Model
{

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'reference', 'state', 'value', 'user_id', 'payu_order_id', 'transaction_id', 'date'
    ];
}
