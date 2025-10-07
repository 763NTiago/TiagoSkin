local SKIN_TEXTURE = "tiago_skin.png"
local PLAYER_NAME = "Tiago"
local MESH = "mcl_armor_character.b3d"

local function aplicar_skin(player)
    if not player or not player:is_player() then return end
    if player:get_player_name() == PLAYER_NAME then
        player:set_properties({
            visual = "mesh",
            mesh = MESH,
            textures = {SKIN_TEXTURE, SKIN_TEXTURE, SKIN_TEXTURE},
            visual_size = {x = 1, y = 1},
            collisionbox = {-0.3, 0.0, -0.3, 0.3, 1.7, 0.3}
        })
        minetest.chat_send_player(PLAYER_NAME, "✅ Skin exclusiva aplicada!")
        minetest.log("action", "[tiagoskin] Skin aplicada para " .. PLAYER_NAME)
    end
end

minetest.register_on_joinplayer(function(player)
    minetest.after(3, function()
        aplicar_skin(player)
    end)
end)

minetest.register_on_respawnplayer(function(player)
    minetest.after(1, function()
        aplicar_skin(player)
    end)
    return false
end)
