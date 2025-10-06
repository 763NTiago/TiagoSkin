-- Mod de Skin Personalizada para Tiago
-- Versão melhorada e compatível

-- Aguarda um pouco antes de aplicar a skin (garante que tudo carregou)
minetest.register_on_joinplayer(function(player)
    local player_name = player:get_player_name()
    
    if player_name == "Tiago" then
        -- Aguarda 1 segundo antes de aplicar (permite outros mods carregarem)
        minetest.after(1, function()
            -- Método 1: Aplicar textura diretamente
            player:set_properties({
                textures = {"tiago_skin.png"},
                visual = "upright_sprite",
                visual_size = {x=1, y=2},
            })
            
            -- Se estiver usando o mod default, força atualização
            if minetest.get_modpath("default") then
                player:set_properties({
                    textures = {"tiago_skin.png"},
                    visual = "upright_sprite",
                    visual_size = {x=1, y=2},
                    collisionbox = {-0.3, 0.0, -0.3, 0.3, 1.7, 0.3},
                })
            end
            
            -- Mensagem de confirmação
            minetest.chat_send_player(player_name, "Skin personalizada carregada com sucesso!")
            minetest.log("action", "[TiagoSkin] Skin aplicada para " .. player_name)
        end)
    end
end)

-- Garante que a skin persiste após respawn
minetest.register_on_respawnplayer(function(player)
    local player_name = player:get_player_name()
    
    if player_name == "Tiago" then
        minetest.after(0.5, function()
            player:set_properties({
                textures = {"tiago_skin.png"},
                visual = "upright_sprite",
                visual_size = {x=1, y=2},
            })
        end)
    end
    return false
end)

-- Comando de debug para testar a skin manualmente
minetest.register_chatcommand("testskin", {
    params = "",
    description = "Testa a aplicação da skin personalizada",
    privs = {server = true},
    func = function(name, param)
        local player = minetest.get_player_by_name(name)
        if player then
            player:set_properties({
                textures = {"tiago_skin.png"},
                visual = "upright_sprite",
                visual_size = {x=1, y=2},
            })
            return true, "Skin aplicada! Se não aparecer, verifique se tiago_skin.png está na pasta textures/"
        end
        return false, "Erro ao encontrar jogador"
    end,
})

minetest.log("action", "[TiagoSkin] Mod carregado com sucesso!")