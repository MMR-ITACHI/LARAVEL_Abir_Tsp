<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class Manager extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;
    protected $guard = 'manager';

    /**
     * The attributes that are mass assignable.
     * 
     *
     * @var array<int, string>
     * 
     * 
     */
    
    protected $fillable = [
        'name',
        'email',
        'password',
        'branch_id'
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        
        'password' => 'hashed',
    ];

    public function branch(){
        return $this->hasMany(Branch::class);
       // return $this->belongsTo(Branch::class);
}

}
