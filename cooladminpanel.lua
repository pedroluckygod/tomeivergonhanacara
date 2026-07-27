local gui = Instance.new("ScreenGui")
gui.Name = "patrickGui"
gui.Parent = game.CoreGui



--///patrick gui maker///--

local banned = {}

local ValidNames = {
   ["Valid1"] = "DeleteCar"
}

local Players = game:GetService("Players")
local selectedplayer = game.Players.LocalPlayer
local attached = false;
local backdoor = nil
local toggleselectedon = true

local function notfy(t,mes)
game.StarterGui:SetCore("SendNotification", {
Title = t,
Text = mes,
Duration = 5,
})
end

local function Inject()
    local tempo = tick()
for _, v in pairs(game.ReplicatedStorage:GetChildren()) do 
      if v.ClassName == "RemoteEvent"  then
           print("EZAdmin: Found a remote! Name: "..v.Name)
      if v.Name == ValidNames.Valid1 then
            notfy("EZAdmin","Found Backdoor Elased Time:".. tempo - tick())
            backdoor = v
         end
      end
   end
end

function NotObstructing(Destination, Ignore)
    local Origin = workspace.CurrentCamera.CFrame.Position
    local CheckRay = Ray.new(Origin, Destination - Origin)
    local Hit = workspace:FindPartOnRayWithIgnoreList(CheckRay, Ignore)
    return Hit == nil
end


game["Run Service"].RenderStepped:Connect(function()
        if selectedplayer ~= nil or selectedplayer ~= game.Players.LocalPlayer then
        local vc, OnScreen = workspace.CurrentCamera:WorldToViewportPoint(selectedplayer.Character.HumanoidRootPart.Position)
        if OnScreen then
            local Txt = Drawing.new("Line")
            Txt.Visible = toggleselectedon
            Txt.From = Vector2.new(workspace.CurrentCamera.ViewportSize.X /2, workspace.CurrentCamera.ViewportSize.Y /1 )
            Txt.To = Vector2.new(vc.X, vc.Y)
            Txt.Color = Color3.new(1,0,0)
            Txt.Thickness = 2
            if NotObstructing(selectedplayer.Character.HumanoidRootPart.Position,{game.Players.LocalPlayer.Character, selectedplayer.Character}) then
               Txt.Color = Color3.new(0,1,0)
            end
             task.wait()
            Txt:Destroy()
        end
    end
end)


Inject()

local MainPanel = Instance.new("Frame")
MainPanel.Size = UDim2.new(0.5, 0, 0.7, 0)
MainPanel.Position = UDim2.new(workspace.Camera.ViewportSize /2)
MainPanel.BackgroundColor3 = Color3.new(0,0,0)
MainPanel.BorderColor3 = Color3.new(0, 0, 0)
MainPanel.BorderSizePixel = 1
MainPanel.Active = true
MainPanel.BackgroundTransparency = 0 
MainPanel.Draggable = true
MainPanel.Parent = gui

local PanelToogle = Instance.new("TextButton")
PanelToogle.Size = UDim2.new(0.05, 0, 0.1, 0)
PanelToogle.Position = UDim2.new(0.5, 0, 0.5, 0)
PanelToogle.BackgroundColor3 = Color3.new(0, 0, 0)
PanelToogle.BorderColor3 = Color3.new(0, 0, 0)
PanelToogle.BorderSizePixel = 1
PanelToogle.Text = "Panel"
PanelToogle.BackgroundTransparency = 0 
PanelToogle.TextColor3 = Color3.new(255, 255, 255)
PanelToogle.Font = Enum.Font.Code
PanelToogle.Parent = gui
PanelToogle.Draggable = true
PanelToogle.TextScaled = true
PanelToogle.MouseButton1Click:Connect(function()
    MainPanel.Visible = not MainPanel.Visible
end)
local cornaer = Instance.new("UICorner")
cornaer.CornerRadius = UDim.new(0, 15)
cornaer.Parent = PanelToogle

-- typo final boss lol


local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(0.3, 0, 0.2, 0)
Title.Position = UDim2.new(0.0, 0, 0.0, 0)
Title.BackgroundColor3 = Color3.new(0, 0, 0)
Title.BorderColor3 = Color3.new(0, 0, 0)
Title.BorderSizePixel = 1
Title.Text = "N0ta's Admin Panel | V1"
Title.BackgroundTransparency = 0 
Title.TextColor3 = Color3.new(255, 255, 255)
Title.Font = Enum.Font.SourceSans
Title.Parent = MainPanel
Title.TextSize = 24

local UserImage = Instance.new("ImageButton")
UserImage.Size = UDim2.new(0.15, 0, 0.2, 0)
UserImage.Position = UDim2.new(0.02, 0, 0.2, 0)
UserImage.BackgroundColor3 = Color3.new(0, 0, 0)
UserImage.ImageColor3 = Color3.new(1, 1, 1)
UserImage.Image = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. selectedplayer.UserId .. "&width=150&height=150&format=png"
UserImage.ImageTransparency = 0
UserImage.Parent = MainPanel


UserImage.BackgroundTransparency = 1

local Info = Instance.new("TextLabel")
Info.Size = UDim2.new(0.3, 0, 0.2, 0)
Info.Position = UDim2.new(0.23, 0, 0.15, 0)
Info.BackgroundColor3 = Color3.new(0, 0, 0)
Info.BorderColor3 = Color3.new(0, 0, 0)
Info.BorderSizePixel = 1
Info.Text = "User: \n UID: "
Info.BackgroundTransparency = 1
Info.TextColor3 = Color3.new(255, 255, 255)
Info.Font = Enum.Font.SourceSans
Info.Parent = MainPanel
Info.TextSize = 30

