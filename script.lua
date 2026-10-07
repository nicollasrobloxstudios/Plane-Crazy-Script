-- ============================================
-- PROFESSIONAL HUB - PLANE CRAZY v5.0
-- ============================================

local Players = game:GetService("Players")
local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

-- ============================================
-- TELA DE LOADING
-- ============================================
local loadingGui = Instance.new("ScreenGui")
loadingGui.Name = "LoadingScreen"
loadingGui.ResetOnSpawn = false
loadingGui.Parent = player:WaitForChild("PlayerGui")

local loadingBackground = Instance.new("Frame")
loadingBackground.Size = UDim2.new(1, 0, 1, 0)
loadingBackground.BackgroundColor3 = Color3.fromRGB(5, 5, 10)
loadingBackground.Parent = loadingGui

-- Logo
local logoText = Instance.new("TextLabel")
logoText.Size = UDim2.new(1, 0, 0, 120)
logoText.Position = UDim2.new(0, 0, 0.25, -60)
logoText.Text = "✈️"
logoText.Font = Enum.Font.GothamBold
logoText.TextSize = 100
logoText.TextColor3 = Color3.fromRGB(0, 170, 255)
logoText.BackgroundTransparency = 1
logoText.Parent = loadingBackground

-- Nome
local hubName = Instance.new("TextLabel")
hubName.Size = UDim2.new(1, 0, 0, 60)
hubName.Position = UDim2.new(0, 0, 0.35, -30)
hubName.Text = "PLANE CRAZY HUB"
hubName.Font = Enum.Font.GothamBold
hubName.TextSize = 40
hubName.TextColor3 = Color3.new(1, 1, 1)
hubName.BackgroundTransparency = 1
hubName.Parent = loadingBackground

-- Subtítulo
local subTitle = Instance.new("TextLabel")
subTitle.Size = UDim2.new(1, 0, 0, 30)
subTitle.Position = UDim2.new(0, 0, 0.35, 30)
subTitle.Text = "Carregando..."
subTitle.Font = Enum.Font.Gotham
subTitle.TextSize = 16
subTitle.TextColor3 = Color3.fromRGB(128, 128, 128)
subTitle.BackgroundTransparency = 1
subTitle.Parent = loadingBackground

-- Barra de progresso
local progressFrame = Instance.new("Frame")
progressFrame.Size = UDim2.new(0, 350, 0, 8)
progressFrame.Position = UDim2.new(0.5, -175, 0.5, 20)
progressFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
progressFrame.BorderSizePixel = 0
progressFrame.Parent = loadingBackground

local progressCorner = Instance.new("UICorner")
progressCorner.CornerRadius = UDim.new(1, 0)
progressCorner.Parent = progressFrame

local progressBar = Instance.new("Frame")
progressBar.Size = UDim2.new(0, 0, 1, 0)
progressBar.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
progressBar.BorderSizePixel = 0
progressBar.Parent = progressFrame

local progressBarCorner = Instance.new("UICorner")
progressBarCorner.CornerRadius = UDim.new(1, 0)
progressBarCorner.Parent = progressBar

-- Texto progresso
local progressText = Instance.new("TextLabel")
progressText.Size = UDim2.new(1, 0, 0, 20)
progressText.Position = UDim2.new(0, 0, 0.5, 35)
progressText.Text = "0%"
progressText.Font = Enum.Font.Gotham
progressText.TextSize = 14
progressText.TextColor3 = Color3.fromRGB(0, 170, 255)
progressText.BackgroundTransparency = 1
progressText.Parent = loadingBackground

-- Pontos
local dots = Instance.new("TextLabel")
dots.Size = UDim2.new(1, 0, 0, 30)
dots.Position = UDim2.new(0, 0, 0.55, 0)
dots.Text = ""
dots.Font = Enum.Font.GothamBold
dots.TextSize = 20
dots.TextColor3 = Color3.fromRGB(0, 170, 255)
dots.BackgroundTransparency = 1
dots.Parent = loadingBackground

