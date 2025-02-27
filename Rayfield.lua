local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local Window = Rayfield:CreateWindow({
    Name = "🌟 Script Hub - AutoFarm & PVP 🌟",
    LoadingTitle = "Chargement...",
    LoadingSubtitle = "by Babaoff0",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "ScriptHub",
        FileName = "Config"
    },
    Discord = {
        Enabled = true,
        Invite = "discord.gg/yourinvite", -- Remplace par ton lien Discord
        RememberJoins = true
    }
})

-- 📂 Section AUTOFARM
local AutoFarmTab = Window:CreateTab("🚜 AutoFarm", "AutoFarm Scripts")

-- 🎯 Farm Dummy 5k
local FarmDummyToggle = AutoFarmTab:CreateToggle({
    Name = "🎯 Farm Dummy 5k",
    CurrentValue = false,
    Flag = "FarmDummyToggle",
    Callback = function(Value)
        if Value then
            -- Script pour Farm Dummy 5k
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            local FireballEvent = ReplicatedStorage:WaitForChild("SkillsInRS"):WaitForChild("RemoteEvent")
            local HitEvent = ReplicatedStorage:WaitForChild("jdskhfsIIIllliiIIIdchgdIiIIIlIlIli")
            local fireballPosition = Vector3.new(-83.33870697021484, 595.9384765625, 812.44775390625)
            local projectileType = "NewFireball"
            local dummyHumanoid = workspace:FindFirstChild("MAP"):FindFirstChild("5k_dummies").Dummy2:FindFirstChild("Humanoid")
            local fireballCooldown = 2
            local hitCooldown = 0.1

            task.spawn(function()
                while Value do
                    local fireballArgs = {
                        [1] = fireballPosition,
                        [2] = projectileType
                    }
                    FireballEvent:FireServer(unpack(fireballArgs))
                    task.wait(fireballCooldown)
                end
            end)

            task.spawn(function()
                while Value do
                    local hitArgs = {
                        [1] = dummyHumanoid,
                        [2] = 1
                    }
                    HitEvent:FireServer(unpack(hitArgs))
                    task.wait(hitCooldown)
                end
            end)
        end
    end
})

-- 💰 Auto Coin
local AutoCoinToggle = AutoFarmTab:CreateToggle({
    Name = "💰 Auto Coin",
    CurrentValue = false,
    Flag = "AutoCoinToggle",
    Callback = function(Value)
        if Value then
            -- Script pour Auto Coin
            local autoCollect = true
            local function collectCoins()
                while autoCollect do
                    game:GetService("ReplicatedStorage").Events.CoinEvent:FireServer()
                    task.wait(0.1)
                end
            end
            spawn(collectCoins)
            Rayfield:Notify({
                Title = "💰 Auto Coin Activé",
                Content = "La collecte automatique des pièces a commencé.",
                Duration = 6.5,
                Image = 4483362458,
            })
        end
    end
})

-- 🔪 Auto Farm Kill
local AutoFarmKillToggle = AutoFarmTab:CreateToggle({
    Name = "🔪 Auto Farm Kill",
    CurrentValue = false,
    Flag = "AutoFarmKillToggle",
    Callback = function(Value)
        if Value then
            -- Script pour Auto Farm Kill
            local player = game:GetService("Players").LocalPlayer
            local replicatedStorage = game:GetService("ReplicatedStorage")

            local function teleportToDummies()
                local character = player.Character or player.CharacterAdded:Wait()
                if character then
                    local dummiesFolder = workspace:FindFirstChild("MAP") and workspace.MAP:FindFirstChild("5k_dummies")
                    if dummiesFolder then
                        local targetDummy = dummiesFolder:FindFirstChild("Dummy2")
                        if targetDummy and targetDummy:FindFirstChild("HumanoidRootPart") then
                            character:MoveTo(targetDummy.HumanoidRootPart.Position + Vector3.new(0, 3, 0))
                            return true
                        end
                    end
                end
                return false
            end

            local function autoKill()
                local character = player.Character
                local humanoid = character and character:FindFirstChild("Humanoid")
                if humanoid then
                    local success = teleportToDummies()
                    if success then
                        task.wait(1)
                        local hitArgs = {
                            [1] = humanoid,
                            [2] = 1
                        }
                        replicatedStorage.jdskhfsIIIllliiIIIdchgdIiIIIlIlIli:FireServer(unpack(hitArgs))
                        task.wait(0.3)
                        humanoid.Health = 0
                        local killArgs = {
                            [1] = humanoid,
                            [2] = 40206
                        }
                        replicatedStorage.SkillsInRS.DamageIndicatorEvent:FireServer(unpack(killArgs))
                    end
                end
            end

            local function forceRespawn()
                if player then
                    task.wait(0.1)
                    player:LoadCharacter()
                end
            end

            player.CharacterAdded:Connect(function()
                task.wait(0.5)
                autoKill()
            end)

            player.CharacterRemoving:Connect(function()
                task.wait(0.1)
                forceRespawn()
            end)

            autoKill()
        end
    end
})

-- ⚔️ Section PVP
local PVPTab = Window:CreateTab("⚔️ PVP", "PVP Scripts")

