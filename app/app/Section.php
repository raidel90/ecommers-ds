<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class Section extends Model
{

	public function Products()
	{
	    return $this->belongsToMany("App\Product");
	}
    
}