local PLRSFrame = Instance.new("ScrollingFrame")
PLRSFrame.Size = UDim2.new(0.3, 0, 0.9, 0)
PLRSFrame.Position = UDim2.new(0.7, 0, 0.1, 0)
PLRSFrame.BackgroundColor3 = Color3.fromRGB(30,30,30)
PLRSFrame.BorderColor3 = Color3.fromRGB(255,255,255)
PLRSFrame.BorderSizePixel = 1
PLRSFrame.Parent = MainPanel


PLRSFrame.BackgroundTransparency = 0 

local UserList = Instance.new("UIListLayout")
UserList.HorizontalAlignment = Enum.HorizontalAlignment.Left
UserList.SortOrder = Enum.SortOrder.LayoutOrder
UserList.Padding = UDim.new(0, 7)
UserList.Parent = PLRSFrame

local function Playerbt(plrname,callback)

local PlrButton = Instance.new("TextButton")
PlrButton.Name = plrname
PlrButton.Size = UDim2.new(1, 0, 0.07, 0)
PlrButton.Position = UDim2.new(0.5, 0, 0.5, 0)
PlrButton.BackgroundColor3 = Color3.new(0, 0, 0)
PlrButton.BorderColor3 = Color3.new(1,1,1)
PlrButton.BorderSizePixel = 1
PlrButton.Text = plrname
PlrButton.BackgroundTransparency = 0 
PlrButton.TextColor3 = Color3.new(255, 255, 255)
PlrButton.Font = Enum.Font.SourceSansBold
PlrButton.Parent = PLRSFrame
PlrButton.TextSize = 20

PlrButton.MouseButton1Click:Connect(callback)
return PlrButton
end
function delpbt(UserName)
    if PLRSFrame:FindFirstChild(UserName) then
       PLRSFrame:FindFirstChild(UserName):Destroy()
   end
end

Players.PlayerAdded:Connect(function(player)
        Playerbt(player.Name,function() 
        selectedplayer = player; 
        UserImage.Image = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. player.UserId .. "&width=150&height=150&format=png"
        Info.Text = "Name: "..player.Name.."\n UID: "..tostring(player.UserId)
    end)
end)

Players.PlayerRemoving:Connect(function(player)
    delpbt(player.Name)
end)

for _, v in pairs(Players:GetPlayers()) do
    Playerbt(v.Name,function() 
        selectedplayer = v; 
        UserImage.Image = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. v.UserId .. "&width=150&height=150&format=png"
        Info.Text = "Name: "..v.Name.."\n UID: "..tostring(v.UserId) 
    end)
end







local CmdsSF = Instance.new("ScrollingFrame")
CmdsSF.Size = UDim2.new(0.7, 0, 0.5, 0)
CmdsSF.Position = UDim2.new(0.0, 0, 0.5, 0)
CmdsSF.BackgroundColor3 = Color3.fromRGB(30,30,30)
CmdsSF.BorderColor3 = Color3.new(1,1,1)
CmdsSF.BorderSizePixel = 1
CmdsSF.Parent = MainPanel

CmdsSF.BackgroundTransparency = 0 


local function newcommandbt(Text,callback)

local CMDBt = Instance.new("TextButton")
CMDBt.Size = UDim2.new(0.4, 0, 0.05, 0)
CMDBt.Position = UDim2.new(0.5, 0, 0.5, 0)
CMDBt.BackgroundColor3 = Color3.new(0, 0, 0)
CMDBt.BorderColor3 = Color3.new(0, 0, 0)
CMDBt.BorderSizePixel = 1
CMDBt.Text = Text
CMDBt.BackgroundTransparency = 0 
CMDBt.TextColor3 = Color3.new(255, 255, 255)
CMDBt.Font = Enum.Font.SourceSansBold
CMDBt.Parent = CmdsSF
CMDBt.TextScaled = true
CMDBt.MouseButton1Click:Connect(callback)
end

local CUIL = Instance.new("UIGridLayout")
CUIL.HorizontalAlignment = Enum.HorizontalAlignment.Left
CUIL.CellSize = UDim2.new(0, 110, 0, 45) 
CUIL.CellPadding = UDim2.new(0, 8, 0, 8)
CUIL.SortOrder = Enum.SortOrder.LayoutOrder
CUIL.Parent = CmdsSF



newcommandbt("Kick", function()
    if backdoor ~= nil then
        backdoor:FireServer(selectedplayer)
    end
end)



newcommandbt("Kill", function()
    if backdoor ~= nil then
        backdoor:FireServer(workspace:FindFirstChild(selectedplayer.Name):FindFirstChild("Head"))
    end
end)

newcommandbt("Teleport To", function()
        game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = workspace:FindFirstChild(selectedplayer.Name):FindFirstChild("HumanoidRootPart").CFrame
end)

newcommandbt("Tracer Player", function()
    toggleselectedon = not toggleselectedon
end)


newcommandbt("No Humanoid", function()
    if backdoor ~= nil then
        backdoor:FireServer(workspace:FindFirstChild(selectedplayer.Name):FindFirstChild("Humanoid"))
    end
end)



