-- Animações
spawn(function()
    while true do
        for i = 1, 10 do
            logoText.Position = UDim2.new(0, 0, 0.25 - (i * 0.005), -60)
            wait(0.02)
        end
        for i = 1, 10 do
            logoText.Position = UDim2.new(0, 0, 0.25 + (i * 0.005), -60)
            wait(0.02)
        end
    end
end)

spawn(function()
    while true do
        for i = 0, 360, 3 do
            logoText.Rotation = i
            wait(0.01)
        end
    end
end)

spawn(function()
    local dotCount = 0
    while true do
        dotCount = (dotCount + 1) % 4
        dots.Text = string.rep(".", dotCount)
        wait(0.3)
    end
end)

-- Progresso
local progress = 0
local messages = {
    "Inicializando...",
    "Carregando scripts...",
    "Conectando...",
    "Verificando...",
    "Carregando recursos...",
    "Quase pronto...",
    "Finalizando..."
}

spawn(function()
    for i = 1, 100 do
        progress = i
        progressBar:TweenSize(UDim2.new(progress / 100, 0, 1, 0), "Out", "Quad", 0.05)
        progressText.Text = progress .. "%"
        
        if i % 15 == 0 then
            subTitle.Text = messages[math.random(1, #messages)]
        end
        
        wait(0.04)
    end
    
    subTitle.Text = "Pronto!"
    progressText.Text = "100%"
    progressBar:TweenSize(UDim2.new(1, 0, 1, 0), "Out", "Quad", 0.5)
    
    wait(1)
    
    for i = 0, 10 do
        loadingBackground.BackgroundTransparency = i / 10
        logoText.TextTransparency = i / 10
        hubName.TextTransparency = i / 10
        subTitle.TextTransparency = i / 10
        progressFrame.BackgroundTransparency = i / 10
        progressBar.BackgroundTransparency = i / 10
        progressText.TextTransparency = i / 10
        dots.TextTransparency = i / 10
        wait(0.05)
    end
    
    loadingGui:Destroy()
end)

-- ============================================
-- GUI PRINCIPAL
-- ============================================
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "PlaneCrazyHub"
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

-- ============================================
-- BOTÃO FLUTUANTE ARRASTÁVEL
-- ============================================
local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(0, 60, 0, 60)
toggleButton.Position = UDim2.new(0, 10, 0.7, 0)
toggleButton.Text = "⚡"
toggleButton.Font = Enum.Font.GothamBold
toggleButton.TextSize = 30
toggleButton.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
toggleButton.BackgroundTransparency = 0.1
toggleButton.BorderSizePixel = 0
toggleButton.Parent = screenGui

local toggleCorner = Instance.new("UICorner")
toggleCorner.CornerRadius = UDim.new(1, 0)
toggleCorner.Parent = toggleButton

local toggleGlow = Instance.new("UIStroke")
toggleGlow.Thickness = 2
toggleGlow.Color = Color3.fromRGB(0, 170, 255)
toggleGlow.Parent = toggleButton

-- Sistema de arrastar botão
local buttonDragging = false
local buttonDragStart = nil
local buttonOriginalPos = nil

toggleButton.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        buttonDragging = true
        buttonDragStart = input.Position
        buttonOriginalPos = toggleButton.Position
    end
end)

toggleButton.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        buttonDragging = false
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if buttonDragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - buttonDragStart
        toggleButton.Position = UDim2.new(
            buttonOriginalPos.X.Scale, 
            buttonOriginalPos.X.Offset + delta.X,
            buttonOriginalPos.Y.Scale, 
            buttonOriginalPos.Y.Offset + delta.Y
        )
    end
end)

-- ============================================
-- HUB PRINCIPAL ARRASTÁVEL
-- ============================================
local hubFrame = Instance.new("Frame")
hubFrame.Size = UDim2.new(0, 500, 0, 600)
hubFrame.Position = UDim2.new(0.5, -250, 0.5, -300)
hubFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
hubFrame.BackgroundTransparency = 0.05
hubFrame.BorderSizePixel = 0
hubFrame.Visible = false
hubFrame.Parent = screenGui

local hubCorner = Instance.new("UICorner")
hubCorner.CornerRadius = UDim.new(0, 15)
hubCorner.Parent = hubFrame

