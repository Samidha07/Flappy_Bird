ScoreState = Class{__includes = BaseState}

function ScoreState:enter(params)
  self.score = params.score
end

function ScoreState:update(dt)
 if Keyboard_was_Pressed('enter') or Keyboard_was_Pressed('return') then
   gStateMachine:change('play')
 end
end

function ScoreState:render()
  love.graphics.printf('Oof! You lost!', 0, 64,window_width, 'center')
  love.graphics.printf('Score: ' .. tostring(self.score), 0, 100,window_width, 'center')
  love.graphics.printf('Press Enter to Play Again!', 0, 160, window_width, 'center')
end
