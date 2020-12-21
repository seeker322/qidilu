<?php

namespace App\Models\Admin;

use Illuminate\Database\Eloquent\Model;

class Banner extends Model
{

    protected $table = 'admin_banner';
    protected $fillable = ['title','img','sort','url'];
}
