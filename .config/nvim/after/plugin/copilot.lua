vim.cmd(":Copilot disable")

--vim.keymap.set('i', '<C-Tab>', 'copilot#Accept("")', {
--    expr = true,
--    replace_keycodes = false
--})
vim.keymap.set('i', '<C-\\>', 'copilot#Suggest()', {
    expr = true,
    replace_keycodes = false
})
vim.g.copilot_no_tab_map = false
