-----------------------------------------------------------------------------------------
--Name: Lana ZahrEddin
--Course:ICS20/3C
--This program displays Hello, World on the iPad simulater and "Helloooooooooo!" to the command
--terminal.
-----------------------------------------------------------------------------------------

-- Your code here
--print "Hello, World" to the command terminal
print ("***Helloooooooooo!")
print ("***This is awsome!")

--hide the status bar 
display.setStatusBar(display.HiddenStatusBar)

--sets the background colour 
display.setDefault("background" , 20/255, 255/255, 247/255)

-- creat a local variable 
local textObject

--displays text on the screen at position X=300 and y=400 with
--a default font style and font size of 80
textObject = display.newText("Hello, Guysss!" , 300, 400, nil, 80 )

--sets the color of the text
textObject:setTextColor(83/255, 104/255, 103/255)

-- creat a local variable 
local textObjectSignature

--displays text on the screen at position X=500 and y=500 with
--a default font style and font size of 40
textObjectSignature = display.newText("by Lana" , 500, 500, nil, 40)