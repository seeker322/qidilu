<?php

namespace App\Models\Admin;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;

class Role extends Model
{

    protected $table = 'admin_roles';
    protected $fillable = ['name','description'];
    public function permissions()
    {
        return $this->belongsToMany('App\Models\Admin\Permission', 'admin_role_permissions', 'role_id', 'permission_id');
    }
}
