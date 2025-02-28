-- Charge la bibliothèque Rayfield de manière camouflée
local _ = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

-- Crée une fenêtre Rayfield avec des noms modifiés
local __ = _:CreateWindow({
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
local ___ = __:CreateTab("🚜 AutoFarm", "AutoFarm Scripts")

-- 🎯 Farm Dummy 5k
local ____ = ___:CreateToggle({
    Name = "🎯 Farm Dummy 5k",
    CurrentValue = false,
    Flag = "FarmDummyToggle",
    Callback = function(Value)
        if Value then
            -- Script pour Farm Dummy 5k
            local ______ = game:GetService("ReplicatedStorage")
            local _______ = ______:WaitForChild("SkillsInRS"):WaitForChild("RemoteEvent")
            local ________ = ______:WaitForChild("jdskhfsIIIllliiIIIdchgdIiIIIlIlIli")
            local _________ = Vector3.new(-83.33870697021484, 595.9384765625, 812.44775390625)
            local __________ = "NewFireball"
            local ___________ = workspace:FindFirstChild("MAP"):FindFirstChild("5k_dummies").Dummy2:FindFirstChild("Humanoid")
            local ____________ = 2
            local _____________ = 0.1

            task.spawn(function()
                while Value do
                    local ______________ = {
                        [1] = _________,
                        [2] = __________
                    }
                    _______:FireServer(unpack(______________))
                    task.wait(____________)
                end
            end)

            task.spawn(function()
                while Value do
                    local _______________ = {
                        [1] = ___________,
                        [2] = 1
                    }
                    ________:FireServer(unpack(_______________))
                    task.wait(_____________)
                end
            end)
        end
    end
})

-- 💰 Auto Coin
local ______ = ___:CreateToggle({
    Name = "💰 Auto Coin",
    CurrentValue = false,
    Flag = "AutoCoinToggle",
    Callback = function(Value)
        if Value then
            -- Script pour Auto Coin
            local ________ = true
            local function _________()
                while ________ do
                    game:GetService("ReplicatedStorage").Events.CoinEvent:FireServer()
                    task.wait(0.1)
                end
            end
            spawn(_________)
            _:Notify({
                Title = "💰 Auto Coin Activé",
                Content = "La collecte automatique des pièces a commencé.",
                Duration = 6.5,
                Image = 4483362458,
            })
        end
    end
})

-- 🔪 Auto Farm Kill
local ________ = ___:CreateToggle({
    Name = "🔪 Auto Farm Kill",
    CurrentValue = false,
    Flag = "AutoFarmKillToggle",
    Callback = function(Value)
        if Value then
            -- Script pour Auto Farm Kill
            local _________ = game:GetService("Players").LocalPlayer
            local __________ = game:GetService("ReplicatedStorage")

            local function _____________()
                local ____________ = _________.Character or _________.CharacterAdded:Wait()
                if ____________ then
                    local ______________ = workspace:FindFirstChild("MAP") and workspace.MAP:FindFirstChild("5k_dummies")
                    if ______________ then
                        local _______________ = ______________:FindFirstChild("Dummy2")
                        if _______________ and _______________:FindFirstChild("HumanoidRootPart") then
                            ____________:MoveTo(_______________.HumanoidRootPart.Position + Vector3.new(0, 3, 0))
                            return true
                        end
                    end
                end
                return false
            end

            local function ______________()
                local _______________ = _________.Character
                local ________________ = _______________ and _______________:FindFirstChild("Humanoid")
                if ________________ then
                    local _________________ = _____________()
                    if _________________ then
                        task.wait(1)
                        local __________________ = {
                            [1] = ________________,
                            [2] = 1
                        }
                        __________.jdskhfsIIIllliiIIIdchgdIiIIIlIlIli:FireServer(unpack(__________________))
                        task.wait(0.3)
                        ________________.Health = 0
                        local ___________________ = {
                            [1] = ________________,
                            [2] = 40206
                        }
                        __________.SkillsInRS.DamageIndicatorEvent:FireServer(unpack(___________________))
                    end
                end
            end

            local function ________________()
                if _________ then
                    task.wait(0.1)
                    _________:LoadCharacter()
                end
            end

            _________.CharacterAdded:Connect(function()
                task.wait(0.5)
                ______________()
            end)

            _________.CharacterRemoving:Connect(function()
                task.wait(0.1)
                ________________()
            end)

            ______________()
        end
    end
})

-- ⚔️ Section PVP
local _________ = __:CreateTab("⚔️ PVP", "PVP Scripts")

-- 🎯 Hitbox
local __________ = _________:CreateToggle({
    Name = "🎯 Hitbox",
    CurrentValue = false,
    Flag = "HitboxToggle",
    Callback = function(Value)
        if Value then
            -- Script pour Hitbox
            local ___________ = game:GetService("Players")
            local ____________ = game:GetService("UserInputService")
            local _____________ = game:GetService("RunService")
            local ______________ = game:GetService("ReplicatedStorage")
            local _______________ = ___________.LocalPlayer
            local ________________ = ______________:WaitForChild("SkillsInRS"):WaitForChild("DamageIndicatorEvent")
            local _________________ = {}
            local __________________ = Vector3.new(5, 5, 5)
            local ___________________ = false
            local ____________________ = true

            local _____________________ = Instance.new("ScreenGui")
            _____________________.Parent = _______________:WaitForChild("PlayerGui")
            _____________________.ResetOnSpawn = false

            local ______________________ = Instance.new("Frame")
            ______________________.Size = UDim2.new(0, 250, 0, 150)
            ______________________.Position = UDim2.new(0.05, 0, 0.2, 0)
            ______________________.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
            ______________________.BorderSizePixel = 0
            ______________________.Visible = ____________________
            ______________________.Parent = _____________________

            local _______________________ = Instance.new("TextLabel")
            _______________________.Text = "Hitbox Manager"
            _______________________.Size = UDim2.new(1, 0, 0, 30)
            _______________________.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            _______________________.TextColor3 = Color3.fromRGB(255, 255, 255)
            _______________________.Parent = ______________________

            local ________________________ = Instance.new("Frame")
            ________________________.Size = UDim2.new(1, -20, 0, 10)
            ________________________.Position = UDim2.new(0, 10, 0, 50)
            ________________________.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
            ________________________.BorderSizePixel = 0
            ________________________.Parent = ______________________

            local _________________________ = Instance.new("Frame")
            _________________________.Size = UDim2.new(0, 20, 0, 20)
            _________________________.Position = UDim2.new(0.5, -10, 0, -5)
            _________________________.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
            _________________________.BorderSizePixel = 0
            _________________________.Parent = ________________________

            local __________________________ = Instance.new("TextButton")
            __________________________.Size = UDim2.new(1, -20, 0, 30)
            __________________________.Position = UDim2.new(0, 10, 0, 90)
            __________________________.Text = "Close GUI"
            __________________________.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
            __________________________.TextColor3 = Color3.fromRGB(255, 255, 255)
            __________________________.Parent = ______________________

            local function __________________________(_________)
                if not _________ or not _________.Character then return end
                if _________ == _______________ then return end
                local __________ = _________.Character
                local ___________ = __________:FindFirstChild("HumanoidRootPart")
                if not ___________ then return end
                if _________________[_________] then
                    _________________[_________]:Destroy()
                end
                local ____________ = Instance.new("Part")
                ____________.Size = __________________
                ____________.Transparency = 0.5
                ____________.Color = Color3.fromRGB(255, 0, 0)
                ____________.Material = Enum.Material.ForceField
                ____________.Anchored = true
                ____________.CanCollide = false
                ____________.Parent = game.Workspace
                ____________.Name = "Hitbox"
                _________________[_________] = ____________
            end

            _____________.Heartbeat:Connect(function()
                for _________, ____________ in pairs(_________________) do
                    if _________ and _________.Character and _________.Character:FindFirstChild("HumanoidRootPart") then
                        local ___________ = _________.Character.HumanoidRootPart
                        ____________.Position = ___________.Position
                    end
                end
            end)

            local ___________________________ = false
            _________________________.InputBegan:Connect(function(_________)
                if _________.UserInputType == Enum.UserInputType.MouseButton1 then
                    ___________________________ = true
                end
            end)

            ____________.InputChanged:Connect(function(_________)
                if ___________________________ and _________.UserInputType == Enum.UserInputType.MouseMovement then
                    local _____________ = math.clamp(_________.Position.X - ________________________.AbsolutePosition.X, 0, ________________________.AbsoluteSize.X)
                    _________________________.Position = UDim2.new(0, _____________ - _________________________.Size.X.Offset / 2, 0, -5)
                    local ______________ = 2 + (_____________ / ________________________.AbsoluteSize.X) * 10
                    __________________ = Vector3.new(______________, ______________ + 2, ______________)
                    for _, ____________ in pairs(_________________) do
                        ____________.Size = __________________
                    end
                end
            end)

            ____________.InputEnded:Connect(function(_________)
                if _________.UserInputType == Enum.UserInputType.MouseButton1 then
                    ___________________________ = false
                end
            end)

            __________________________.MouseButton1Click:Connect(function()
                ____________________ = not ____________________
                ______________________.Visible = ____________________
                __________________________.Text = ____________________ and "Close GUI" or "Open GUI"
            end)

            for _, _________ in pairs(___________:GetPlayers()) do
                if _________ ~= _______________ and _________.Character then
                    __________________________(_________)
                end
                _________.CharacterAdded:Connect(function()
                    __________________________(_________)
                end)
            end

            ___________.PlayerAdded:Connect(function(_________)
                if _________ ~= _______________ then
                    _________.CharacterAdded:Connect(function()
                        __________________________(_________)
                    end)
                end
            end)
        end
    end
})

-- 🎉 Section FUN
local ___________ = __:CreateTab("🎉 FUN", "Fun Scripts")

-- 🔫 Spam Weapon
local ____________ = ___________:CreateToggle({
    Name = "🔫 Spam Weapon",
    CurrentValue = false,
    Flag = "SpamWeaponToggle",
    Callback = function(Value)
        if Value then
            -- Script pour Spam Weapon
            local _____________ = game:GetService("ReplicatedStorage").Events.WeaponEvent
            local ______________ = { [1] = "None" }
            local _______________ = { [1] = "S0" }

            local function ________________(_________)
                local __________ = game:GetService("Players").LocalPlayer
                if __________ and __________:FindFirstChild("PlayerGui") then
                    for _, _________ in pairs(__________.PlayerGui:GetChildren()) do
                        if _________:IsA("ScreenGui") and _________.Name:lower():find("weapon") then
                            _________.Enabled = false
                        end
                    end
                end
            end

            while Value do
                for _________ = 1, 9 do
                    local __________ = { [1] = "S" .. _________ }
                    ________________(_________)
                    ____________:FireServer(unpack(__________))
                    task.wait(0.15)
                    ____________:FireServer(unpack(______________))
                    task.wait(0.1)
                    ____________:FireServer(unpack(_______________))
                    task.wait(0.1)
                    ________________(_________)
                end
            end
        end
    end
})
