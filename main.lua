push = require 'push'
class = require 'class'
require 'Ball'
require 'Paddle'

WINDOW_WIDTH = 1280 
WINDOW_HEIGHT = 735

VIRTUAL_WIDTH = 423
VIRTUAL_HEIGHT = 243

PADDLE_SPEED = 200
servingplayer = 0

math.randomseed(os.time())

function love.load()
    servingplayer = 0
    love.graphics.setDefaultFilter('nearest', 'nearest')

    love.window.setTitle('Pong')

    largeFont = love.graphics.newFont('Minecraft.ttf', 15)
    smallFont = love.graphics.newFont('Minecraft.ttf', 10)

    largeFont:setFilter('nearest', 'nearest')
    smallFont:setFilter('nearest', 'nearest')

    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = false,
        vsync = true
    })

    player1Score = 0
    player2Score = 0

    ball = Ball(VIRTUAL_WIDTH / 2 - 2,VIRTUAL_HEIGHT / 2 - 2 , 4, 4)
    player1 = Paddle(10, 10, 5, 25)
    player2 = Paddle(VIRTUAL_WIDTH - 15, 10, 5, 25)
    game_state = 'start'
end

function love.keypressed(key)
    if key == 'escape' then 
        love.event.quit()
    elseif key == 'space' or key == 'enter' then
        if game_state == 'start' then
            game_state = 'play'
        else
            game_state = 'start' 
        end
    end
    if game_state == 'win' and key == 'space' then
        game_state = 'start'
    end
end

function love.update(dt)
    
        if love.keyboard.isDown('w') then
            player1.dy = -PADDLE_SPEED
        elseif love.keyboard.isDown('s') then
            player1.dy = PADDLE_SPEED
        else
            player1.dy = 0
        end

        if love.keyboard.isDown('up') then
            player2.dy = -PADDLE_SPEED
        elseif love.keyboard.isDown('down') then
            player2.dy = PADDLE_SPEED
        else
            player2.dy = 0
        end

        player1:update(dt)
        player2:update(dt)
        
        if game_state == 'play' then
            
            ball:update(dt)

            if ball:collides(player1) then
                ball.dx = -ball.dx * 1.05
                ball.x = player1.x + 5


                if ball.dy < 0 then 
                    ball.dy = -math.random(10,150)
                else
                    ball.dy = math.random(10,150)
                end
            end

            if ball:collides(player2) then
                ball.dx = -ball.dx * 1.05
                ball.x = player2.x - 4


                if ball.dy < 0 then 
                    ball.dy = -math.random(10,150)
                else
                    ball.dy = math.random(10,150)
                end
            end

            if ball.y <= 0 then 
                ball.y = 0
                ball.dy = -ball.dy
            end

            if ball.y >= VIRTUAL_HEIGHT - 4 then
                ball.y = VIRTUAL_HEIGHT - 4
                ball.dy = -ball.dy
            end
        end

        if ball.x < 0 then 
            servingplayer = 1
            player2Score = player2Score + 1
            ball:reset()
            game_state = 'start'
        end

        if ball.x > VIRTUAL_WIDTH then 
            servingplayer = 2
            player1Score = player1Score + 1
            ball:reset()
            game_state = 'start'
        end

        if player1Score == 5 then
            winnigtext = "Player 1 Win"
            player1Score = 0
            player2Score = 0
            game_state = 'win'
        end

        if player2Score == 5 then
            winnigtext = "Player 2 Win"
            player1Score = 0
            player2Score = 0
            game_state = 'win'
        end
        
        if game_state == 'start' then
            ball:reset()
        end 

    
    
    
end

function love.draw()
    push:start()
    love.graphics.setFont(largeFont)
    love.graphics.clear(207/255, 129/255, 169/255, 0.8)
    -- first paddle
    player1:render()
    --love.graphics.rectangle('fill' , 10, player1Y, 5, 25)

    -- second paddle
    
    player2:render()
    --love.graphics.rectangle('fill', VIRTUAL_WIDTH - 15, player2Y, 5, 25)
    -- ball
    ball:render()
    if game_state == 'start' then
        love.graphics.printf("Hello, Pong!", 0 , 10, VIRTUAL_WIDTH, 'center'  )
    elseif game_state == 'play' then
        love.graphics.printf("Play", 0 , 10, VIRTUAL_WIDTH, 'center'  )
    elseif game_state == 'win' then
        love.graphics.printf(winnigtext, 0, 10, VIRTUAL_WIDTH, 'center')
    end

    love.graphics.print(tostring(player1Score), VIRTUAL_WIDTH / 2 - 50 , VIRTUAL_HEIGHT / 2 - 80 )
    love.graphics.print(tostring(player2Score), VIRTUAL_WIDTH / 2 + 30 , VIRTUAL_HEIGHT / 2 - 80 ) 

    displayFPS()

    push:finish()
end

function displayFPS()
    love.graphics.setFont(smallFont)
    love.graphics.setColor(0, 1, 0, 1)
    love.graphics.print(tostring(love.timer.getFPS()), 25, 10)
    love.graphics.setColor(1,1,1,1)
end