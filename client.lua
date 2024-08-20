local emotePlaying = false

-- Debug print function
local function debugPrint(message)
    if Config.Debug then
        print("[DEBUG] " .. message)
    end
end

-- Utility function to play emote and open inventory
function playEmoteAndOpenInventory(emote, shopType, cancelEmote)
    emotePlaying = true
    exports.scully_emotemenu:playEmoteByCommand(emote, 0)
    Wait(1250)
    if cancelEmote then
        exports.scully_emotemenu:cancelEmote()
    end
    exports.ox_inventory:openInventory('shop', { type = shopType })
    Citizen.SetTimeout(2500, function()
        emotePlaying = false
    end)
end

-- Function to handle soda machine interact
function handleVendingMachineSoda()
    if not emotePlaying then
        playEmoteAndOpenInventory('dispenser', Config.VendingMachines.Drinks.ShopType)
        debugPrint("Interacted with soda machine.")
    end
end

-- Function to handle donut machine interact
function handleVendingMachineDonuts()
    if not emotePlaying then
        playEmoteAndOpenInventory('think3', Config.VendingMachines.Donuts.ShopType, true)
        debugPrint("Interacted with donut machine.")
    end
end

-- Function to add vending machine interact
local function addVendingMachineInteraction(machineType)
    local machineConfig = Config.VendingMachines[machineType]

    if machineConfig then
        debugPrint("Setting up interactions for: " .. machineType)
        for _, model in ipairs(machineConfig.Models) do
            local id = machineConfig.InteractionIDPrefix .. model
            local actionFunc = _G[machineConfig.ActionFunction]

            if Config.InteractOption == "ox" then
                exports.ox_target:addModel(model, {
                    {
                        name = id,
                        label = machineConfig.InteractionText,
                        icon = machineConfig.Icon,
                        onSelect = actionFunc,
                    }
                })
                debugPrint("Using ox_target for model: " .. model)
            elseif Config.InteractOption == "interact" then
                exports.interact:AddModelInteraction({
                    model = model,
                    name = 'vend_fridge_interaction',
                    id = id,
                    distance = 4.0,
                    interactDst = 2.0,
                    offset = machineConfig.Offset,
                    options = {
                        {
                            label = machineConfig.InteractionText,
                            action = actionFunc,
                        }
                    }
                })
                debugPrint("Using interact for model: " .. model)
            else
                debugPrint("Error: Invalid Config.InteractOption. Must be 'ox' or 'interaction'.")
            end
        end
    else
        debugPrint("Error: Vending machine type '" .. machineType .. "' not found.")
    end
end

-- Adding interactions for all vending machines
addVendingMachineInteraction('Drinks')
addVendingMachineInteraction('Donuts')
