
local lx, _M = oo{
	_cls_	= '',
	_ext_ 	= 'box'
}

local app   = lx.app()
local Model = lx.use('model')

function _M:reg()

	Model.defaultTimestamps(true)
	app:listen('db.query', 	       '.db.event.queryListener')
	app:listen('.app.model.post',  '.db.event.modelListener')
end

function _M:boot()

end

return _M

