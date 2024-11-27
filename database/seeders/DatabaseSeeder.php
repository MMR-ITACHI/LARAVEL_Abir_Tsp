<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // \App\Models\User::factory(10)->create();

        // \App\Models\User::factory()->create([
        //     'name' => 'Test User',
        //     'email' => 'test@example.com',
        // ]);

        \App\Models\Admin::create([
            'name' => 'M.M.R Aabir',
            'email' => 'admin@gmail.com',
            'password' =>Hash::make('admin123')
        ]);

        \App\Models\Manager::create([
            'name' => 'M.M.R Shisui',
            'email' => 'manager@gmail.com',
            'password' =>Hash::make('admin123'),
            'number' =>'01971324922',
            'branch_id' => '1',
            

        ]);


        \App\Models\Branch::create([
            'branch_name' => 'Savar Courier Point',
            'branch_email' => 'savar@gmail.com',
            'number' =>'01971324923',
            'address' =>'Savar',
            
            

        ]);

        
    }
}
