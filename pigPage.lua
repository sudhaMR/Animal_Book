----------------------------------------------------------------------------------
--
-- scenetemplate.lua
--
----------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()
local widget = require("widget")
require "sqlite3"
local db = sqlite3.open_memory()

local path = system.pathForFile("infoFarm.db", system.DocumentsDirectory)
db = sqlite3.open( path ) 

---------------------------------------------------------------------------------

function scene:create( event )
	local sceneGroup = self.view

local scrollScreen = widget.newScrollView
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

sceneGroup:insert(scrollScreen)


local function onPressBack( self,event )	
		composer.gotoScene( "gridFarmMenu", "slideLeft", 800  )
    composer.removeScene("pigPage")
		
		return true
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
  backButton.y = display.viewableContentHeight/18

	sceneGroup:insert(backButton)  
  scrollScreen:insert(backButton)

     for row in db:nrows("SELECT description,image FROM farmanimalInfo WHERE id = '4'") do

     local pigImage = display.newImage(row.image)
      pigImage.x = display.contentCenterX       
      pigImage.y =  display.viewableContentHeight/1.8
      pigImage.height = display.viewableContentWidth -  display.viewableContentWidth/16
      pigImage.width = display.viewableContentWidth -  2*display.viewableContentWidth/16
      sceneGroup:insert(pigImage)
      scrollScreen:insert(pigImage)	

     

      local options =
       {
        text = row.description, 
        x = display.contentCenterX ,
        y = pigImage.y + (pigImage.height/2) + (pigImage.height/4) + display.viewableContentHeight/2.7,
        width = display.viewableContentWidth - display.viewableContentWidth/8, 
        height = display.viewableContentHeight,
        font = "Verdana",
        fontSize = 20,
        align =  center
      }

      calltext = display.newText(options)
      calltext:setFillColor( 0 )            
      
      end
      
      sceneGroup:insert(calltext) 
      scrollScreen:insert(calltext)    
    --Adding image
    local options =
    {     
       width = 100,
       height = 100
    }  


local function onPressFlipBackward( event )  
    composer.gotoScene( "sheepPage", "flip", 200  )   
    return true
  end


  local flipButtonBackward = widget.newButton
  {
  width = display.viewableContentWidth/8,
  height = display.viewableContentWidth/8,
  defaultFile = "flipButtonBackward.png",
  overFile = "flipButtonBackward.png",
  onEvent = onPressFlipBackward
  }

  flipButtonBackward.x = display.viewableContentWidth - (display.viewableContentWidth/1.1)
  flipButtonBackward.y = display.viewableContentHeight/6
  sceneGroup:insert(flipButtonBackward)
  scrollScreen:insert(flipButtonBackward)


 local function onPressFlipForward( event )  
    composer.gotoScene( "cowPage", "flip", 200  )    
    return true
  end


  local flipButtonForward = widget.newButton
  {
  width = display.viewableContentWidth/8,
  height = display.viewableContentWidth/8,
  defaultFile = "flipButtonForward.png",
  overFile = "flipButtonForward.png",
  onEvent = onPressFlipForward
  }

  flipButtonForward.x = display.viewableContentWidth - (display.viewableContentWidth/12)
  flipButtonForward.y = display.viewableContentHeight/6
  sceneGroup:insert(flipButtonForward)
  scrollScreen:insert(flipButtonForward)




local function  playAudio( event )
    -- loading audio
    for row in db:nrows("SELECT audio FROM farmanimalInfo WHERE id = '4'") do
    soundFile = audio.loadSound(row.audio)
     audio.setVolume(1)
    audio.play(soundFile)    
    end
    end

--Title button
local myButton = widget.newButton
{  
    x = display.contentCenterX,
    y = display.viewableContentHeight/16,
    width =  display.viewableContentWidth/2,
    height = display.viewableContentHeight/10,
    defaultFile = "pigTitle.png",
    overFile = "pigTitle.png"
}

sceneGroup:insert(myButton)
scrollScreen:insert(myButton)
--Audio Button
local audioButton = widget.newButton
{
    width = display.viewableContentWidth/8,
    height = display.viewableContentWidth/8 ,
    defaultFile = "speaker.png",
    onEvent = playAudio   
}
sceneGroup:insert(audioButton)
scrollScreen:insert(audioButton)
audioButton.x = display.viewableContentWidth/16*16 - audioButton.x
audioButton.y = display.viewableContentHeight/18
scrollScreen:insert(sceneGroup)

--Video button

local function playVideo( event )

  media.playVideo( "rtsp://r6---sn-a5m7zu7s.c.youtube.com/CiILENy73wIaGQkL2RO5wKJewBMYDSANFEgGUgZ2aWRlb3MM/0/0/0/video.3gp", media.RemoteSource, true )  
  -- body
end

local videoButton = widget.newButton
{
    x =  display.viewableContentWidth/3,
    y =  display.viewableContentHeight/5,
    width = display.viewableContentWidth/4,
    height = display.viewableContentWidth/4 ,
    defaultFile = "videoButton.png",
    onEvent = playVideo  
}
sceneGroup:insert(videoButton)
scrollScreen:insert(videoButton)


local function  playSound( event )
    -- loading audio
    for row in db:nrows("SELECT sounds FROM farmanimalInfo WHERE id = '4'") do
    soundFile = audio.loadSound(row.sounds)
    audio.setVolume(1)
    audio.play(soundFile)    
    end
end

local soundButton = widget.newButton
{
    --x = display.viewableContentWidth - audioButton.x,
    x =  display.viewableContentWidth/1.5,
    y = display.viewableContentHeight /5,
    width = display.viewableContentWidth/4,
    height = display.viewableContentWidth/4 ,
    defaultFile = "soundButton.png",
    onEvent = playSound 
}
sceneGroup:insert(soundButton)
scrollScreen:insert(soundButton)
	-- Called when the scene's view does not exist.
	-- 
	-- INSERT code here to initialize the scene
	-- e.g. add display objects to 'sceneGroup', add touch listeners, etc.
end




function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then
    composer.removeScene( "gridMenu" )
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
  --db:close()	
		-- Called when the scene is now off screen
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