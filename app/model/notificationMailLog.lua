
local lx, _M, mt = oo{
    _cls_ = '',
    _ext_ = 'model'
}

local app, lf, tb, str = lx.kit()

function _M:new()

    local this = {
        guarded = {'id'}
    }
    
    return oo(this, mt)
end
return _M

