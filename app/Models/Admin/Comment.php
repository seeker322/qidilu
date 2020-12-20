<?php

namespace App\Models\Admin;

use Illuminate\Database\Eloquent\Model;

class Comment extends Model
{

    protected $table = 'admin_comment';
    protected $fillable = ['name','phone','content','wechat'];
}