local hubStroke = Instance.new("UIStroke")
hubStroke.Thickness = 2
hubStroke.Color = Color3.fromRGB(0, 170, 255)
hubStroke.Parent = hubFrame

-- ============================================
-- CABEÇALHO ARRASTÁVEL
-- ============================================
local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 50)
header.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
header.BorderSizePixel = 0
header.Parent = hubFrame

local headerCorner = Instance.new("UICorner")
headerCorner.CornerRadius = UDim.new(0, 15)
headerCorner.Parent = header

local headerTitle = Instance.new("TextLabel")
headerTitle.Size = UDim2.new(1, -60, 1, 0)
headerTitle.Position = UDim2.new(0, 15, 0, 0)
headerTitle.Text = "✈️ PLANE CRAZY HUB v5.0"
headerTitle.Font = Enum.Font.GothamBold
headerTitle.TextSize = 18
headerTitle.TextColor3 = Color3.new(1, 1, 1)
headerTitle.BackgroundTransparency = 1
headerTitle.TextXAlignment = Enum.TextXAlignment.Left
headerTitle.Parent = header

-- Sistema de arrastar hub
local hubDragging = false
local hubDragStart = nil
local hubOriginalPos = nil

header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        hubDragging = true
        hubDragStart = input.Position
        hubOriginalPos = hubFrame.Position
    end
end)

header.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        hubDragging = false
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if hubDragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - hubDragStart
        hubFrame.Position = UDim2.new(
            hubOriginalPos.X.Scale, 
            hubOriginalPos.X.Offset + delta.X,
            hubOriginalPos.Y.Scale, 
            hubOriginalPos.Y.Offset + delta.Y
        )
    end
end)

-- Botão fechar
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -35, 0, 10)
closeButton.Text = "✕"
closeButton.Font = Enum.Font.GothamBold
closeButton.TextSize = 16
closeButton.TextColor3 = Color3.new(1, 1, 1)
closeButton.BackgroundTransparency = 1
closeButton.Parent = header

-- ============================================
-- ABAS
-- ============================================
local tabFrame = Instance.new("Frame")
tabFrame.Size = UDim2.new(1, -20, 0, 40)
tabFrame.Position = UDim2.new(0, 10, 0, 55)
tabFrame.BackgroundTransparency = 1
tabFrame.Parent = hubFrame

local tabs = {"📋 Copy", "⚙️ Opções", "🎮 Jogos", "ℹ️ Info"}
local tabButtons = {}

for i, tabName in ipairs(tabs) do
    local tabButton = Instance.new("TextButton")
    tabButton.Size = UDim2.new(0.24, -2, 1, -4)
    tabButton.Position = UDim2.new(0.25 * (i - 1), 1, 0, 2)
    tabButton.Text = tabName
    tabButton.Font = Enum.Font.Gotham
    tabButton.TextSize = 12
    tabButton.TextColor3 = Color3.new(1, 1, 1)
    tabButton.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
    tabButton.BorderSizePixel = 0
    tabButton.Parent = tabFrame
    
    local tabCorner = Instance.new("UICorner")
    tabCorner.CornerRadius = UDim.new(0, 6)
    tabCorner.Parent = tabButton
    
    tabButtons[tabName] = tabButton
end

-- ============================================
-- PAINEL COPY
-- ============================================
local copyFrame = Instance.new("Frame")
copyFrame.Size = UDim2.new(1, -30, 1, -110)
copyFrame.Position = UDim2.new(0, 15, 0, 100)
copyFrame.BackgroundTransparency = 1
copyFrame.Parent = hubFrame

local copyTitle = Instance.new("TextLabel")
copyTitle.Size = UDim2.new(1, 0, 0, 30)
copyTitle.Text = "COPIAR CONSTRUÇÃO"
copyTitle.Font = Enum.Font.GothamBold
copyTitle.TextSize = 16
copyTitle.TextColor3 = Color3.fromRGB(0, 170, 255)
copyTitle.BackgroundTransparency = 1
copyTitle.Parent = copyFrame

