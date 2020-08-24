push = require 'push'

Class = require 'class'

require 'Snake'

require 'Fruit'

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest')

    love.window.setTitle('Snake Game')

    math.randomseed(os.time())

    smallFont = love.graphics.newFont('font.ttf', 8)
    largeFont = love.graphics.newFont('font.ttf', 16)
    scoreFont = love.graphics.newFont('font.ttf', 32)
    love.graphics.setFont(smallFont)

    --Colocar o Som depois aquiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii!!!!

    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT {
        fullscreen = false,
        resizable = true,
        vsync = true
    })

    --pode não estar enquadrado!!!!!!
    snake = Snake((VIRTUAL_WIDTH / 2), VIRTUAL_HEIGHT / 2, 5, 20)

    fruit = Fruit(math.random(0, VIRTUAL_WIDTH - 2), math.random(0, VIRTUAL_HEIGHT - 2), 2, 2)

    score = 0

    gameState = 'start'
end

function love.resize(w, h)
    push:resize(w, h)
end

function love.update(dt)
    if gameState == 'play' then
        if fruit:collides(snake) then
            fruit:reset()
            score = score + 1
            --colocar som de pontuação
        end
    end -- colocar colisão com paredes e com o corpo, alem da velocidade da cobra
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    
    elseif key == 'enter' or key == 'return' then
        if gameState == 'start' or gameState == 'done' then
            gameState = 'play'
            score = 0
        end
    end
end

function love.draw()
    push:apply('start')

    love.graphics.clear(40, 45, 52, 255)    

    if gameState == 'start' then
        love.graphics.setFont(smallFont)
        love.graphics.printf('Welcome to Pong!', 0, 10, VIRTUAL_WIDTH, 'center')
        love.graphics.printf('Press Enter to begin!', 0, 20, VIRTUAL_WIDTH, 'center')

    elseif gameState == 'play' then
        --Nada na tela
    elseif gameState == 'done' then
        love.graphics.setFont(largeFont)
        love.graphics.printf('Your score is ' .. tostring(score), 0, 10, VIRTUAL_WIDTH, 'center')
        love.graphics.setFont(smallFont)
        love.graphics.printf('Press Enter to restart!', 0, 30, VIRTUAL_WIDTH, 'center')
    end

    displayScore()

    snake:render()
    fruit:render()

    displayFPS()

    push:apply('end')
end

function displayScore()
    love.graphics.setFont(scoreFont)
    love.graphics.print(tostring(score), (VIRTUAL_WIDTH / 2), (VIRTUAL_HEIGHT / 2))
end

function displayFPS()
    love.graphics.setFont(smallFont)
    love.graphics.setColor(0, 255, 0, 255)
    love.graphics.print('FPS: ' .. tostring(love.timer.getFPS()), 10, 10)
end