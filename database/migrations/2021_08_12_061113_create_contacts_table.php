<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateContactsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('contacts', function (Blueprint $table) {
            $table->increments('id');
            $table->string('first_name',100);
            $table->string('last_name',100);
            $table->string('tel',20);
            $table->string('address',100)->nullable();
            $table->string('street_num',100)->nullable();
            $table->string('city',50)->nullable();
            $table->integer('postcode')->nullable();
            $table->string('province',100)->nullable();
            $table->string('country',50)->nullable();
            $table->string('source',100)->nullable();
            $table->dateTime('deleted_at', $precision = 0)->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('contact');
    }
}
