
local lx, _M = oo{
    _cls_ = ''
}

local app, lf, tb, str = lx.kit()

function _M:activities()

    return self:activitiesByCausers({'u' .. self.id})
end

function _M:subscribedActivityFeeds()

    local causers = self:interestedCausers()
    
    return self:activitiesByCausers(causers)
end

function _M:interestedCausers()

    local followings = self('followings'):Col():map(function(user, key)
        
        return 'u' .. user.id
    end):toArr()
    local subscribed_blogs = self('subscribes'):Col():map(function(blog, key)
        
        return 'b' .. blog.id
    end):toArr()
    
    return tb.merge({'u' .. self.id}, followings, subscribed_blogs)
end

function _M:activitiesByCausers(causers)

    return Activity.whereIn('causer', causers):recent():paginate(50)
end

return _M

