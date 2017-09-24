
local lx, _M = oo{
    _cls_ = ''
}

local app, lf, tb, str = lx.kit()
local fs = lx.fs

function _M:cacheAvatar()

    --Download Image
    local hc = new('net.http.client')
    local response = hc:get(self.image_url)
    --Get ext
    local content_type = str.split(response:getHeader('Content-Type')[1], '/')
    local ext = tb.pop(content_type)
    local avatar_name = self.id .. '_' .. time() .. '.' .. ext
    local save_path = public_path('uploads/avatars/') .. avatar_name
    --Save File
    local content = response:getBody():getContents()
    file_put_contents(save_path, content)
    --Delete old file
    if self.avatar then
        fs.delete(lx.dir('tmp', 'upload/avatars/') .. self.avatar)
    end
    --Save to database
    self.avatar = avatar_name
    self:save()
end

function _M:updateAvatar(file)

    local upload_status = app('.app.lxhub.handler.imageUploadHandler'):uploadAvatar(file, self)
    self.avatar = upload_status['filename']
    self:save()
    
    return {avatar = self.avatar}
end

return _M

