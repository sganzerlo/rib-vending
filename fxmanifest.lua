fx_version 'cerulean'
game 'gta5'

description 'Vending Machine'
version '1.0.0'

author 'ribeiro.gg'

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua'
}

client_scripts {
    'client.lua'
}

dependencies {
    'ox_inventory', 
    -- 'ox_target',
    'scully_emotemenu',
    'interact',
}

lua54 'yes'
use_experimental_fxv2_oal 'yes'