fx_version 'cerulean'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
game 'rdr3'

author 'RexShack#3041'
description 'rsg-goldrush'

client_scripts {
	'client/client.lua',
}

server_scripts {
	'server/server.lua',
}

shared_scripts {
	'config.lua'
}

dependency 'qr-core'

this_is_a_map 'yes'

lua54 'yes'