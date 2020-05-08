-- yl_numberutil.lua
yl_numberutil = {}

-- Generate a number from the input.
-- x = random
-- s = space (to be implemented)
function yl_numberutil.generate(input)
    print("t1")
    input = string.lower(input)
    print("t1")
    input_table = splitToChar(input)
    print("t1")
    for i, char in ipairs(input_table) do
        print("t1")
        input_table[i] = chooseNumber(input_table[i])
    end
    print("t1")
    return table.concat(input_table)
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