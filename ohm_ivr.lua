local resp = require("resp")
local ohm = dofile('./ohm.lua')
local inspect = require("inspect")

local ivr = ohm.model('Ivr', {
    prefix = 'nohm:hash',

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

local db = resp.new("p20.mobilon.ru", 6379)
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