return {
  dir = vim.fn.stdpath 'config' .. '/lua/custom/adder',
  name = 'adder',
  lazy = false, -- or lazy = true, event = "VeryLazy"
  config = function()
    local adder = require 'custom.adder'

    vim.keymap.set('n', '<leader>=', adder.add, { desc = 'Add number under cursor to sum' })
    vim.keymap.set('n', '<leader>ar', adder.reset, { desc = 'Reset sum' })
    vim.keymap.set('n', '<leader>at', adder.show, { desc = 'Show current sum' })
    vim.keymap.set('n', '<leader>ap', adder.insert_total, { desc = 'Insert current total' })
    vim.keymap.set('n', '<leader>am', adder.multiply, { desc = 'Multiply number after cursor by...' })
  end,
}
