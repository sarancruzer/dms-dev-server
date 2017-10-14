z<?php

use Illuminate\Database\Seeder;
use Illuminate\Database\Eloquent\Model;
use App\User;

class DatabaseSeeder extends Seeder
{
    public function run()
    {
        Model::unguard();

        DB::table('users')->delete();

        $users = array(
                ['first_name' => 'Saravanan','last_name' => 'Nandhan', 'email' => 'sarancruzer@dms.dev', 'password' => Hash::make('123456'),'mobile'=>'9597009544','user_type'=>'admin'],
                ['first_name' => 'Admin','last_name' => 'Admin', 'email' => 'admin@dms.dev', 'password' => Hash::make('123456'),'mobile'=>'9895949134','user_type'=>'admin'],
                ['first_name' => 'Ryan','last_name' => 'Chenkie', 'email' => 'ryan@dms.dev', 'password' => Hash::make('123456'),'mobile'=>'','user_type'=>'admin'],
                ['first_name' => 'Chris', 'last_name' => 'Sevilleja','email' => 'chris@scotch.io', 'password' => Hash::make('123456'),'mobile'=>'','user_type'=>'admin'],
                ['first_name' => 'Holly','last_name' => 'Lloyd', 'email' => 'holly@scotch.io', 'password' => Hash::make('123456'),'mobile'=>'','user_type'=>'admin'],
                ['first_name' => 'Adnan','last_name' => 'Kukic', 'email' => 'adnan@scotch.io', 'password' => Hash::make('123456'),'mobile'=>'','user_type'=>'admin'],
        );
            
        // Loop through each user above and create the record for them in the database
        foreach ($users as $user)
        {
            User::create($user);
        }

        Model::reguard();
    }
}