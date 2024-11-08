function _G.toggle_case()
    local start_pos = vim.fn.getpos("'<")
    local end_pos = vim.fn.getpos("'>")
    local lines = vim.fn.getline(start_pos[2], end_pos[2])

    -- print("Start position:", vim.inspect(start_pos))
    -- print("End position:", vim.inspect(end_pos))
    -- print("Selected lines:", vim.inspect(lines))

    local function toggle(text)
        if text:lower() == text then
            return text:gsub("(%a)([%w_']*)", function(first, rest)
                return first:upper() .. rest:lower()
            end)
        elseif text:upper() == text then
            return text:lower()
        else
            return text:lower()
        end
    end

    if #lines == 1 then
        local line = lines[1]
        local selected_text = line:sub(start_pos[3], end_pos[3])
        local toggled_text = toggle(selected_text)
        lines[1] = line:sub(1, start_pos[3] - 1) .. toggled_text .. line:sub(end_pos[3] + 1)
    else
        for i = 1, #lines do
            local selected_text = lines[i]:sub(start_pos[3], end_pos[3])
            local toggled_text = toggle(selected_text)
            lines[i] = lines[i]:sub(1, start_pos[3] - 1) .. toggled_text .. lines[i]:sub(end_pos[3] + 1)
        end
    end

    vim.fn.setline(start_pos[2], lines)
end