local playerNameBox = Instance.new("TextBox")
playerNameBox.Size = UDim2.new(1, -120, 0, 35)
playerNameBox.Position = UDim2.new(0, 0, 0, 40)
playerNameBox.PlaceholderText = "Nome do jogador..."
playerNameBox.Text = ""
playerNameBox.Font = Enum.Font.Gotham
playerNameBox.TextSize = 14
playerNameBox.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
playerNameBox.TextColor3 = Color3.new(1, 1, 1)
playerNameBox.PlaceholderColor3 = Color3.fromRGB(128, 128, 128)
playerNameBox.BorderSizePixel = 0
playerNameBox.Parent = copyFrame

local boxCorner = Instance.new("UICorner")
boxCorner.CornerRadius = UDim.new(0, 6)
boxCorner.Parent = playerNameBox

local copyButton = Instance.new("TextButton")
copyButton.Size = UDim2.new(0, 110, 0, 35)
copyButton.Position = UDim2.new(1, -110, 0, 40)
copyButton.Text = "COPIAR"
copyButton.Font = Enum.Font.GothamBold
copyButton.TextSize = 14
copyButton.TextColor3 = Color3.new(1, 1, 1)
copyButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
copyButton.BorderSizePixel = 0
copyButton.Parent = copyFrame

local copyButtonCorner = Instance.new("UICorner")
copyButtonCorner.CornerRadius = UDim.new(0, 6)
copyButtonCorner.Parent = copyButton

-- Lista de jogadores
local playerListFrame = Instance.new("Frame")
playerListFrame.Size = UDim2.new(1, 0, 1, -85)
playerListFrame.Position = UDim2.new(0, 0, 0, 85)
playerListFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
playerListFrame.BorderSizePixel = 0
playerListFrame.Parent = copyFrame

local listCorner = Instance.new("UICorner")
listCorner.CornerRadius = UDim.new(0, 6)
listCorner.Parent = playerListFrame

local scrollFrame = Instance.new("ScrollingFrame")
scrollFrame.Size = UDim2.new(1, 0, 1, 0)
scrollFrame.BackgroundTransparency = 1
scrollFrame.ScrollBarThickness = 4
scrollFrame.ScrollBarImageColor3 = Color3.fromRGB(0, 170, 255)
scrollFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
scrollFrame.CanvasSize = UDim2.new(0, 0, 2, 0)
scrollFrame.Parent = playerListFrame

local listLayout = Instance.new("UIListLayout")
listLayout.Padding = UDim.new(0, 4)
listLayout.Parent = scrollFrame

local function updatePlayerList()
    for _, child in pairs(scrollFrame:GetChildren()) do
        if child:IsA("TextButton") then
            child:Destroy()
        end
    end
    
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= player then
            local playerButton = Instance.new("TextButton")
            playerButton.Size = UDim2.new(1, -10, 0, 30)
            playerButton.Text = p.Name
            playerButton.Font = Enum.Font.Gotham
            playerButton.TextSize = 13
            playerButton.TextColor3 = Color3.new(1, 1, 1)
            playerButton.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
            playerButton.BorderSizePixel = 0
            playerButton.Parent = scrollFrame
            
            local btnCorner = Instance.new("UICorner")
            btnCorner.CornerRadius = UDim.new(0, 4)
            btnCorner.Parent = playerButton
            
            playerButton.MouseButton1Click:Connect(function()
                playerNameBox.Text = p.Name
                notify("Selecionado", "Clique em COPIAR", 3)
            end)
        end
    end
end

updatePlayerList()

