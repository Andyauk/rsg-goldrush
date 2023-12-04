fx_version 'cerulean'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
game 'rdr3'

description 'rsg-goldrush'
version '1.0.0'

client_scripts {
	'client/client.lua',
}

server_scripts {
	'server/server.lua',
}

shared_scripts {
	'config.lua'
}

dependencies {
    'rsg-core',
    'ox_lib',
}

this_is_a_map 'yes'

lua54 'yes'