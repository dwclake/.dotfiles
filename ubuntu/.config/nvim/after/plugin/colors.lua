require('rose-pine').setup({
    disable_italics = true
})

require('kanagawa').setup({
	keywordStyle = { italic = false },
  typeStle = { italic = false },
  functionStyle = { italic = false },
  statementStyle = { italic = false, bold = false },
  commentStyle = { italic = true },
  undercurl = false,
  transparent = true
})

require('nordic').setup({
  on_palette = function(palette)
    palette.white0 = '#D8DEE9'
    palette.red.dim = palette.red.bright
    palette.red.base = palette.red.bright
    palette.orange.dim = palette.orange.bright
    palette.orange.base = palette.orange.bright
    palette.cyan.dim = palette.cyan.bright
    palette.cyan.base = palette.cyan.bright
    palette.cyan.dim = palette.cyan.bright
    palette.cyan.base = palette.cyan.bright
    return palette
  end,
  bold_keywords = false,
  italic_comments = false,
  transparent_bg = true,
  reduce_blue = true
})

function ColorMyPencils(color)
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.cmd(":highlight SignColumn guibg=none")	
    vim.cmd(":highlight LineNr guibg=none")	
    vim.cmd(":highlight GitSignsAdd guibg=none")	
    vim.cmd(":highlight GitSignsDelete guibg=none")	
    vim.cmd(":highlight GitSignsChange guibg=none")	
    vim.cmd(":highlight GitSignsChangedelete guibg=none")	
    vim.cmd(":highlight GitSignsTopdelete guibg=none")	
    vim.cmd(":highlight GitSignsUntracked guibg=none")	
    vim.cmd(":highlight GitSignsAddNr guibg=none")	
    vim.cmd(":highlight GitSignsChangeNr guibg=none")	
    vim.cmd(":highlight GitSignsDeleteNr guibg=none")	
    vim.cmd(":highlight GitSignsChangedeleteNr guibg=none")	
    vim.cmd(":highlight GitSignsTopdeleteNr guibg=none")	
    vim.cmd(":highlight GitSignsUntrackedNr guibg=none")	
    vim.cmd(":highlight GitSignsAddLn guibg=none")	
    vim.cmd(":highlight GitSignsChangeLn guibg=none")	
    vim.cmd(":highlight GitSignsChangedeleteLn guibg=none")	
    vim.cmd(":highlight GitSignsUntrackedLn guibg=none")	
end

ColorMyPencils("nordic")
