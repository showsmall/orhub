
local lx, _M, mt = oo{
    _cls_ = '',
    _ext_ = 'migration'
}

local app, lf, tb, str = lx.kit()

function _M:up(schema)

    schema:create(config('taggable.tags_table_name'), function(table)
        table:increments('id')
        table:string('slug', 255):unique()
        table:string('name', 255):unique()
        table:text('description'):nullable()
        table:boolean('suggest'):default(false)
        table:integer('count'):unsigned():default(0)
        -- count of how many times this tag was used
        -- For: Baum Nested Set
        -- See: https://github.com/etrepat/baum#migration-configuration
        table:integer('parent_id'):nullable()
        table:integer('lft'):nullable()
        table:integer('rgt'):nullable()
        table:integer('depth'):nullable()
    end)
    schema:create(config('taggable.taggables_table_name'), function(table)
        table:increments('id')
        if config('taggable.primary_keys_type') == 'string' then
            table:string('taggable_id', 36):index()
        else 
            table:integer('taggable_id'):unsigned():index()
        end
        table:string('taggable_type', 255):index()
        table:integer('tag_id'):unsigned():index()
        table:foreign('tag_id'):references('id'):on(config('taggable.tags_table_name')):onDelete('cascade')
    end)
end

function _M:down(schema)

    schema:drop(config('taggable.tags_table_name'))
    schema:drop(config('taggable.taggables_table_name'))
end

return _M

