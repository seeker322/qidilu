<?php

namespace App\Models\Admin;

use Illuminate\Database\Eloquent\Model;

class Video extends Model
{

    protected $table = 'admin_video';
    protected $fillable = ['title','description','content','url','sort','cover_img','pid'];
}
