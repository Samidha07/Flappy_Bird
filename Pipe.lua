 Pipe=Class{}

PIPE_SPEED=30
PIPE_HEIGHT=330
PIPE_WIDTH=70

local PIPE_IMAGE= love.graphics.newImage('pipe.png')
local PIPE_SCROLL=-60

function Pipe:init(orientation,y )
  self.x=window_width
  self.y=y
  self.width=PIPE_IMAGE:getWidth()
  self.height=PIPE_HEIGHT
  self.orientation=orientation
end

function Pipe:update(dt)
  -- self.x=self.x+PIPE_SCROLL*dt
 end
function Pipe:render()
  love.graphics.draw(PIPE_IMAGE,self.x,
  (self.orientation == 'top' and self.y+PIPE_HEIGHT or self.y),
  0,---rotation
  1,--xscale
  self.orientation == 'top'  and -1 or 1)  --yscale
end
