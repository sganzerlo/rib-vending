Config = {}

Config.Debug = true  -- Enable or disable debug mode

-- Use 'ox' for ox_target or 'interact' for darktrovx interact
Config.InteractOption = "ox"

Config.VendingMachines = {
    Drinks = {
        Models = {
            'prop_vend_soda_01',  -- Drink machine model 1
            'prop_vend_soda_02',  -- Drink machine model 2
        },
        InteractionText = "Drinks Machine",
        InteractionIDPrefix = "unique_interaction_id_soda_",
        Offset = vec3(0.0, 0.0, 0.0),
        ActionFunction = "handleVendingMachineSoda",
        Icon = 'fa-solid fa-money-bill',  -- Icon for 'ox_target'
        ShopType = "VendingMachineDrinks",  -- Shop type to open - ox_inventory/data/shops.lua
    },
    Donuts = {
        Models = {
            'v_ret_247_donuts',  -- Donut machine model
        },
        InteractionText = "Donuts Machine",
        InteractionIDPrefix = "unique_interaction_id_donut_",
        Offset = vec3(0.0, 0.0, 0.25),
        ActionFunction = "handleVendingMachineDonuts",
        Icon = 'fa-solid fa-donut',  -- Icon for 'ox_target'
        ShopType = "VendingMachineDonuts",  -- Shop type to open - ox_inventory/data/shops.lua
    }
    -- Add more vending machines below if needed
}
