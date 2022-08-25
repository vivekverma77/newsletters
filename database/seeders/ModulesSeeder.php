<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class ModulesSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        \DB::table('modules')->insert([
            'module_name' => 'users',
            'module_description' => 'User Access',
            'module_link' => 'users',
            'module_order' => 1
        ]);
        \DB::table('modules')->insert([
            'module_name' => 'contacts',
            'module_description' => 'Contacts Access',
            'module_link' => 'contacts',
            'module_order' => 2
        ]);
        \DB::table('modules')->insert([
            'module_name' => 'terms',
            'module_description' => 'Terms Access',
            'module_link' => 'terms',
            'module_order' => 3
        ]);
         \DB::table('modules')->insert([
            'module_name' => 'attributes',
            'module_description' => 'Attributes Access',
            'module_link' => 'attributes',
            'module_order' => 4
        ]);
        \DB::table('modules')->insert([
            'module_name' => 'Mailings',
            'module_description' => 'Mailings Access',
            'module_link' => 'mailings',
            'module_order' => 5
        ]);
        \DB::table('modules')->insert([
            'module_name' => 'Newsletters',
            'module_description' => 'Newsletters Access',
            'module_link' => 'newsletters',
            'module_order' => 6
        ]);
        \DB::table('modules')->insert([
            'module_name' => 'Newsletters',
            'module_description' => 'Newsletters Access',
            'module_link' => 'newsletters',
            'module_order' => 6
        ]);
    }
}
