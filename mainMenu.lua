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
print( display.pixelWidth / display.actualContentWidth )
function scene:create( event )
	local sceneGroup = self.view

	-- Called when the scene's view does not exist.
	-- 
	-- INSERT code here to initialize the scene
	-- e.g. add display objects to 'sceneGroup', add touch listeners, etc.
	local sceneGroup = self.view
	local function onSystemEvent( event )
        if( event.type == "applicationExit" ) then              
            db:close()
        end
    end
   
	local function onPressDomestic( event )
		if event.phase == "ended" then
		
		composer.gotoScene( "gridDomesticMenu", "slideLeft", 800  )
		
		return true
		end
	end

	local function onPressFarm( event )
		if event.phase == "ended" then
		
		composer.gotoScene( "gridFarmMenu", "slideLeft", 800  )
		
		return true
		end
	end

	local function onPressWild( event )
		if event.phase == "ended" then
		
		composer.gotoScene( "gridWildMenu", "slideLeft", 800  )
		
		return true
		end
	end


	local function onPressMarine( event )
		if event.phase == "ended" then
		
		composer.gotoScene( "gridMarineMenu", "slideLeft", 800  )
		
		return true
		end
	end




	local domesticButton = widget.newButton
	{
		width =  display.viewableContentWidth - display.viewableContentWidth/32,
		height = display.viewableContentHeight/5,
		defaultFile = "categoryDom.png",
		overFile = "categoryDomOff.png",
		onEvent = onPressDomestic	
	}

	domesticButton.x = display.contentCenterX
	domesticButton.y =  display.viewableContentHeight/8

	sceneGroup:insert(domesticButton)


	local farmButton = widget.newButton
	{
		width =  display.viewableContentWidth - display.viewableContentWidth/32,
		height = display.viewableContentHeight/5,
		defaultFile = "categoryFarm.png",
		overFile = "categoryFarmOff.png",
		onEvent = onPressFarm	
	}

	farmButton.x = display.contentCenterX
	farmButton.y =  display.viewableContentHeight/8 + domesticButton.y*2

	sceneGroup:insert(farmButton)

	local wildButton = widget.newButton
	{
		x = display.contentCenterX,
		y = display.viewableContentHeight/8 + domesticButton.y*4,
		width =  display.viewableContentWidth - display.viewableContentWidth/32,
		height = display.viewableContentHeight/5,
		defaultFile = "categoryWildOn.png",
		overFile = "categoryWildOff.png",
		onEvent = onPressWild
	}

	sceneGroup:insert(wildButton)

	local marineButton = widget.newButton
	{
		x = display.contentCenterX,
		y = display.viewableContentHeight/8 + domesticButton.y*4,
		width =  display.viewableContentWidth - display.viewableContentWidth/32,
		height = display.viewableContentHeight/5,
		defaultFile = "categoryMarineOn.png",
		overFile = "categoryMarineOff.png",
		onEvent = onPressMarine
	}

	sceneGroup:insert(marineButton)




end



function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		composer.removeScene("splash")
		--composer.removeScene( "dogPage" )
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then
		composer.removeScene( "dogPage" )		
		composer.removeScene("catPage")	
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
		-- Called when the scene is on screen and is about to move off screen
		--
		-- INSERT code here to pause the scene
		-- e.g. stop timers, stop animation, unload sounds, etc.)
	elseif phase == "did" then		
		-- Called when the scene is now off screen
		--local showMem = function()
			--image:addEventListener( "touch", image )					
		--end
	end	
end


function scene:destroy( event )
	local sceneGroup = self.view
	
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