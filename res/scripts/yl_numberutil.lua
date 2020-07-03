-- yl_numberutil.lua
yl_numberutil = {}

-- Generate a number from the input.
-- x = random
function yl_numberutil.generate(input)
    input = string.lower(input)
    input_table = splitToChar(input)
    for i, char in ipairs(input_table) do
        input_table[i] = chooseNumber(input_table[i])
    end
    return table.concat(input_table)
end

function yl_numberutil.generateRange(min, max)
    result = math.random(tonumber(min), tonumber(max))
    return tostring(result)
end

function chooseNumber(char)
    if char == "x" then
        return math.random(0,9)
    else 
        return char
    end
end

-- Split into chars
function splitToChar(text)
    split_text = {}
    for i in string.gmatch(text , "([0-9a-z])") do
        table.insert(split_text,i)
    end
    return split_text
end

return yl_numberutil