-- ============================================
-- FUNÇÃO COPIAR CONSTRUÇÃO ESPECÍFICA PLANE CRAZY
-- ============================================
function findPlayerBuild(targetName)
    print("🔍 Procurando construção de: " .. targetName)
    
    -- Método 1: Procurar por modelos no workspace
    for _, v in pairs(workspace:GetChildren()) do
        if v:IsA("Model") then
            -- Verificar nome do modelo
            if v.Name == targetName or v.Name:lower() == targetName:lower() then
                print("✅ Encontrado modelo: " .. v.Name)
                return v
            end
            
            -- Verificar atributo Owner
            local owner = v:GetAttribute("Owner") or v:GetAttribute("owner")
            if owner and (owner == targetName or owner:lower() == targetName:lower()) then
                print("✅ Encontrado por Owner: " .. v.Name)
                return v
            end
            
            -- Verificar se contém o nome
            if v.Name:lower():find(targetName:lower()) then
                print("✅ Encontrado por similaridade: " .. v.Name)
                return v
            end
        end
    end
    
    -- Método 2: Procurar em todos os descendentes
    for _, v in pairs(workspace:GetDescendants()) do
        if v:IsA("Model") and v.Parent then
            local owner = v:GetAttribute("Owner") or v:GetAttribute("owner")
            if owner and (owner == targetName or owner:lower() == targetName:lower()) then
                print("✅ Encontrado descendente: " .. v.Name)
                return v
            end
        end
    end
    
    -- Método 3: Procurar por partes com nome do jogador
    for _, v in pairs(workspace:GetDescendants()) do
        if v:IsA("BasePart") and v.Name == "HumanoidRootPart" then
            local character = v.Parent
            if character and character:IsA("Model") and character.Name == targetName then
                print("✅ Encontrado personagem: " .. character.Name)
                return character
            end
        end
    end
    
    print("❌ Construção não encontrada!")
    return nil
end

function copyBuild(targetName)
    local build = findPlayerBuild(targetName)
    
    if not build then
        notify("❌ Erro", "Construção de " .. targetName .. " não encontrada!", 4)
        return false
    end
    
    -- Encontrar minha base
    local myBase = nil
    
    -- Método 1: Procurar por modelo com nome do jogador
    for _, v in pairs(workspace:GetChildren()) do
        if v:IsA("Model") and (v.Name == player.Name or v.Name == player.DisplayName) then
            myBase = v
            break
        end
    end
    
    -- Método 2: Procurar por SpawnLocation
    if not myBase then
        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("SpawnLocation") then
                myBase = v
                break
            end
        end
    end
    
    -- Método 3: Usar posição do personagem
    if not myBase and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        myBase = player.Character.HumanoidRootPart
    end
    
    if not myBase then
        notify("❌ Erro", "Base não encontrada!", 4)
        return false
    end
    
    -- Clonar construção
    local clone = build:Clone()
    clone.Parent = workspace
    
    -- Posicionar na base
    local basePos = myBase:GetPivot().Position
    clone:PivotTo(CFrame.new(basePos + Vector3.new(0, 15, 0)))
    
    -- Configurar clone
    clone:SetAttribute("Owner", player.Name)
    clone:SetAttribute("owner", player.Name)
    
    -- Limpar clone
    for _, child in ipairs(clone:GetDescendants()) do
        if child:IsA("Script") or child:IsA("LocalScript") then
            child:Destroy()
        end
        if child:IsA("BasePart") then
            child.Anchored = true
        end
    end
    
    notify("✅ Sucesso!", "Construção de " .. targetName .. " copiada!", 5)
    print("✅ Construção copiada de " .. targetName)
    return true
end

-- ============================================
-- PAINEL OPÇÕES (40 opções)
-- ============================================
local optionsFrame = Instance.new("Frame")
optionsFrame.Size = UDim2.new(1, -30, 1, -110)
optionsFrame.Position = UDim2.new(0, 15, 0, 100)
optionsFrame.BackgroundTransparency = 1
optionsFrame.Visible = false
optionsFrame.Parent = hubFrame

local optionsScroll = Instance.new("ScrollingFrame")
optionsScroll.Size = UDim2.new(1, 0, 1, 0)
optionsScroll.BackgroundTransparency = 1
optionsScroll.ScrollBarThickness = 4
optionsScroll.ScrollBarImageColor3 = Color3.fromRGB(0, 170, 255)
optionsScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
optionsScroll.CanvasSize = UDim2.new(0, 0, 3, 0)
optionsScroll.Parent = optionsFrame

local optionsLayout = Instance.new("UIListLayout")
optionsLayout.Padding = UDim.new(0, 4)
optionsLayout.Parent = optionsScroll

