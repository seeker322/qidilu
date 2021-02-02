<?php

namespace App\Models\Admin;

use Illuminate\Database\Eloquent\Model;

class Partner extends Model
{

    protected $table = 'admin_partners';
    protected $fillable = ['title','sort','cover_img','url'];
}
