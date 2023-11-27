local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>tt', "<cmd>Telescope<CR>" , {desc = "[T]elescope"})
vim.keymap.set('n', '<leader>pf', builtin.find_files, {desc = "[F]ind [F]iles"})
vim.keymap.set('n', '<leader>gf', builtin.git_files, {desc = "[G]it [F]iles"})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string( {search = vim.fn.input("Grep > ")});
end , {desc = "[P]roject [S]earch"})
