require('rose-pine').setup({
	styles = {
        transparency = true,
        italic = false,
        bold = false
    },
})

require('ruka').setup({
	disable_italics = true
})

require('nordic').setup({
    on_palette = function(palette)
      palette.white0 = '#d5dbeb'
      palette.gray5 = '#7f8ba1'
      palette.red.dim = '#db7f88'
      palette.red.base = palette.red.dim
      palette.red.bright = palette.red.dim
      palette.yellow.base = '#facd73'
      palette.yellow.dim = palette.yellow.base
      palette.orange.dim = '#8791a3' --'#e3977c'
      palette.orange.base = palette.orange.dim
      palette.cyan.dim = '#9dddee'
      palette.cyan.bright = palette.cyan.dim
      palette.cyan.base = palette.cyan.dim
      palette.green.bright = '#76cfb4'
      palette.green.dim = palette.green.bright
      palette.green.base = palette.green.bright
      palette.magenta.bright = palette.yellow.dim
      palette.magenta.base = palette.yellow.dim --'#a78aad'
      palette.magenta.dim = palette.magenta.base
      return palette
    end,
  bold_keywords = false,
  italic_comments = false,
  transparent_bg = true,
  reduce_blue = false
})

function ColorMyPencils(color)
	color = color or "meh"
	vim.cmd.colorscheme(color)

    if color == "meh" then
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        vim.cmd(":highlight SignColumn guibg=none ctermbg=none")	
        vim.cmd(":highlight StatusLine guibg=none ctermbg=none")	
        vim.cmd(":highlight LineNr guibg=none")	
        vim.cmd(":highlight WarningMsg guibg=none")	
        vim.cmd(":highlight Error guibg=none")	
        vim.cmd(":highlight DiffAdd guibg=none ctermbg=none")	
        vim.cmd(":highlight DiffChange guibg=none ctermbg=none")	
        vim.cmd(":highlight DiffDelete guibg=none ctermbg=none")	
        vim.cmd(":highlight DiffText guibg=none ctermbg=none")	
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
end

--ColorMyPencils("rose-pine")
ColorMyPencils("meh")
