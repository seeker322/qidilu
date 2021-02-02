<?php

namespace App\Models\Admin;

use Illuminate\Database\Eloquent\Model;

class WebInfo extends Model
{

    protected $table = 'admin_web_info';
    protected $fillable = ['video','cover_img','search_key','title','description'];
}
