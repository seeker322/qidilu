<?php

namespace App\Models\Admin;

use Illuminate\Database\Eloquent\Model;

class Permission extends Model
{
    protected $table = 'admin_permissions';
    protected $fillable = ['name','display_name','description','controller'];
    public function roles()
    {
        return $this->belongsToMany('App\Models\Admin\Role', 'admin_role_permissions', 'permission_id', 'role_id');
    }
}
