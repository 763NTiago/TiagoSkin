-- Skin exclusiva para jogador "Tiago" no Mineclonia

local SKIN_TEXTURE = "tiago_skin.png"
local PLAYER_NAME = "Tiago"

local function aplicar_skin(player)
    if not player or not player:is_player() then return end
    if player:get_player_name() == PLAYER_NAME then
        if player.set_texture then
            player:set_texture(SKIN_TEXTURE)
            minetest.chat_send_player(PLAYER_NAME, "✅ Sua skin exclusiva foi aplicada!")
            minetest.log("action", "[tiagoskin_force] Skin aplicada para " .. PLAYER_NAME)
        else
            minetest.chat_send_player(PLAYER_NAME, "⚠️ Este jogo não suporta set_texture diretamente.")
        end
    end
end

minetest.register_on_joinplayer(function(player)
    minetest.after(1, function()
        aplicar_skin(player)
    end)
end)

minetest.register_on_respawnplayer(function(player)
    minetest.after(0.5, function()
        aplicar_skin(player)
    end)
    return false
end)
