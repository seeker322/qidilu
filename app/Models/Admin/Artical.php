<?php

namespace App\Models\Admin;

use Illuminate\Database\Eloquent\Model;

class Artical extends Model
{

    protected $table = 'admin_artical';
    protected $fillable = ['title','description','content','author','origin','sort','cover_img','pid'];
}
