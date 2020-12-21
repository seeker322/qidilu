<?php

namespace App\Models\Admin;

use Illuminate\Database\Eloquent\Model;

class Permission extends Model
{
    protected $table = 'admin_permissions';
    protected $fillable = ['name','banner','is_menu','description','pid','url','icon','action','sort'];
    public function roles()
    {
        return $this->belongsToMany('App\Models\Admin\Role', 'admin_role_permissions', 'permission_id', 'role_id');
    }
}
