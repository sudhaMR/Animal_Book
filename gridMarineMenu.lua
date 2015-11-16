----------------------------------------------------------------------------------
--
-- scenetemplate.lua
--
----------------------------------------------------------------------------------
local widget = require "widget"
local composer = require( "composer" )
local scene = composer.newScene()
require "sqlite3"
---------------------------------------------------------------------------------

function scene:create( event )
	local sceneGroup = self.view

local background = display.newImage( "ocean.png" )
background.x = display.contentCenterX
background.y = display.contentCenterY
background.width = display.viewableContentWidth
background.height = display.viewableContentHeight
sceneGroup:insert(background)
	
	local scrollView = widget.newScrollView
	{
    left = 0,
    top = display.viewableContentHeight/54,
    width = display.contentWidth,
    height = display.contentHeight,
    bottomPadding = 50,
    id = "onBottom",
    horizontalScrollDisabled = true,
    verticalScrollDisabled = false,
    --backgroundColor = { 1, 0.7529, 0.321 }
	}

	scrollView:insert(background)


	local function onSystemEvent( event )
        if( event.type == "applicationExit" ) then              
            db:close()
        end
    end
   

    local titleBar = widget.newButton
    {
    width =  display.contentCenterY*1.5,
    height = display.viewableContentHeight/8,
    defaultFile = "marineTopBar.png",
    overFile = "marineTopBar.png"
	}

	titleBar.x = display.contentCenterX
	titleBar.y = display.viewableContentHeight/16

	sceneGroup:insert(titleBar)
	scrollView:insert(titleBar)
	local function onPressBack( event )
		if event.phase == "ended" then
		
		composer.gotoScene( "mainMenu", "slideLeft", 800  )
		
		return true
		end
	end

	local backButton = widget.newButton
	{
	width = display.viewableContentWidth/8,
	height = display.viewableContentWidth/8,
	defaultFile = "backButtonPurple.png",
	overFile = "backButtonoutline.png",
	onEvent = onPressBack
	}

	backButton.x = display.viewableContentWidth/16
	backButton.y = display.viewableContentHeight/16

	sceneGroup:insert(backButton)
	scrollView:insert(backButton)
---------------------------------------------------------------------------------------------------------------------------------------

	local function onPressDolphin( event )
		if event.phase == "ended" then
		
		composer.gotoScene( "dolphinPage", "slideRight", 800  )
		
		return true
		end
	end

	local  dolphinButton = widget.newButton
	{
		width =  display.viewableContentWidth/2,
		height  = display.viewableContentWidth/2,
		defaultFile = "dolphinTile.png",
		overFile = "dolphinTile.png",
		onEvent = onPressDolphin	
	}

	dolphinButton.x = titleBar.x/2
	dolphinButton.y = display.viewableContentHeight/3

	sceneGroup:insert(dolphinButton)
	scrollView:insert(dolphinButton)
---------------------------------------------------------------------------------------------------------------------------------------
	local function onPressTurtle( event )
		if event.phase == "ended" then
		
		composer.gotoScene( "turtlePage", "slideRight", 800  )
		
		return true
		end
	end
	turtleButton = widget.newButton
	{
		width = display.viewableContentWidth/2,
		height = display.viewableContentWidth/2,
		defaultFile = "turtleTile.png",
		overFile = "turtleTile.png",
		onEvent = onPressTurtle	
	}

	turtleButton.x = titleBar.x + dolphinButton.x
	turtleButton.y =  display.viewableContentHeight/3
	sceneGroup:insert(turtleButton)
	scrollView:insert(turtleButton)
---------------------------------------------------------------------------------------------------------------------------------------
local function onPressSeahrose( event )
		if event.phase == "ended" then
		
		composer.gotoScene( "seahorsePage", "slideRight", 800  )
		
		return true
		end
	end

	local seahorseButton = widget.newButton
	{
		width = display.viewableContentWidth/2,
		height = display.viewableContentWidth/2,
		defaultFile = "seahorseTile.png",
		overFile = "seahorseTile.png",
		onEvent = onPressSeahrose	
	}

	seahorseButton.x = titleBar.x/2 
	seahorseButton.y =  display.viewableContentHeight/3 + dolphinButton.y
	sceneGroup:insert(seahorseButton)
	scrollView:insert(seahorseButton)
---------------------------------------------------------------------------------------------------------------------------------------

local function onPressOctopus( event )
		if event.phase == "ended" then
		
		composer.gotoScene( "octopusPage", "slideRight", 800  )
		
		return true
		end
	end

	local octopusButton = widget.newButton
	{
		width = display.viewableContentWidth/2,
		height = display.viewableContentWidth/2,
		defaultFile = "octopusTile.png",
		overFile = "octopusTile.png",
		onEvent = onPressOctopus
	}

	octopusButton.x = titleBar.x + dolphinButton.x
	octopusButton.y =  display.viewableContentHeight/3 + dolphinButton.y
	sceneGroup:insert(octopusButton)
	scrollView:insert(octopusButton)

