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
    backgroundColor = { 1, 0.7529, 0.321 }
	}


	local function onSystemEvent( event )
        if( event.type == "applicationExit" ) then              
            db:close()
        end
    end
   

    local titleBar = widget.newButton
    {
    width =  display.contentCenterY*1.5,
    height = display.viewableContentHeight/8,
    defaultFile = "farmBar.png",
    overFile = "farmBar.png"
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

	local function onPressCow( event )
		if event.phase == "ended" then
		
		composer.gotoScene( "cowPage", "slideRight", 800  )
		
		return true
		end
	end

	local cowButton = widget.newButton
	{
		width =  display.viewableContentWidth/2,
		height  = display.viewableContentWidth/2,
		defaultFile = "cowTile.png",
		overFile = "cowTile.png",
		onEvent = onPressCow	
	}

	cowButton.x = titleBar.x/2
	cowButton.y = display.viewableContentHeight/3

	sceneGroup:insert(cowButton)
	scrollView:insert(cowButton)
---------------------------------------------------------------------------------------------------------------------------------------
	local function onPressGoat( event )
		if event.phase == "ended" then
		
		composer.gotoScene( "goatPage", "slideRight", 800  )
		
		return true
		end
	end

	local goatButton = widget.newButton
	{
		width = display.viewableContentWidth/2,
		height = display.viewableContentWidth/2,
		defaultFile = "goatTile.png",
		overFile = "goatTile.png",
		onEvent = onPressGoat	
	}

	goatButton.x = titleBar.x + cowButton.x
	goatButton.y =  display.viewableContentHeight/3
	sceneGroup:insert(goatButton)
	scrollView:insert(goatButton)
---------------------------------------------------------------------------------------------------------------------------------------
local function onPressSheep( event )
		if event.phase == "ended" then
		
		composer.gotoScene( "sheepPage", "slideRight", 800  )
		
		return true
		end
	end

	local sheepButton = widget.newButton
	{
		width = display.viewableContentWidth/2,
		height = display.viewableContentWidth/2,
		defaultFile = "sheepTile.png",
		overFile = "sheepTile.png",
		onEvent = onPressSheep	
	}

	sheepButton.x = titleBar.x/2 
	sheepButton.y =  display.viewableContentHeight/3 + cowButton.y
	sceneGroup:insert(sheepButton)
	scrollView:insert(sheepButton)
---------------------------------------------------------------------------------------------------------------------------------------

local function onPressPig( event )
		if event.phase == "ended" then
		
		composer.gotoScene( "pigPage", "slideRight", 800  )
		
		return true
		end
	end

	local pigButton = widget.newButton
	{
		width = display.viewableContentWidth/2,
		height = display.viewableContentWidth/2,
		defaultFile = "pigTile.png",
		overFile = "pigTile.png",
		onEvent = onPressPig
	}

	pigButton.x = titleBar.x + cowButton.x
	pigButton.y =  display.viewableContentHeight/3 + cowButton.y
	sceneGroup:insert(pigButton)
	scrollView:insert(pigButton)

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
		composer.removeScene("cowPage")
		composer.removeScene("pigPage")
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