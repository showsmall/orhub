
local lx, _M, mt = oo{
    _cls_ = '',
    _ext_ = 'baseController',
    _mix_ = 'authorizesRequests, DispatchesJobs, ValidatesRequests'
}

local app, lf, tb, str = lx.kit()

return _M

