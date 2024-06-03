local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
	'tsserver',
	'eslint',
	'rust_analyzer',
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select), 
	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
	['<C-y>'] = cmp.mapping.confirm({ select = false }),
	['<C-Space>'] = cmp.mapping.complete(),
    ['<C-\\>'] = cmp.mapping(function() vim.fn.feedkeys(vim.api.nvim_replace_termcodes(vim.fn['copilot#Accept'](), true, true, true)) '' end),
    ['<Tab>'] = cmp.mapping(function(fallback)
        if vim.b._copilot_suggestion ~= nil then
            vim.fn.feedkeys(vim.api.nvim_replace_termcodes(vim.fn['copilot#Accept'](), true, true, true), '')
        --elseif cmp.visible() then
        --    cmp.select_next_item()
        elseif require('luasnip').expand_or_jumpable() then
            vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true), '')
        else
            fallback()
        end
end, {
  'i',
  's',
}),
})

lsp.set_preferences({
	sign_icons = { }
})

lsp.setup_nvim_cmp({
	mapping = cmp_mappings
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>c", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>rr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

require'lspconfig'.gopls.setup({
  templateExtensions = "tmpl"
})
require'lspconfig'.ocamllsp.setup{}
require'lspconfig'.elixirls.setup{}
require'lspconfig'.sourcekit.setup{
    filetypes = {"swift"}
}
require'lspconfig.configs'.onyx = {
    default_config = {
        cmd = { "onyx", "lsp" },
        filetypes = { "onyx" },
        root_dir = function(filename)
            local utils = require'lspconfig.util'
            return utils.search_ancestors(filename, function(path)
                if utils.path.is_file(utils.path.join(path, "onyx-lsp.ini")) then
                    return path
                end
            end)
        end;
        settings = {}
    }
}
require'lspconfig'.gleam.setup {}
require'lspconfig'.onyx.setup {}

lsp.setup()

vim.g.zig_fmt_autosave = 0
vim.g.zig_enable_autofix = 0

vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    update_in_insert = true,
})
