Class=require 'class'
require 'Bird'
require 'Pipe'
require 'PipePair'
require 'StateMachine'
require 'states/BaseState'
require 'states/TitleScreenState'
require 'states/PlayState'
require 'states/ScoreState'

k=""
-----defining windows configurations
window_width=512
window_height=500------------------------------------
--local pipePairs={}
--local timer=0
--local lastY=-PIPE_HEIGHT + math.random(1,80) +20
--p={}
local background=love.graphics.newImage('background.png')
local ground=love.graphics.newImage('ground.png')

local backgroundscroll=0
local groundscroll=0
local background_scroll_speed=30*3
local ground_scroll_speed=30*6

local background_looping_point=459
scrolling=true
--local bird=Bird()

function love.load()
  love.window.setTitle("GameDevUtopia flappy")
  love.window.setMode(window_width,window_height)
  love.graphics.setFont(love.graphics.newFont(40))
  ms=love.audio.newSource("marios_way.mp3","stream")
  ms2=love.audio.newSource("jump.wav","stream")
  math.randomseed(os.time())
  keyboard_check={}

  gStateMachine=StateMachine
  {
    ['title']= function() return TitleScreenState() end,
    ['play']= function() return PlayState() end,
    ['score']= function() return ScoreState() end
  }

  gStateMachine:change('title')
end

function love.update(dt)
  backgroundscroll=(backgroundscroll+background_scroll_speed*dt)%background_looping_point
  groundscroll=(groundscroll+ground_scroll_speed*dt)%window_width
  gStateMachine:update(dt)
  keyboard_check={}
end
function love.keypressed(key)
  p=key
  keyboard_check[key]=true
  if key=='escape' then
    love.event.quit()
  end
  if(key=='space')then
    love.audio.play(ms2)
  end
end

function Keyboard_was_Pressed(key)
  if keyboard_check[key] then
    return true
  else
    return false
  end
end


function love.draw()
  love.graphics.setColor(1,1,1)
  love.graphics.draw(background,0-backgroundscroll,0)
  gStateMachine:render()
  love.graphics.setColor(0.4,0.4,0.4)
  love.graphics.draw(ground,0-groundscroll,window_height-16)


end
