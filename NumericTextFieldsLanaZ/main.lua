--Title: Numeric Textfield
--Name: Lana ZahrEddin
--Course: ICS3C
--This program displays a math question and asks the user to answer in a numeric textfield.
--terminal.
-----------------------------------------------------------------------------------------

--hide the status bar 
display.setStatusBar(display.HiddenStatusBar)

--sets the background colour 
display.setDefault("background", 216/255, 166/255, 200/255)

--Local variables

--create local variables 
local questionObject
local correctObject
local incorrectObject
local numericField
local randomNumber1
local randomNumber2
local userAnswer
local incorrectAnswer
local correctAnswer
local pointsTextObject
local numberPoints = 0
local randomOperator
--Correct Sound
local correctSound = audio.loadSound("Sounds/correctSound.mp3")
local correctSoundChannel
--Incorrect Sound
local wrongSound = audio.loadSound("Sounds/wrongSound.mp3")
local wrongSoundChannel 
-- local functions 
local function AskQuestion()
	--generate 2 random numbers between a max. and a min. number
	randomOperator = math.random(1,3)
	randomNumber1 = math.random(10,20)
	randomNumber2 = math.random(10,20)

 
 	if (randomOperator == 1) then
 		correctAnswer = randomNumber1 + randomNumber2
	
		--create questionin text object
		questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "

	elseif (randomOperator == 2) then
	 	correctAnswer = randomNumber1 - randomNumber2

		--create questionin text object
		questionObject.text = randomNumber1 .. " - " .. randomNumber2 .. " = "

	elseif (randomOperator == 3) then
	 	correctAnswer = randomNumber1 * randomNumber2

		--create questionin text object
		questionObject.text = randomNumber1 .. " * " .. randomNumber2 .. " = "
	end	

end

local function HideCorrect()
	correctObject.isVisible = false
	AskQuestion()
end

local function HideIncorrect()
	incorrectObject.isVisible = false 
	AskQuestion()
end

local function NumericFieldListener( event )

	--User beging editing "numericfeild"
	if ( event.phase == "began" ) then

		--clear text field 
		event.target.text = "" 

	elseif event.phase == "submitted" then

		-- when the answer is submitted (enter key is pressed) set user input bto user's answer
		userAnswer = tonumber(event.target.text)

		--if the users answer and the correct answer and the correct answer are the same:
		if (userAnswer == correctAnswer) then
			correctObject.isVisible = true 
			correctSoundChannel = audio.play(correctSound)
			incorrectObject.isVisible = false
			timer.performWithDelay(2000,HideCorrect)
			numberPoints = numberPoints + 1

			event.target.text = "" 

        -- create increasing points in the text object
			 pointsTextObject.text = "Points = ".. numberPoints

		else 
			correctObject.isVisible = false 
			wrongSoundChannel = audio.play(wrongSound)
			incorrectObject.isVisible = true
			timer.performWithDelay(2000,HideIncorrect)

			event.target.text = "" 


		end
	end
end
-- create points box adn make it visible
pointsTextObject = display.newText( "Points = ".. numberPoints, 530, 100, nil, 70 )
pointsTextObject:setTextColor(3/255, 3/255, 43/255)

--object Creation 
-- display a question and sets the color 
questionObject = display.newText("", display.contentWidth/2, display.contentHeight/2, nil, 180)
questionObject:setTextColor(124/255, 116/255, 114/255)

-- create the correct  text object and make it invisible
correctObject = display.newText("Correct,YAHOOO!", display.contentWidth/2, 250, nil, 50)
correctObject:setTextColor(55/255, 42/255, 198/255)
correctObject.isVisible = false

-- create the incorrect  text object and make it invisible
incorrectObject = display.newText("NOO,incorrect!", display.contentWidth/2, 250, nil, 50)
incorrectObject:setTextColor(155/255, 2/255, 98/255)
incorrectObject.isVisible = false

-- create numeric field 

numericField = native.newTextField(display.contentWidth/2, display.contentHeight*2/3, 600, 95)
numericField.inputType = "default"

--add the event listener fo the numeric field
numericField:addEventListener( "userInput", NumericFieldListener)

-- function calls
-- call the functionto as the Question
AskQuestion()