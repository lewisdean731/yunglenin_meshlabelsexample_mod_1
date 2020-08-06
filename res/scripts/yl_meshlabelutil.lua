-- yl_meshlabelutil.lua
-- Create a 'meshlabel' using supplied parameters. Currently, it only works with the numbers 0-9.
local yl_meshlabelutil = {}

-- Materials
yl_meshlabelutil.material = "yunglenin/meshlabels/yl_meshlabels.mtl"

function yl_meshlabelutil.setMaterial(providedMaterial)
    yl_meshlabelutil.material = providedMaterial
end

function yl_meshlabelutil.resetMaterial()
    yl_meshlabelutil.material = "yunglenin/meshlabels/yl_meshlabels.mtl"
end

-- Split text into chars. Regex to use only numbers 0-9
function splitText(text)
    split_text = {}
    for i in string.gmatch(text , "(%S)") do
        table.insert(split_text,i)
    end
    return split_text
end

-- Take a given text and returns the correct meshlabel sequence
function generateLabelText(text_table, label_colour)
    meshlabel_sequence = {}
    for i, char in ipairs(text_table) do
        meshlabel_name = mapToMeshlabel(char, label_colour)
        table.insert(meshlabel_sequence, meshlabel_name)
    end
    return meshlabel_sequence -- return {"b_1", "b_5", "b_0", "b_2", "b_4", "b_6"}
end

-- Take a meshlabel sequence and returns the correct meshlabel set for use in the .mdl
function generateMeshlabelSet(meshlabel_sequence) -- b1, b2, b3 ...
    meshlabel_set = {}
    for i, type in ipairs(meshlabel_sequence) do
        meshlabel_transf = calcMeshlabelTransf(i)
        table.insert(meshlabel_set,
            {
                materials = { yl_meshlabelutil.material, },
                mesh = "yunglenin/meshlabels/yl_meshlabel_" .. type .. ".msh",
                transf = meshlabel_transf,
            }
        )
    end

    return meshlabel_set
end

-- Returns a transf  based on the index in the sequence
function calcMeshlabelTransf(meshlabel_index)
    return
    {
        1, 0, 0, 0,
        0, 1, 0, 0,
        0, 0, 1, 0,
        0, meshlabel_index*1.6, 0, 1,
    }
end

-- Main
function yl_meshlabelutil.createMeshlabel(label_colour, label_text, transf)
    label_colour = label_colour
    label_text_split = splitText(label_text)
    transf = transf

    meshlabel_sequence = generateLabelText(label_text_split, label_colour)
    meshlabel_set = generateMeshlabelSet(meshlabel_sequence)

    return
    {
        children = meshlabel_set,
        transf = transf,
        name = "meshlabel"
    }
end

-- Take a given char and return correct meshlabel.
function mapToMeshlabel(char, label_colour)
    if label_colour == "BLACK" then
        if string.match(char, '[0-9a-zA-Z]') then
            return "b_"..char
        end
    elseif label_colour == "WHITE" then
        if string.match(char, '[0-9a-zA-Z]') then
            return "w_"..char
        end
    else
        return "b_1"
    end
end

return yl_meshlabelutil