--[[
	local function onPressBear( event )
		if event.phase == "ended" then
		
		composer.gotoScene( "bearPage", "slideRight", 800  )
		
		return true
		end
	end

	local bearButton = widget.newButton
	{
		width = display.viewableContentWidth/2,
		height = display.viewableContentWidth/2,
		defaultFile = "bearTile.png",
		overFile = "bearTile.png",
		onEvent = onPressBear
	}

	bearButton.x = titleBar.x/2
	bearButton.y =  display.viewableContentHeight/3 + lionButton.y*2
	sceneGroup:insert(bearButton)
	scrollView:insert(bearButton)



	local function onPressDeer( event )
		if event.phase == "ended" then
		
		composer.gotoScene( "deerPage", "slideRight", 800  )
		
		return true
		end
	end

	local deerButton = widget.newButton
	{
		width = display.viewableContentWidth/2,
		height = display.viewableContentWidth/2,
		defaultFile = "deerTile.png",
		overFile = "deerTile.png",
		onEvent = onPressDeer
	}

	deerButton.x = titleBar.x + lionButton.x
	deerButton.y =  display.viewableContentHeight/3 + lionButton.y*2
	sceneGroup:insert(deerButton)
	scrollView:insert(deerButton)



	local function onPressGiraffe( event )
		if event.phase == "ended" then
		
		composer.gotoScene( "giraffePage", "slideRight", 800  )
		
		return true
		end
	end

	local giraffeButton = widget.newButton
	{
		width = display.viewableContentWidth/2,
		height = display.viewableContentWidth/2,
		defaultFile = "giraffeTile.png",
		overFile = "giraffeTile.png",
		onEvent = onPressGiraffe
	}

	giraffeButton.x = titleBar.x/2
	giraffeButton.y =  display.viewableContentHeight/3 + lionButton.y*3
	sceneGroup:insert(giraffeButton)
	scrollView:insert(giraffeButton)



	local function onPressRhinoceros( event )
		if event.phase == "ended" then
		
		composer.gotoScene( "rhinocerosPage", "slideRight", 800  )
		
		return true
		end
	end

	local rhinocerosButton = widget.newButton
	{
		width = display.viewableContentWidth/2,
		height = display.viewableContentWidth/2,
		defaultFile = "rhinocerosTile.png",
		overFile = "rhinocerosTile.png",
		onEvent = onPressRhinoceros
	}

	rhinocerosButton.x = titleBar.x + lionButton.x
	rhinocerosButton.y =  display.viewableContentHeight/3 + lionButton.y*3
	sceneGroup:insert(rhinocerosButton)
	scrollView:insert(rhinocerosButton)


	local function onPressHippopotamus( event )
		if event.phase == "ended" then
		
		composer.gotoScene( "hippopotamusPage", "slideRight", 800  )
		
		return true
		end
	end

	local hippopotamusButton = widget.newButton
	{
		width = display.viewableContentWidth/2,
		height = display.viewableContentWidth/2,
		defaultFile = "hippopotamusTile.png",
		overFile = "hippopotamusTile.png",
		onEvent = onPressHippopotamus
	}

	hippopotamusButton.x = titleBar.x/2
	hippopotamusButton.y =  display.viewableContentHeight/3 + lionButton.y*4
	sceneGroup:insert(hippopotamusButton)
	scrollView:insert(hippopotamusButton)


]]--

	-- Called when the scene's view does not exist.
	-- 
	-- INSERT code here to initialize the scene
	-- e.g. add display objects to 'sceneGroup', add touch listeners, etc.
	sceneGroup:insert(scrollView)
end


function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		--composer.removeScene("dogPage",false)
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then
		composer.removeScene( "mainMenu" )
		composer.removeScene("lionPage")
		composer.removeScene("monkeyPage")
		-- Called when the scene is now on screen
		-- 
		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc.
	end	
end

function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if event.phase == "will" then
		--composer.removeScene("dogPage",false)
		-- Called when the scene is on screen and is about to move off screen
		--
		-- INSERT code here to pause the scene
		-- e.g. stop timers, stop animation, unload sounds, etc.)
	elseif phase == "did" then		
		-- Called when the scene is now off screen
	end	
end


function scene:destroy( event )
	local sceneGroup = self.view
	--composer.removeScene("dogPage",true)
	-- Called prior to the removal of scene's "view" (sceneGroup)
	-- 
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

---------------------------------------------------------------------------------

return scene