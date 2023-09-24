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
    palette.white0 = '#d5dbeb'
    palette.red.dim = '#db7f88'
    palette.red.base = palette.red.bright
    palette.yellow.base = '#fcdb97'
    palette.yellow.dim = palette.yellow.base
    palette.orange.dim = '#e3977c'
    palette.orange.base = palette.orange.dim
    palette.cyan.dim = '#9dddee'
    palette.cyan.base = palette.cyan.dim
    palette.green.dim = palette.green.bright
    palette.green.base = palette.green.bright
    palette.magenta.base = '#a78aad'
    palette.magenta.dim = palette.magenta.base
    return palette
  end,
  bold_keywords = false,
  italic_comments = false,
  transparent_bg = true,
  reduce_blue = false
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
