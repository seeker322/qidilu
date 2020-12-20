<?php

namespace App\Models\Admin;

use Illuminate\Database\Eloquent\Model;

class Single extends Model
{

    protected $table = 'admin_single';
    protected $fillable = ['title','description','content','cover_img','pid'];
    protected $primaryKey='pid';
}
