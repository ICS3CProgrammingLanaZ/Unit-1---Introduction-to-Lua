--hide the status bar
display.setStatusBar(display.HiddenStatusBar)
--sets the background colour
display.setDefault("background", 6/255, 46/255, 124/255)
---VARIABLES FOR THE TIMER
local totalSeconds = 5
local secondsLeft = 5
local clockText
local countDownTimer
local lives = 3
local heart1
local heart2
local heart3
local heart4
local questionObject
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

--***ADD LOCAL VARIABLE FOR: INCORRECT OBJECT, POINTS
--------------------------------------------------------
-- LOCAL FUNCTIONS
--------------------------------------------------------
local function UpdateTime()
 -- decrement the number of sounds left
 secondsLeft = secondsLeft - 1
 --display the number of seconds left in the
 --clock object
 clockText.text = secondsLeft .. ""
 if(secondsLeft == 0 ) then
  --reset the  number of seconds left 
  secondsLeft = totalSeconds
  lives = lives - 1
  --***IF THERE ARE NO LIVES LEFT, PLAY A LOSE SOUND,
  --SHOW A "YOU LOSE IMAGE AND CANCEL THE TIMER, REMOVE
  --REMOVE THE THIRD HEART BY MAKIND IT INVISIBLE
  if (lives == 2) then
   heart2.isVisible = false
  elseif (lives == 1) then
   heart1.isVisible = false
  end
  --*** CALL THE FUNCTION TO ASK A NEW QUESTION
 end
end

--function that calls the timer
local function StartTime()
 -- create a countdown timer that loops infinitely
 countDownTimer = timer.performWithDelay( 1000, UpdateTime, 0)
end
------------------------------------------------------------
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
--------------------------------------------------------
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
			heart4.isVisible = false 
			wrongSoundChannel = audio.play(wrongSound)
			incorrectObject.isVisible = true
			

			event.target.text = "" 

			
		end

	end

end


--------------------------------------------------------
-- create points box adn make it visible
pointsTextObject = display.newText( "Points = ".. numberPoints, 230, 100, nil, 70 )
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

------------------------------------------------------------
--OBJECT CREATION
------------------------------------------------------------
--create the lives to display on the screen
heart1 = display.newImageRect("Images/heart.png", 100,100)
heart1.x = display.contentWidth * 7 / 8
heart1.y = display.contentHeight * 1 / 7
heart2 = display.newImageRect("Images/heart.png", 100, 100)
heart2.x = display.contentWidth * 6 / 8
heart2.y = display.contentHeight * 1 / 7
heart3 = display.newImageRect("Images/heart.png", 100, 100)
heart3.x = display.contentWidth * 5 / 8
heart3.y = display.contentHeight * 1 / 7
heart4 = display.newImageRect("Images/heart.png", 100, 100)
heart4.x = display.contentWidth * 4 / 8
heart4.y = display.contentHeight * 1 / 7
