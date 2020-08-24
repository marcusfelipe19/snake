Fruit = Class{}

function Fruit:init(x, y, width, height)
    self.x = x
    self.y = y
    self.width = width
    self.height = height
    self.dy = 0
    self.dx = 0
end

function Fruit:collides(snake)
    if self.x > snake.x +snake.width or snake.x > self.x + self.width then
        return false
    end

    if self.y > snake.y + snake.height or snake.y > self.y + self.height then
        return false
    end

    return true
end

function Fruit:update(dt)

end

function Fruit:render(dt)
    love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
end