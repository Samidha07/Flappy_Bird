TitleScreenState = Class{__includes = BaseState}

function TitleScreenState:update(dt)
  if Keyboard_was_Pressed('enter') or Keyboard_was_Pressed('return') then
    gStateMachine:change('play')
  end
end

function TitleScreenState:render()
  --love.graphics.setFont(flappyFont)
  love.graphics.printf('Fifty Bird', 0, 64, window_width, 'center')

  --love.graphics.setFont(mediumFont)
  love.graphics.printf('Press Enter', 0, 100,window_width, 'center')
end
