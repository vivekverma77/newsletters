<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use DB;
class UsersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        \DB::table('users')->insert([
            'role_id' => '1',
            'name' => 'Admin',
            'email' => 'admin@gmail.com',
            'password' => bcrypt('pass@admin'),
            'created_at' => now(),
        ]);

        \DB::table('users')->insert([
            'role_id' => '2',
            'name' => 'User',
            'email' => 'user@gmail.com',
            'password' => bcrypt('pass@user'),
            'created_at' => now(),
        ]);
    }
}
