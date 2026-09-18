-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<C-p>", "<cmd>Telescope find_files<cr>", { desc = "Find Files" })

vim.keymap.set("n", "<leader>pv", function()
	Snacks.explorer()
end, { desc = "Explorer (cwd)" })

vim.keymap.set({ "i", "v", "n" }, "<C-c>", "<Esc>", { desc = "Escape (blockwise-safe)" })
