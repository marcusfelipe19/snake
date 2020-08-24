Snake = Class{}

function Snake:init(x, y, width, height)
    self.x = x
    self.y = y
    self.width = width
    self.height = height + score * 2
    self.dx = 0
    self.dy = 0
end

function Snake:update(dt)

end

function Snake:collides()
    if self.x > paddle.x + paddle.width or paddle.x > self.x + self.width then
        return false
    end

    if self.y > paddle.y + paddle.height or paddle.y > self.y + self.height then
        return false
    end

    return true
end

function Snake:reset()
    self.x = math.random(0, VIRTUAL_WIDTH - 2)
    self.y = math.random(0, VIRTUAL_HEIGHT - 2)
end

function Snake:render()
    love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
    love.graphics.circle('fill', (self.x + self.width) / 2, self.y + self.height, self.width / 2)
end