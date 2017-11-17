
local lx, _M = oo{
    _cls_ = '',
    _ext_ = 'migration'
}

local app, lf, tb, str = lx.kit()

-- Run the migrations.


function _M:up(schema)

    schema:create('users', function(table)
        table:increments('id')
        table:integer('github_id'):index()
        table:string('github_url')
        table:string('github_name'):index()
        table:string('email'):nullable():index()
        table:string('name'):nullable():index()
        table:string('login_token'):nullable()
        table:string('remember_token'):nullable()
        table:enum('is_banned', {'yes', 'no'}):default('no'):index()
        table:string('image_url'):nullable()
        table:integer('topic_count'):default(0):index()
        table:integer('reply_count'):default(0):index()
        table:integer('follower_count'):default(0):index()
        table:string('city'):nullable()
        table:string('company'):nullable()
        table:string('twitter_account'):nullable()
        table:string('personal_website'):nullable()
        table:string('introduction'):nullable()
        table:string('certification'):nullable()
        table:integer('notification_count'):default(0)
        table:string('real_name'):nullable()
        table:string('linkedin'):nullable()
        table:string('payment_qrcode'):nullable()
        table:string('avatar')
        table:string('login_qr'):nullable()
        table:string('wechat_openid'):nullable():index()
        table:string('wechat_unionid'):nullable():index()
        table:string('weibo_name'):nullable()
        table:string('weibo_link'):nullable()
        table:string('wechat_qrcode'):nullable()
        table:string('qq_openid'):nullable():index()
        table:string('qq_unionid'):nullable():index()
        table:string('qq_nickname'):nullable()
        table:boolean('verified'):default(false):index()
        table:string('verification_token'):nullable()
        table:enum('email_notify_enabled', {'yes', 'no'}):default('yes'):index()
        table:string('register_source'):index()
        table:timestamp('last_actived_at'):nullable()
        table:softDeletes()
        table:timestamps()
    end)
end

-- Reverse the migrations.


function _M:down(schema)

    schema:drop('users')
end

return _M