-- 🎯 Hitbox
local HitboxToggle = PVPTab:CreateToggle({
    Name = "🎯 Hitbox",
    CurrentValue = false,
    Flag = "HitboxToggle",
    Callback = function(Value)
        if Value then
            -- Script pour Hitbox
            local Players = game:GetService("Players")
            local UserInputService = game:GetService("UserInputService")
            local RunService = game:GetService("RunService")
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            local localPlayer = Players.LocalPlayer
            local DamageEvent = ReplicatedStorage:WaitForChild("SkillsInRS"):WaitForChild("DamageIndicatorEvent")
            local hitboxes = {}
            local hitboxSize = Vector3.new(5, 5, 5)
            local debounce = false
            local guiEnabled = true

            local screenGui = Instance.new("ScreenGui")
            screenGui.Parent = localPlayer:WaitForChild("PlayerGui")
            screenGui.ResetOnSpawn = false

            local frame = Instance.new("Frame")
            frame.Size = UDim2.new(0, 250, 0, 150)
            frame.Position = UDim2.new(0.05, 0, 0.2, 0)
            frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
            frame.BorderSizePixel = 0
            frame.Visible = guiEnabled
            frame.Parent = screenGui

            local titleLabel = Instance.new("TextLabel")
            titleLabel.Text = "Hitbox Manager"
            titleLabel.Size = UDim2.new(1, 0, 0, 30)
            titleLabel.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            titleLabel.Parent = frame

            local slider = Instance.new("Frame")
            slider.Size = UDim2.new(1, -20, 0, 10)
            slider.Position = UDim2.new(0, 10, 0, 50)
            slider.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
            slider.BorderSizePixel = 0
            slider.Parent = frame

            local knob = Instance.new("Frame")
            knob.Size = UDim2.new(0, 20, 0, 20)
            knob.Position = UDim2.new(0.5, -10, 0, -5)
            knob.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
            knob.BorderSizePixel = 0
            knob.Parent = slider

            local toggleGuiButton = Instance.new("TextButton")
            toggleGuiButton.Size = UDim2.new(1, -20, 0, 30)
            toggleGuiButton.Position = UDim2.new(0, 10, 0, 90)
            toggleGuiButton.Text = "Close GUI"
            toggleGuiButton.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
            toggleGuiButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            toggleGuiButton.Parent = frame

            local function createHitbox(player)
                if not player or not player.Character then return end
                if player == localPlayer then return end
                local character = player.Character
                local rootPart = character:FindFirstChild("HumanoidRootPart")
                if not rootPart then return end
                if hitboxes[player] then
                    hitboxes[player]:Destroy()
                end
                local hitbox = Instance.new("Part")
                hitbox.Size = hitboxSize
                hitbox.Transparency = 0.5
                hitbox.Color = Color3.fromRGB(255, 0, 0)
                hitbox.Material = Enum.Material.ForceField
                hitbox.Anchored = true
                hitbox.CanCollide = false
                hitbox.Parent = game.Workspace
                hitbox.Name = "Hitbox"
                hitboxes[player] = hitbox
            end

            RunService.Heartbeat:Connect(function()
                for player, hitbox in pairs(hitboxes) do
                    if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                        local rootPart = player.Character.HumanoidRootPart
                        hitbox.Position = rootPart.Position
                    end
                end
            end)

            local dragging = false
            knob.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    dragging = true
                end
            end)

            UserInputService.InputChanged:Connect(function(input)
                if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                    local relativeX = math.clamp(input.Position.X - slider.AbsolutePosition.X, 0, slider.AbsoluteSize.X)
                    knob.Position = UDim2.new(0, relativeX - knob.Size.X.Offset / 2, 0, -5)
                    local newScale = 2 + (relativeX / slider.AbsoluteSize.X) * 10
                    hitboxSize = Vector3.new(newScale, newScale + 2, newScale)
                    for _, hitbox in pairs(hitboxes) do
                        hitbox.Size = hitboxSize
                    end
                end
            end)

            UserInputService.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    dragging = false
                end
            end)

            toggleGuiButton.MouseButton1Click:Connect(function()
                guiEnabled = not guiEnabled
                frame.Visible = guiEnabled
                toggleGuiButton.Text = guiEnabled and "Close GUI" or "Open GUI"
            end)

            for _, player in pairs(Players:GetPlayers()) do
                if player ~= localPlayer and player.Character then
                    createHitbox(player)
                end
                player.CharacterAdded:Connect(function()
                    createHitbox(player)
                end)
            end

            Players.PlayerAdded:Connect(function(player)
                if player ~= localPlayer then
                    player.CharacterAdded:Connect(function()
                        createHitbox(player)
                    end)
                end
            end)
        end
    end
})

-- 🎉 Section FUN
local FunTab = Window:CreateTab("🎉 FUN", "Fun Scripts")

-- 🔫 Spam Weapon
local SpamWeaponToggle = FunTab:CreateToggle({
    Name = "🔫 Spam Weapon",
    CurrentValue = false,
    Flag = "SpamWeaponToggle",
    Callback = function(Value)
        if Value then
            -- Script pour Spam Weapon
            local event = game:GetService("ReplicatedStorage").Events.WeaponEvent
            local unequipArgs1 = { [1] = "None" }
            local unequipArgs2 = { [1] = "S0" }

            local function hideWeaponMenu()
                local player = game:GetService("Players").LocalPlayer
                if player and player:FindFirstChild("PlayerGui") then
                    for _, gui in pairs(player.PlayerGui:GetChildren()) do
                        if gui:IsA("ScreenGui") and gui.Name:lower():find("weapon") then
                            gui.Enabled = false
                        end
                    end
                end
            end

            while Value do
                for i = 1, 9 do
                    local args = { [1] = "S" .. i }
                    hideWeaponMenu()
                    event:FireServer(unpack(args))
                    task.wait(0.15)
                    event:FireServer(unpack(unequipArgs1))
                    task.wait(0.1)
                    event:FireServer(unpack(unequipArgs2))
                    task.wait(0.1)
                    hideWeaponMenu()
                end
            end
        end
    end
})
