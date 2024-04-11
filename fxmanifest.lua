fx_version 'cerulean'
game 'gta5'

author 'Gerrxt <gerrxt07@proton.me>'
description 'The Hive FiveM System'
version '1.0.0'

client_scripts {
    'client/*.lua'
}

server_scripts {
    'server/*.lua'
}

shared_scripts {
    '@oxmysql/lib/MySQL.lua', -- Please install the latest version of oxmysql before using this script - Download it here: https://github.com/overextended/oxmysql/releases
    'shared/*.lua'
}

dependencies {
    'oxmysql'
}

lua54 'yes'