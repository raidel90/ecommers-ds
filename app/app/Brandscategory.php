<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use App\Brand;

class Brandscategory extends Model
{
	public function brands()
    {
        return $this->hasMany(Brand::class);
    }
    
}