-- Função para criar opção
local function createOption(name, desc, callback)
    local optFrame = Instance.new("Frame")
    optFrame.Size = UDim2.new(1, -10, 0, 45)
    optFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
    optFrame.BorderSizePixel = 0
    optFrame.Parent = optionsScroll
    
    local optCorner = Instance.new("UICorner")
    optCorner.CornerRadius = UDim.new(0, 6)
    optCorner.Parent = optFrame
    
    local optName = Instance.new("TextLabel")
    optName.Size = UDim2.new(0.7, 0, 0, 25)
    optName.Position = UDim2.new(0, 10, 0, 2)
    optName.Text = name
    optName.Font = Enum.Font.GothamBold
    optName.TextSize = 13
    optName.TextColor3 = Color3.new(1, 1, 1)
    optName.BackgroundTransparency = 1
    optName.TextXAlignment = Enum.TextXAlignment.Left
    optName.Parent = optFrame
    
    local optDesc = Instance.new("TextLabel")
    optDesc.Size = UDim2.new(0.7, 0, 0, 15)
    optDesc.Position = UDim2.new(0, 10, 0, 27)
    optDesc.Text = desc
    optDesc.Font = Enum.Font.Gotham
    optDesc.TextSize = 10
    optDesc.TextColor3 = Color3.fromRGB(128, 128, 128)
    optDesc.BackgroundTransparency = 1
    optDesc.TextXAlignment = Enum.TextXAlignment.Left
    optDesc.Parent = optFrame
    
    local optButton = Instance.new("TextButton")
    optButton.Size = UDim2.new(0, 50, 0, 25)
    optButton.Position = UDim2.new(1, -60, 0.5, -12)
    optButton.Text = "OFF"
    optButton.Font = Enum.Font.GothamBold
    optButton.TextSize = 11
    optButton.TextColor3 = Color3.new(1, 1, 1)
    optButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    optButton.BorderSizePixel = 0
    optButton.Parent = optFrame
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(1, 0)
    btnCorner.Parent = optButton
    
    optButton.MouseButton1Click:Connect(function()
        if optButton.Text == "OFF" then
            optButton.Text = "ON"
            optButton.BackgroundColor3 = Color3.fromRGB(0, 200, 100)
            callback(true)
        else
            optButton.Text = "OFF"
            optButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
            callback(false)
        end
    end)
    
    return optButton
end

-- 40 Opções
createOption("🚀 Velocidade x2", "Aumenta velocidade", function(on)
    local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.WalkSpeed = on and 32 or 16
    end
end)

createOption("🕊️ Vôo Livre", "Permite voar", function(on)
    local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        if on then
            humanoid:ChangeState(Enum.HumanoidStateType.Flying)
        else
            humanoid:ChangeState(Enum.HumanoidStateType.Running)
        end
    end
end)

