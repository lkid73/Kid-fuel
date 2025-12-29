fx_version 'cerulean'
games { 'gta5' }

author "L'kid"
description "Basic Fuel Management System"
version "1.0.0"

lua54 "yes"

-- [ LIBS ] --

shared_scripts {
    '@ox_lib/init.lua',
}

-- [ SCRIPTS ] --

shared_scripts {
    'shared/sh_base.lua',
    'shared/**/*.lua'
}

client_scripts {
    'client/c_base.lua',
    'client/**/*.lua'
}

server_scripts {
    'server/s_base.lua',
    'server/**/*.lua'
}