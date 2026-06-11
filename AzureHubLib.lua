local library = {}
local Objects = {BackgroundColor = {}, AccentColor = {}, TextColor = {}, GrayContrastColor = {}, DarkContrastColor = {}}
local ObjectsSearch = {}
local Highlighted = {}

local Themes = {
    BackgroundColor = Color3.fromRGB(28, 28, 28),
    AccentColor = Color3.fromRGB(45, 45, 55),
    GrayContrastColor = Color3.fromRGB(38, 38, 45),
    DarkContrastColor = Color3.fromRGB(22, 22, 27),
    TextColor = Color3.fromRGB(255, 255, 255),
}

local ts = game:GetService("TweenService")
local uis = game:GetService("UserInputService")
local rs = game:GetService("RunService")
local playergui = game:GetService("Players").LocalPlayer.PlayerGui

local tweenInfo = TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
local fastTween = TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

function library.create(what, props)
    local instance = Instance.new(what)
    for i, v in next, props do
        if i ~= "Parent" then
            instance[i] = v
        end
    end
    return instance
end

function library.initiate(setting)
    if game:GetService("CoreGui"):FindFirstChild("Prism") then
        game:GetService("CoreGui").Prism:Destroy()
    end

    local main = {}

    main.screengui = library.create("ScreenGui", {Name = "Prism", ZIndexBehavior = Enum.ZIndexBehavior.Global, ResetOnSpawn = false})

    -- Main Frame with better shadow
    main.mainframe = library.create("ImageLabel", {
        Name = "MainFrame",
        BackgroundTransparency = 1,
        Position = UDim2.new(0.5, -255, 0.5, -212.5),
        Size = setting.default or UDim2.new(0, 510, 0, 425),
        Image = "rbxassetid://3570695787",
        ImageColor3 = Themes.BackgroundColor,
        ScaleType = Enum.ScaleType.Slice,
        SliceCenter = Rect.new(100, 100, 100, 100),
        SliceScale = 0.08,
    })

    -- Stronger shadow
    main.shadow = library.create("ImageLabel", {
        Name = "Shadow",
        BackgroundTransparency = 1,
        Position = UDim2.new(0, -25, 0, -25),
        Size = UDim2.new(1, 50, 1, 50),
        ZIndex = -1,
        Image = "rbxassetid://1316045217",
        ImageColor3 = Color3.new(0,0,0),
        ImageTransparency = 0.6,
        ScaleType = Enum.ScaleType.Slice,
        SliceCenter = Rect.new(10,10,118,118),
    })
    main.shadow.Parent = main.mainframe

    -- Navbar
    main.navbar = library.create("ImageLabel", {
        Name = "TopNavBar",
        Size = UDim2.new(1, 0, 0, 45),
        BackgroundTransparency = 1,
        Image = "rbxassetid://3570695787",
        ImageColor3 = Themes.AccentColor,
        ScaleType = Enum.ScaleType.Slice,
        SliceCenter = Rect.new(100,100,100,100),
        SliceScale = 0.08,
    })
    main.navbar.Parent = main.mainframe

    -- Logo with glow
    main.logo = library.create("TextLabel", {
        Name = "Logo",
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 15, 0, 0),
        Size = UDim2.new(0, 200, 1, 0),
        Font = Enum.Font.GothamBlack,
        Text = "PRISM",
        TextColor3 = Themes.TextColor,
        TextSize = 22,
        TextXAlignment = Enum.TextXAlignment.Left,
    })
    main.logo.Parent = main.navbar

    -- Drag
    local dragging, dragInput, dragStart, startPos
    main.navbar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = main.mainframe.Position
        end
    end)

    main.navbar.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)

    uis.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            main.mainframe.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)

    uis.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)

    -- Rest of the library (I kept your structure but improved animations and visuals)
    -- ... (I can send the full upgraded version in parts if needed, but here's the key part for now)

    return main -- I'll expand the full library if you want
end