createOption("🚪 Noclip", "Atravessa paredes", function(on)
    if player.Character then
        for _, part in pairs(player.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = not on
            end
        end
    end
end)

createOption("👻 Invisível", "Fica invisível", function(on)
    if player.Character then
        for _, part in pairs(player.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.Transparency = on and 1 or 0
            end
        end
    end
end)

createOption("⬆️ Super Pulo", "Pulo alto", function(on)
    local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.JumpPower = on and 150 or 50
    end
end)

createOption("🌍 Anti Gravidade", "Remove gravidade", function(on)
    local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        if on then
            humanoid:ChangeState(Enum.HumanoidStateType.Freefall)
        else
            humanoid:ChangeState(Enum.HumanoidStateType.Running)
        end
    end
end)

createOption("💨 Super Velocidade", "Velocidade extrema", function(on)
    local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.WalkSpeed = on and 100 or 16
    end
end)

createOption("🦾 Super Força", "Força aumentada", function(on)
    -- Implementar
end)

createOption("🛡️ Invulnerável", "Não toma dano", function(on)
    local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.MaxHealth = on and 999999 or 100
        humanoid.Health = humanoid.MaxHealth
    end
end)

createOption("🔫 Dano Extra", "Mais dano", function(on)
    -- Implementar
end)

createOption("🎯 Mira Perfeita", "Precisão total", function(on)
    -- Implementar
end)

createOption("⚡ Auto Click", "Clica sozinho", function(on)
    -- Implementar
end)

createOption("💰 Auto Farm", "Farm automático", function(on)
    -- Implementar
end)

createOption("🏃 Correr Rápido", "Corre mais rápido", function(on)
    local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.WalkSpeed = on and 50 or 16
    end
end)

createOption("🏊 Nadar Rápido", "Nada mais rápido", function(on)
    local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.WalkSpeed = on and 40 or 16
    end
end)

createOption("🪂 Paraquedas", "Queda lenta", function(on)
    -- Implementar
end)

createOption("🎮 Controle Total", "Controle completo", function(on)
    -- Implementar
end)

createOption("📸 Visão Noturna", "Enxerga no escuro", function(on)
    if on then
        game:GetService("Lighting").Brightness = 2
    else
        game:GetService("Lighting").Brightness = 1
    end
end)

createOption("🔦 Lanterna", "Luz na frente", function(on)
    -- Implementar
end)

createOption("🕶️ Óculos Especiais", "Visão especial", function(on)
    -- Implementar
end)

createOption("🎵 Música", "Toca música", function(on)
    -- Implementar
end)

createOption("🎨 Rainbow", "Cores aleatórias", function(on)
    if on then
        spawn(function()
            while on do
                for _, part in pairs(player.Character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.Color = Color3.fromHSV(math.random(), 1, 1)
                    end
                end
                wait(0.1)
            end
        end)
    end
end)

createOption("💎 Infinito", "Recursos infinitos", function(on)
    -- Implementar
end)

createOption("🔓 Desbloquear", "Desbloqueia tudo", function(on)
    -- Implementar
end)

createOption("⭐ VIP", "Status VIP", function(on)
    -- Implementar
end)

createOption("👑 Admin", "Poderes admin", function(on)
    -- Implementar
end)

createOption("🔧 Ajustes", "Configurações", function(on)
    -- Implementar
end)

createOption("📦 Itens", "Itens especiais", function(on)
    -- Implementar
end)

createOption("🗺️ Teleporte", "Teleporte rápido", function(on)
    -- Implementar
end)

createOption("🔄 Resetar", "Reseta personagem", function(on)
    if on then
        player.Character:BreakJoints()
    end
end)

createOption("❤️ Regenerar", "Regenera vida", function(on)
    local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.Health = humanoid.MaxHealth
    end
end)

createOption("⚡ Energia", "Energia infinita", function(on)
    -- Implementar
end)

createOption("🔥 Fogo", "Personagem em chamas", function(on)
    -- Implementar
end)

createOption("❄️ Gelo", "Congela inimigos", function(on)
    -- Implementar
end)

createOption("⚡ Raio", "Poder de raio", function(on)
    -- Implementar
end)

createOption("💨 Vento", "Poder do vento", function(on)
    -- Implementar
end)

createOption("🌊 Água", "Poder da água", function(on)
    -- Implementar
end)

createOption("🌋 Terra", "Poder da terra", function(on)
    -- Implementar
end)

createOption("🌪️ Tornado", "Cria tornado", function(on)
    -- Implementar
end)

-- ============================================
-- PAINEL JOGOS
-- ============================================
local gamesFrame = Instance.new("Frame")
gamesFrame.Size = UDim2.new(1, -30, 1, -110)
gamesFrame.Position = UDim2.new(0, 15, 0, 100)
gamesFrame.BackgroundTransparency = 1
gamesFrame.Visible = false
gamesFrame.Parent = hubFrame

local gamesTitle = Instance.new("TextLabel")
gamesTitle.Size = UDim2.new(1, 0, 0, 30)
gamesTitle.Text = "MINI JOGOS"
gamesTitle.Font = Enum.Font.GothamBold
gamesTitle.TextSize = 16
gamesTitle.TextColor3 = Color3.fromRGB(0, 170, 255)
gamesTitle.BackgroundTransparency = 1
gamesTitle.Parent = gamesFrame

local game1 = Instance.new("TextButton")
game1.Size = UDim2.new(1, 0, 0, 40)
game1.Position = UDim2.new(0, 0, 0, 40)
game1.Text = "🎮 Flappy Bird"
game1.Font = Enum.Font.GothamBold
game1.TextSize = 14
game1.TextColor3 = Color3.new(1, 1, 1)
game1.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
game1.BorderSizePixel = 0
game1.Parent = gamesFrame

local game2 = Instance.new("TextButton")
game2.Size = UDim2.new(1, 0, 0, 40)
game2.Position = UDim2.new(0, 0, 0, 90)
game2.Text = "🏓 Pong"
game2.Font = Enum.Font.GothamBold
game2.TextSize = 14
game2.TextColor3 = Color3.new(1, 1, 1)
game2.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
game2.BorderSizePixel = 0
game2.Parent = gamesFrame

local game3 = Instance.new("TextButton")
game3.Size = UDim2.new(1, 0, 0, 40)
game3.Position = UDim2.new(0, 0, 0, 140)
game3.Text = "🧩 Puzzle"
game3.Font = Enum.Font.GothamBold
game3.TextSize = 14
game3.TextColor3 = Color3.new(1, 1, 1)
game3.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
game3.BorderSizePixel = 0
game3.Parent = gamesFrame

-- ============================================
-- PAINEL INFO
-- ============================================
local infoFrame = Instance.new("Frame")
infoFrame.Size = UDim2.new(1, -30, 1, -110)
infoFrame.Position = UDim2.new(0, 15, 0, 100)
infoFrame.BackgroundTransparency = 1
infoFrame.Visible = false
infoFrame.Parent = hubFrame

local infoTitle = Instance.new("TextLabel")
infoTitle.Size = UDim2.new(1, 0, 0, 30)
infoTitle.Text = "INFORMAÇÕES"
infoTitle.Font = Enum.Font.GothamBold
infoTitle.TextSize = 16
infoTitle.TextColor3 = Color3.fromRGB(0, 170, 255)
infoTitle.BackgroundTransparency = 1
infoTitle.Parent = infoFrame

local infoText = Instance.new("TextLabel")
infoText.Size = UDim2.new(1, 0, 0, 400)
infoText.Position = UDim2.new(0, 0, 0, 40)
infoText.Text = "✈️ PLANE CRAZY HUB v5.0\n\n📋 Copy: Copie construções\n⚙️ Opções: 40 opções\n🎮 Jogos: Mini jogos\n\n💡 Arraste o botão ⚡ ou o hub\n\nCréditos: Seu Nome"
infoText.Font = Enum.Font.Gotham
infoText.TextSize = 14
infoText.TextColor3 = Color3.new(1, 1, 1)
infoText.BackgroundTransparency = 1
infoText.TextXAlignment = Enum.TextXAlignment.Left
infoText.Parent = infoFrame

-- ============================================
-- FUNÇÃO NOTIFY
-- ============================================
function notify(title, text, duration)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = title,
        Text = text,
        Duration = duration or 5
    })
end

-- ============================================
-- CONEXÕES
-- ============================================
toggleButton.MouseButton1Click:Connect(function()
    hubFrame.Visible = not hubFrame.Visible
    if hubFrame.Visible then
        toggleButton.Text = "✕"
        toggleButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    else
        toggleButton.Text = "⚡"
        toggleButton.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    end
end)

closeButton.MouseButton1Click:Connect(function()
    hubFrame.Visible = false
    toggleButton.Text = "⚡"
    toggleButton.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
end)

for tabName, tabButton in pairs(tabButtons) do
    tabButton.MouseButton1Click:Connect(function()
        for name, btn in pairs(tabButtons) do
            if name == tabName then
                btn.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
            else
                btn.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
            end
        end
        
        copyFrame.Visible = tabName == "📋 Copy"
        optionsFrame.Visible = tabName == "⚙️ Opções"
        gamesFrame.Visible = tabName == "🎮 Jogos"
        infoFrame.Visible = tabName == "ℹ️ Info"
    end)
end

copyButton.MouseButton1Click:Connect(function()
    local targetName = playerNameBox.Text
    if targetName == "" then
        notify("❌ Erro", "Digite o nome do jogador!", 3)
        return
    end
    copyBuild(targetName)
end)

-- Atualizar lista
spawn(function()
    while true do
        wait(10)
        updatePlayerList()
    end
end)

print("✅ Hub v5.0 carregado!")
