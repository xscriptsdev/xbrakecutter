fx_version 'cerulean'
game 'gta5'
lua54 'yes'
author 'X SCRIPTS'
description 'Brake Cutter'
version '1.0.0'

shared_script '@ox_lib/init.lua'

client_scripts {
    'shared/config.lua',
    'client/client.lua'
}


server_scripts {
    '@oxmysql/lib/MySQL.lua', 
    '@es_extended/locale.lua',
    'server/server.lua'
}


