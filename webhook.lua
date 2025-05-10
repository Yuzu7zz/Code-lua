-- credit: NOOB HUB --

local url = "https://discord.com/api/webhooks/1370478901289291858/ZL1xKlPm1AGbv1vrhVZR0eQcRR-fkNf6zcUJKq_7uCjKSty0Uokh2-VZhVeXyfD0_3h8"

local gamename = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
local gameid = game.PlaceId
local jobid = game.JobId
local countPlr = #game.Players:GetPlayers()

game.Players.PlayerAdded:Connect(function(players)

local data = {
    username = "Noob hub",
    avatar_url = "https://cdn.discordapp.com/emojis/932252435102175254.webp?size=80",
    content = nil,
    embeds = {
      {
        title = "**Check Players addad**",
        description= "**Players : **"..countPlr,
        color = 121793,
        fields = {
          {
            name = "**Game Name**",
            value = ("```%s```"):format(gamename)
          },
          {
            name = "**Game ID**",
            value = ("```%d```"):format(gameid)
          },
          {
            name = "**Job Id**",
            value = ("```%s```"):format(jobid)
          },
          {
            name = "**Players New Enter**",
            value = ("```%s```"):format(players.name)
          },
          {
            name = "**UserId**",
            value = ("```%s```"):format(players.UserId)
          },
          {
            name = "**Link Profile**",
            value = ("```https://www.roblox.com/users/%d/profile```"):format(players.UserId)
          }

        },
        author = {
          name = gamename,
          icon_url = "https://cdn.discordapp.com/attachments/1370471477006041139/1370479707547766895/d66a4d3fd270e1e07d9fe5b76e9ae97b.jpg?ex=681fa630&is=681e54b0&hm=aba99ba353df07dea7bb5a0d54a9205a4a4b58a71e5c39a66da23482ffa5eec4&"
        },
        footer = {
          text = "Powered by Noob hub",
          icon_url = "https://cdn.discordapp.com/emojis/932252435102175254.webp?size=80"
        },
        timestamp = DateTime.now():ToIsoDate(),
        image = {
          url = "https://cdn.discordapp.com/attachments/1370471477006041139/1370481216716935430/32458542e73b4fed8db00115d5368589.jpg?ex=681fa798&is=681e5618&hm=ff8cc77e3bf886863ce0e99312a1d4e66213a025515f5666d0ad5056875f3dbe&"
        },
        thumbnail = {
          url = "https://cdn.discordapp.com/attachments/1370471477006041139/1370481216716935430/32458542e73b4fed8db00115d5368589.jpg?ex=681fa798&is=681e5618&hm=ff8cc77e3bf886863ce0e99312a1d4e66213a025515f5666d0ad5056875f3dbe&"
        }
      }
    },
  }

local newdata = game:GetService("HttpService"):JSONEncode(data)

local headers = {["content-type"] = "application/json"}
request = http_request or request or HttpPost
local Hee = {Url = url, Body = newdata, Method = "POST", Headers = headers}
request(Hee)


end)
-- DateTime.now():ToIsoDate()
