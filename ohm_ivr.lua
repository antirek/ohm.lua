local redis = require("redis")
local ohm = require('ohm')
local inspect = require("inspect")


local resp_over_redis  = function (conn)
    return {
        call = function(this, method, key, ...)
            print(method, key, arg);
            if arg.n~=0 then
                return conn[method:lower()](conn, key, arg)
            else
                return conn[method:lower()](conn, key)
            end
        end
    }
end

local function dbConn(params)
    return resp_over_redis(redis.connect(params.host, params.port))
end





local ivr = ohm.model('Ivr', {
    prefix = 'nohm',

    attributes = {
        "title",
        "extension",
        "key_1",
        "key_2",
        "key_3",
    },

    indices = {
        "extension"
    },
})

local start_time = os.clock()
print(start_time);

local db = dbConn({host = "localhost", port = 6379});
print(os.clock() - start_time);



local currentIvr = ivr:fetch(db,'2');

print(inspect(currentIvr));
print('ss:'..os.clock())
print(os.clock() - start_time);

local extension = '121';

local ivr121 = ivr:find(db, {extension = extension})

print(inspect(ivr121))
print(os.clock() - start_time);

local key_3 = '666';

local key_3ivr = ivr:with(db, 'key_3', key_3)

print(inspect(key_3ivr))
print(os.clock() - start_time);