<?php

namespace App\Models\Admin;

use Illuminate\Database\Eloquent\Model;

class Certificate extends Model
{

    protected $table = 'admin_certificates';
    protected $fillable = ['title','sort','cover_img','url'];
}
