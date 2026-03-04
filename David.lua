-- SCRIPT PARA DELTA EXECUTOR - PANEL DE COMPRA VIP CON BOTÓN CUADRADO NEGRO
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "PanelCompraVIP"
gui.Parent = player.PlayerGui

-- CONFIGURACIÓN
local CONFIG = {
    NOMBRE_MONEDA = "Robux",
    MONEDA_INICIAL = 5875,
    PRECIO_VIP = 85,
    ID_IMAGEN_VIP = "rbxassetid://TU_ID_DE_IMAGEN_AQUI"
}

-- DATOS DEL JUGADOR
local datosJugador = Instance.new("Folder")
datosJugador.Name = "DatosJugador"
datosJugador.Parent = player
local monedas = Instance.new("IntValue", datosJugador)
monedas.Name = CONFIG.NOMBRE_MONEDA
monedas.Value = CONFIG.MONEDA_INICIAL

-- GUI MONEDAS (SUP DERECHA)
local contenedorMonedas = Instance.new("Frame", gui)
contenedorMonedas.Size = UDim2.new(0,180,0,50)
contenedorMonedas.Position = UDim2.new(1,-190,0,10)
contenedorMonedas.BackgroundColor3 = Color3.new(.15,.15,.15)

local iconoMoneda = Instance.new("ImageLabel", contenedorMonedas)
iconoMoneda.Image = "rbxassetid://1070099777"
iconoMoneda.Size = UDim2.new(0,35,0,35)
iconoMoneda.Position = UDim2.new(0,7,0,7)
iconoMoneda.BackgroundTransparency = 1

local textoMonedas = Instance.new("TextLabel", contenedorMonedas)
textoMonedas.Size = UDim2.new(0,130,0,50)
textoMonedas.Position = UDim2.new(0,45,0,0)
textoMonedas.Text = CONFIG.NOMBRE_MONEDA..": "..monedas.Value
textoMonedas.TextSize = 22
textoMonedas.TextColor3 = Color3.new(1,1,1)
textoMonedas.BackgroundTransparency = 1

-- ACTUALIZAR MONEDAS
monedas.Changed:Connect(function()
    textoMonedas.Text = CONFIG.NOMBRE_MONEDA..": "..monedas.Value
end)

-- PANEL DE COMPRA
local panelCompra = Instance.new("Frame", gui)
panelCompra.Size = UDim2.new(0,550,0,380)
panelCompra.Position = UDim2.new(.5,-275,.5,-190)
panelCompra.BackgroundColor3 = Color3.new(.08,.08,.08)
panelCompra.BorderColor3 = Color3.new(.6,.4,.1)
panelCompra.Visible = false

-- IMAGEN VIP
local imagenVIP = Instance.new("ImageLabel", panelCompra)
imagenVIP.Size = UDim2.new(0,480,0,220)
imagenVIP.Position = UDim2.new(0,35,0,50)
imagenVIP.Image = CONFIG.ID_IMAGEN_VIP
imagenVIP.BackgroundTransparency = 1
imagenVIP.ScaleType = Enum.ScaleType.Fit

-- TÍTULO Y PRECIO
local tituloPanel = Instance.new("TextLabel", panelCompra)
tituloPanel.Size = UDim2.new(1,0,0,40)
tituloPanel.Text = "PAQUETE VIP"
tituloPanel.TextSize = 24
tituloPanel.BackgroundColor3 = Color3.new(.12,.12,.12)
tituloPanel.TextColor3 = Color3.new(1,1,1)

local textoPrecio = Instance.new("TextLabel", panelCompra)
textoPrecio.Position = UDim2.new(0,0,1,280)
textoPrecio.Text = "PRECIO: "..CONFIG.PRECIO_VIP.." "..CONFIG.NOMBRE_MONEDA
textoPrecio.TextSize = 20
textoPrecio.TextColor3 = Color3.new(1,1,1)
textoPrecio.BackgroundTransparency = 1

-- BOTÓN COMPRAR
local botonComprar = Instance.new("TextButton", panelCompra)
botonComprar.Size = UDim2.new(0,200,0,50)
botonComprar.Position = UDim2.new(.5,-100,1,-50)
botonComprar.Text = "COMPRAR AHORA"
botonComprar.BackgroundColor3 = Color3.new(.1,.6,.2)
botonComprar.TextColor3 = Color3.new(1,1,1)

-- BOTÓN CERRAR PANEL
local botonCerrar = Instance.new("TextButton", panelCompra)
botonCerrar.Size = UDim2.new(0,30,0,30)
botonCerrar.Position = UDim2.new(1,-35,0,5)
botonCerrar.Text = "X"
botonCerrar.BackgroundColor3 = Color3.new(.8,.2,.2)
botonCerrar.TextColor3 = Color3.new(1,1,1)
botonCerrar.MouseButton1Click:Connect(function()
    panelCompra.Visible = false
end)

-- BOTÓN ABRIR/CERRAR (CUADRO NEGRO PEQUEÑO)
local botonToggle = Instance.new("TextButton", gui)
botonToggle.Size = UDim2.new(0,40,0,40) -- Tamaño pequeño
botonToggle.Position = UDim2.new(0,15,1,-60) -- Esquina inf izquierda
botonToggle.BackgroundColor3 = Color3.new(0,0,0) -- Cuadro negro
botonToggle.Text = "" -- Sin texto, solo cuadro
botonToggle.BorderColor3 = Color3.new(.3,.3,.3)

-- FUNCIÓN ABRIR/CERRAR
botonToggle.MouseButton1Click:Connect(function()
    panelCompra.Visible = not panelCompra.Visible
end)
