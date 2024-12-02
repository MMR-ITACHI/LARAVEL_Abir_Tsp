<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Unit extends Model
{
    use HasFactory;
protected $fillable = [
    'name','status'
];

public function cost(){
    return $this->hasMany(Cost::class);
}
}