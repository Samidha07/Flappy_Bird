Bird=Class{}

local Gravity=15

function Bird:init()
  self.image=love.graphics.newImage('bird.png')

  self.width=self.image:getWidth()
  self.height=self.image:getHeight()

  self.x=window_width/2 -(self.width/2)
  self.y=window_height/2 -(self.height/2)
  self.dy=0
end

function Bird:update(dt)
  self.dy=self.dy+Gravity*dt
  self.y=self.y+self.dy

  if(Keyboard_was_Pressed('space'))then
    self.dy=-5
  end

end

function Bird:collides(pipe)
  return self.x<pipe.x+pipe.width and
         self.x+self.width>pipe.x and
         self.y<pipe.y+pipe.height and
         self.y+self.height>pipe.y
  end


function Bird:render()
  love.graphics.draw(self.image,self.x,self.y)
end
