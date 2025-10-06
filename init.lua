-- Este código será executado sempre que um jogador entrar no servidor.
minetest.register_on_joinplayer(function(player)

    -- Pega o nome do jogador que acabou de entrar.
    local player_name = player:get_player_name()

    -- Verifica se o nome do jogador é exatamente "Tiago".
    if player_name == "Tiago" then

        -- Se for o Tiago, define as texturas (skin) dele.
        -- O nome do arquivo deve corresponder ao que está na pasta 'textures'.
        player:set_properties({
            textures = {"tiago_skin.png"},
        })

        -- Envia uma mensagem no chat apenas para o Tiago (opcional, mas divertido!)
        minetest.chat_send_player(player_name, "Bem-vindo, Mestre do Servidor! Sua skin personalizada foi carregada.")
    end
end)