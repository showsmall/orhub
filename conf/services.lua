
local lx = require('lxlib')
local str, env = lx.str, lx.env

local conf = {
    github = {
        driver = 'github',
        client_id = env('github.clientId'),
        client_secret = env('github.clientSecret'),
        redirect = str.finish(env('appUrl'), '/') .. 'auth/callback?driver=github'
    },
    qq = {
        driver = 'qq',
        client_id = '101439030',
        client_secret = 'f6db70015951de87489316c148d53d40',
        redirect = str.finish(env('appUrl'), '/') .. 'auth/callback?driver=qq'
    },
    wechat = {
        driver = 'wechat',
        client_id = env('wechat.key') or 'wxcc9f4fe669d03701',
        client_secret = env('wechat.secret') or 'd4624c36b6795d1d99dcf0547af5443d',
        redirect = env('wechat.redirect_uri') or 'http://www.vvsai.com/web2/api/Wechat/wechat.html',
        auth_base_uri = 'https://open.weixin.qq.com/connect/qrconnect'
    },
    baidu_translate = {
        appid = env('BAIDU_TRANSLATE_APPID'),
        key = env('BAIDU_TRANSLATE_KEY')
    },
    mailgun = {
        domain = env('MAILGUN_DOMAIN'),
        secret = env('MAILGUN_SECRET')
    },
}

return conf

