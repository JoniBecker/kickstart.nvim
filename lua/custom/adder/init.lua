-- adder/init.lua
local M = {}
M.sum = 0

function M.add()
  local word = vim.fn.expand '<cword>'
  local num = tonumber(word)

  if num then
    M.sum = M.sum + num
    print('✅ Added: ' .. num .. ' | Total: ' .. M.sum)
  else
    print('❌ Not a number: ' .. (word or 'nil'))
  end
end

function M.reset()
  M.sum = 0
  print '🔄 Sum reset.'
end

function M.show()
  print('📊 Current total: ' .. M.sum)
end

function M.insert_total()
  local total_str = tostring(M.sum)
  vim.api.nvim_put({ total_str }, 'c', true, true)
end

function M.multiply()
  local input = vim.fn.input 'Multiply by: '
  local factor = tonumber(input)
  if not factor then
    print('❌ Invalid number: ' .. input)
    return
  end

  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  local line = vim.api.nvim_get_current_line()

  local start_col, end_col = line:find('%d+', col + 1)
  if not start_col then
    print '❌ No number under cursor'
    return
  end

  local number = tonumber(line:sub(start_col, end_col))
  if not number then
    print '❌ Failed to parse number'
    return
  end

  local result = number * factor
  local new_line = line:sub(1, start_col - 1) .. result .. line:sub(end_col + 1)
  vim.api.nvim_set_current_line(new_line)
end

return M
