<?php

namespace App\Models\Admin;

use Illuminate\Database\Eloquent\Model;

class DownLoad extends Model
{

    protected $table = 'admin_app';
    protected $fillable = ['ios','android','cover_img','pid'];
    protected $primaryKey='pid';
}
