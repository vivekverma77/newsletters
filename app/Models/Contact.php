<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Contact extends Model
{
    use HasFactory;

    protected $table = 'contacts';

    protected $fillable = [
        'first_name',
        'last_name',
        'tel',
        'address',
        'street_num',
        'city',
        'postcode',
        'province',
        'country',
        'source',
    ];

    public function Contact_emails()
    {
        return $this->hasMany('App\Contact_email');
    }
}
