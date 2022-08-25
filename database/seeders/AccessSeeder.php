<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class AccessSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //Role 1 access
        \DB::table('access')->insert([
            'access_id' => 1,
            'role_id' => 1,
            'module_id' => 1,
            'access_view' => 1,
            'access_insert' => 1,
            'access_update' => 1,
            'access_delete' => 1,
            'created_at' => now(),
        ]);
        \DB::table('access')->insert([
            'access_id' => 2,
            'role_id' => 1,
            'module_id' => 2,
            'access_view' => 1,
            'access_insert' => 1,
            'access_update' => 1,
            'access_delete' => 1,
            'created_at' => now(),
        ]);
        \DB::table('access')->insert([
            'access_id' => 3,
            'role_id' => 1,
            'module_id' => 3,
            'access_view' => 1,
            'access_insert' => 1,
            'access_update' => 1,
            'access_delete' => 1,
            'created_at' => now(),
        ]);
        \DB::table('access')->insert([
            'access_id' => 4,
            'role_id' => 1,
            'module_id' => 4,
            'access_view' => 1,
            'access_insert' => 1,
            'access_update' => 1,
            'access_delete' => 1,
            'created_at' => now(),
        ]);
        \DB::table('access')->insert([
            'access_id' => 5,
            'role_id' => 1,
            'module_id' => 5,
            'access_view' => 1,
            'access_insert' => 1,
            'access_update' => 1,
            'access_delete' => 1,
            'created_at' => now(),
        ]);
        \DB::table('access')->insert([
            'access_id' => 6,
            'role_id' => 1,
            'module_id' => 6,
            'access_view' => 1,
            'access_insert' => 1,
            'access_update' => 1,
            'access_delete' => 1,
            'created_at' => now(),
        ]);
        //Role 2 access
        \DB::table('access')->insert([
            'access_id' => 7,
            'role_id' => 2,
            'module_id' => 1,
            'access_view' => 1,
            'access_insert' => 1,
            'access_update' => 1,
            'access_delete' => 1,
            'created_at' => now(),
        ]);
        \DB::table('access')->insert([
            'access_id' => 8,
            'role_id' => 2,
            'module_id' => 2,
            'access_view' => 1,
            'access_insert' => 1,
            'access_update' => 1,
            'access_delete' => 1,
            'created_at' => now(),
        ]);
        \DB::table('access')->insert([
            'access_id' => 9,
            'role_id' => 2,
            'module_id' => 3,
            'access_view' => 1,
            'access_insert' => 1,
            'access_update' => 1,
            'access_delete' => 1,
            'created_at' => now(),
        ]);
        \DB::table('access')->insert([
            'access_id' => 10,
            'role_id' => 2,
            'module_id' => 4,
            'access_view' => 1,
            'access_insert' => 1,
            'access_update' => 1,
            'access_delete' => 1,
            'created_at' => now(),
        ]);
        \DB::table('access')->insert([
            'access_id' => 11,
            'role_id' => 2,
            'module_id' => 5,
            'access_view' => 1,
            'access_insert' => 1,
            'access_update' => 1,
            'access_delete' => 1,
            'created_at' => now(),
        ]);
        \DB::table('access')->insert([
            'access_id' => 12,
            'role_id' => 2,
            'module_id' => 6,
            'access_view' => 1,
            'access_insert' => 1,
            'access_update' => 1,
            'access_delete' => 1,
            'created_at' => now(),
        ]);
        //Role 3 access
        \DB::table('access')->insert([
            'access_id' => 13,
            'role_id' => 3,
            'module_id' => 1,
            'access_view' => 1,
            'access_insert' => 1,
            'access_update' => 1,
            'access_delete' => 1,
            'created_at' => now(),
        ]);
        \DB::table('access')->insert([
            'access_id' => 14,
            'role_id' => 3,
            'module_id' => 2,
            'access_view' => 1,
            'access_insert' => 1,
            'access_update' => 1,
            'access_delete' => 1,
            'created_at' => now(),
        ]);
        \DB::table('access')->insert([
            'access_id' => 15,
            'role_id' => 3,
            'module_id' => 3,
            'access_view' => 1,
            'access_insert' => 1,
            'access_update' => 1,
            'access_delete' => 1,
            'created_at' => now(),
        ]);
        \DB::table('access')->insert([
            'access_id' => 16,
            'role_id' => 3,
            'module_id' => 4,
            'access_view' => 1,
            'access_insert' => 1,
            'access_update' => 1,
            'access_delete' => 1,
            'created_at' => now(),
        ]);
        \DB::table('access')->insert([
            'access_id' => 17,
            'role_id' => 3,
            'module_id' => 5,
            'access_view' => 1,
            'access_insert' => 1,
            'access_update' => 1,
            'access_delete' => 1,
            'created_at' => now(),
        ]);
        \DB::table('access')->insert([
            'access_id' => 18,
            'role_id' => 3,
            'module_id' => 6,
            'access_view' => 1,
            'access_insert' => 1,
            'access_update' => 1,
            'access_delete' => 1,
            'created_at' => now(),
        ]);

    }
}
