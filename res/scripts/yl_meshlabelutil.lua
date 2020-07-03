-- yl_meshlabelutil.lua
-- Create a 'meshlabel' using supplied parameters. Currently, it only works with the numbers 0-9.
local yl_meshlabelutil = {}

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
                materials = { "yunglenin/meshlabels/yl_meshlabels.mtl", },
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
        if char == "1" then
            return "b_1"
        end
        if char == "2" then
            return "b_2"
        end
        if char == "3" then
            return "b_3"
        end
        if char == "4" then
            return "b_4"
        end
        if char == "5" then
            return "b_5"
        end
        if char == "6" then
            return "b_6"
        end
        if char == "7" then
            return "b_7"
        end
        if char == "8" then
            return "b_8"
        end
        if char == "9" then
            return "b_9"
        end
        if char == "0" then
            return "b_0"
        end
    elseif label_colour == "WHITE" then
        if char == "1" then
            return "w_1"
        end
        if char == "2" then
            return "w_2"
        end
        if char == "3" then
            return "w_3"
        end
        if char == "4" then
            return "w_4"
        end
        if char == "5" then
            return "w_5"
        end
        if char == "6" then
            return "w_6"
        end
        if char == "7" then
            return "w_7"
        end
        if char == "8" then
            return "w_8"
        end
        if char == "9" then
            return "w_9"
        end
        if char == "0" then
            return "w_0"
        end
        --------------------------------
        if char == "a" then
            return "w_a"
        end
        if char == "b" then
            return "w_b"
        end
        if char == "c" then
            return "w_c"
        end
        if char == "d" then
            return "w_d"
        end
        if char == "e" then
            return "w_e"
        end
        if char == "f" then
            return "w_f"
        end
        if char == "g" then
            return "w_g"
        end
        if char == "h" then
            return "w_h"
        end
        if char == "i" then
            return "w_i"
        end
        if char == "j" then
            return "w_j"
        end
        if char == "k" then
            return "w_k"
        end
        if char == "l" then
            return "w_l"
        end
        if char == "m" then
            return "w_m"
        end
        if char == "n" then
            return "w_n"
        end
        if char == "o" then
            return "w_o"
        end
        if char == "p" then
            return "w_p"
        end
        if char == "q" then
            return "w_q"
        end
        if char == "r" then
            return "w_r"
        end
        if char == "s" then
            return "w_s"
        end
        if char == "t" then
            return "w_t"
        end
        if char == "u" then
            return "w_u"
        end
        if char == "v" then
            return "w_v"
        end
        if char == "w" then
            return "w_w"
        end
        if char == "x" then
            return "w_x"
        end
        if char == "y" then
            return "w_y"
        end
        if char == "z" then
            return "w_z"
        end
    else
        return "b_1"
    end
end

return yl_meshlabelutil
