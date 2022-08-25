<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Contact_email extends Model
{
    use HasFactory;

    protected $table = 'Contact_emails';

    protected $fillable = [
        'contact_id',
        'email'
    ];
    
    public function Contacts()
    {
        return $this->hasMany('App\Contact');
    }
}
