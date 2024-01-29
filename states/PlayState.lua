PlayState = Class{__includes = BaseState}

PIPE_SPEED = 60
PIPE_WIDTH = 70
PIPE_HEIGHT = 330

BIRD_WIDTH = 38
BIRD_HEIGHT = 24

function PlayState:init()
  self.bird = Bird()
  self.pause = false
  self.Timer = 0
  self.lastY = -PIPE_HEIGHT + math.random(80) + 20
  self.pipePairs = {}
  self.score=0

end

function PlayState:update(dt)
  if Keyboard_was_Pressed('p') then

    if self.pause then
      self.pause = false
      scrolling = true
      --sounds['music']:resume()
    else
      self.pause = true
      scrolling = false
      --sounds['music']:pause()
    end
    --sounds['pause']:play()
  end

  if self.pause == false then
    self.Timer = self.Timer + dt
   ---  local rand = math.random(2, 20)
    if self.Timer > 2 then
    --local y = math.max(-PIPE_HEIGHT + 10,
      --math.min(self.lastY + math.random(-20, 20), window_height - 90 - PIPE_HEIGHT))
      local y=math.random(-246,-90)
      table.insert(self.pipePairs, PipePair(y))
      self.Timer = 0
      self.lastY = y

    end

    self.bird:update(dt)

    for k,pair in pairs(self.pipePairs) do
      -- body...
      pair:update(dt)

        for l, pipe in pairs(pair.pipes) do
          -- body...
          if self.bird:collides(pipe) then
            gStateMachine:change('score',{score=self.score})

          end
        end
      end

      for k,pair in pairs(self.pipePairs)do
        if pair.scored == false then
          if pair.x+PIPE_WIDTH<self.bird.x then
            self.score=self.score+1
            pair.scored=true
          end
        end
      end

      if self.bird.y>window_height-15 then
        gStateMachine:change('score',{score=self.score})
      end



    for k,pair in pairs(self.pipePairs) do
      -- body...
      if pair.remove then
        table.remove(self.pipePairs, k)
      end
    end


  end
end

function PlayState:render()
  for k,pair in pairs(self.pipePairs) do
    pair:render()
  end

  --love.graphics.setFont(flappyFont)
  love.graphics.print('Score: ' .. tostring(self.score), 8, 8)

  self.bird:render()



end

function PlayState:enter()
    -- if we're coming from death, restart scrolling
    scrolling = true
end

--[[
    Called when this state changes to another state.
]]
function PlayState:exit()
    -- stop scrolling for the death/score screen
    scrolling = false
end
