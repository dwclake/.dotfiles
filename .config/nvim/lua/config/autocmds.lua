-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
vim.api.nvim_create_autocmd("VimEnter", {
	nested = true,
	callback = function()
		if vim.fn.argc() == 0 then
			vim.cmd("Neotree position=current dir=" .. vim.fn.getcwd())
		end
	end,
})

--vim.api.nvim_create_autocmd("ColorScheme", {
--  callback = function()
--      vim.api.nvim_set_hl(0, "GitSignsAdd", { link = "LineNr" })
-- end,
--})

--vim.api.nvim_create_autocmd("LspAttach", {
-- callback = function(args)
--    vim.schedule(function()
--      vim.keymap.set("n", "K", function()
--        local params = vim.lsp.util.make_position_params(0, "utf-16")
--        local clients = vim.lsp.get_clients({ bufnr = args.buf, method = "textDocument/hover" })
--        local shown = false
--        for _, client in ipairs(clients) do
--          client.request("textDocument/hover", params, function(err, result, ctx)
--            if not shown and result and result.contents and not vim.tbl_isempty(result.contents) then
--              shown = true
--              vim.lsp.handlers["textDocument/hover"](err, result, ctx, {})
--            end
--          end, args.buf)
--        end
--     end, { buffer = args.buf, desc = "Hover" })
--    end)
--  end,
--})
