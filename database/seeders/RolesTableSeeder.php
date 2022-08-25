<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use DB;
class RolesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        \DB::table('roles')->insert([
            'role_id' => 1,
            'role_name' => 'Company administrator',
            'role_slug' => 'company_admin',
            'created_at' => now(),
        ]);

        \DB::table('roles')->insert([
            'role_id' => 2,
            'role_name' => 'Contacts manager',
            'role_slug' => 'contacts_manager',
            'created_at' => now(),
        ]);

        \DB::table('roles')->insert([
            'role_id' => 3,
            'role_name' => 'Content manager',
            'role_slug' => 'content_manager',
            'created_at' => now(),
        ]);
    }
}
