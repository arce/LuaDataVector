local redis = require 'redis'
local client = redis.connect('127.0.0.1', 6379)
local response = client:ping()           -- true

client:set('usr:nrk', 10)
client:set('usr:nobody', 5)
local value = client:get('usr:nrk')      -- 10
print(value)

for _,v in ipairs({ 10,3,2,6,1,4,23 }) do
    client:rpush('usr:nrk:ids',v)
end

local sorted = client:sort('usr:nrk:ids', {
     sort = 'asc', alpha = true, limit = { 1, 5 }
})

local values = { 'value1', 'value2', 'value3' }
client:rpush('list', unpack(values))

-- the previous line has the same effect of the following one:
client:rpush('list', 'value1', 'value2', 'value3')

local replies = client:transaction(function(t)
    t:incrby('counter', 10)
    t:incrby('counter', 30)
    t:get('counter')
end)

for k,v in pairs(client:info()) do
    print(k .. ' => ' .. tostring(v))
end
