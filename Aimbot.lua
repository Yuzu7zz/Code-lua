local HttpService = game:GetService("HttpService")
local function safeLoad(url)
    local success, result = pcall(function()
        return loadstring(game:HttpGet(url))()
    end)
    if not success then
        warn("Failed to load script from: " .. url)
        warn(result)
    end
end

safeLoad("https://rawscripts.net/raw/Universal-Script-Shiftlock-22314")

safeLoad("https://raw.githubusercontent.com/Yuzu7zz/Code-lua/refs/heads/main/lock.lua")
