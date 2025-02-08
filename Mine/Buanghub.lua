if not game:IsLoaded() then
    game.Loaded:Wait()
end

task.wait(math.random())

local games = {
    [11197615267] = 'https://raw.githubusercontent.com/AhmadV99/Script-Games/main/Anime%20Vanguards.lua' -- Anime Vanguards
}

if games[game.PlaceId] then
    if getgenv().executed_buang ~= nil or getgenv().buang_key ~= nil then
        return
    end
    getgenv().executed_buang = true
    task.wait(math.random())
    loadstring(game:HttpGet(games[game.PlaceId]))()
end
