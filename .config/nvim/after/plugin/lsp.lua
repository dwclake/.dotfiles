local cmp = require('cmp')
local mason = require('mason')
local mason_lspconfig = require('mason-lspconfig')

mason.setup({})
mason_lspconfig.setup({
    ensure_installed = {
        'clangd',
        'gopls',
        'ocamllsp',
        'rust_analyzer',
        'zls'
    },
    handlers = {
        function(server_name)
            local lspconfig = require('lspconfig')

            lspconfig.ocamllsp.setup({})
            lspconfig.gopls.setup({
              templateExtensions = "tmpl"
            })
            lspconfig.elixirls.setup({})
            lspconfig.sourcekit.setup({
                filetypes = {"swift"}
            })
            lspconfig.crystalline.setup({
                cmd = {"/opt/homebrew/bin/crystalline"}
            })
            lspconfig.gleam.setup({})
        end
    }
})

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<Return>'] = cmp.mapping.confirm({ select = false }),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<Tab>'] = cmp.mapping(function(fallback)
            --if vim.b._copilot_suggestion ~= nil then
            --    vim.fn.feedkeys(vim.api.nvim_replace_termcodes(vim.fn['copilot#Accept'](), true, true, true), '')
            --elseif cmp.visible() then
            --    cmp.select_next_item()
            if require('luasnip').expand_or_jumpable() then
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true), '')
            else
                fallback()
            end
    end, {
      'i',
      's',
    }),
    }),
    select = {behavior = cmp.SelectBehavior.Select},
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'path' },
        { name = 'buffer' },
        { name = 'copilot' }
    },
    window = {
        completion = cmp.config.window.bordered({
            winhighlight = 'Normal:Normal,FloatBorder:Normal,CursorLine:Visual,Search:None',
            col_offset = -3,
            side_padding = 0,
        }),
        documentation = cmp.config.window.bordered({
            winhighlight = 'Normal:Normal,FloatBorder:Normal,CursorLine:Visual,Search:None',
            col_offset = -3,
            side_padding = 0,
        }),
    },
})

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(event)
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
    end
})

vim.opt.signcolumn = 'yes'

vim.g.zig_fmt_autosave = 0
vim.g.zig_enable_autofix = 0

vim.diagnostic.config({
    virtual_lines = true,
    signs = true,
    update_in_insert = true
})
