-- This file is part of Entrust,
-- a role & permission management solution for Laravel.
-- @license MIT
-- @package Zizaco\Entrust
return {
    role = '.app.model.role',
    roles_table = 'roles',
    permission = '.app.model.permission',
    permissions_table = 'permissions',
    permission_role_table = 'permission_role',
    role_user_table = 'role_user',
    user_foreign_key = 'user_id',
    role_foreign_key = 'role_id',
    permission_foreign_key = 'permission_id'
}