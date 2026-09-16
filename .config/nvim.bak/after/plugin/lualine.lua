return {
	"nvim-lualine/lualine.nvim",
	opts = function()
		local colors = {
			bg = "",
			fg = "#bbc2cf",
			yellow = "#ECBE7B",
			cyan = "#008080",
			green = "#98be65",
			orange = "#FF8800",
			violet = "#a9a1e1",
			magenta = "#c678dd",
			red = "#ec5f67",
		}

		local conditions = {
			buffer_not_empty = function()
				return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
			end,
			hide_in_width = function()
				return vim.fn.winwidth(0) > 80
			end,
		}

		return {
			options = {
				component_separators = "",
				section_separators = "",
				theme = {
					normal = { c = { fg = colors.fg, bg = colors.bg } },
					inactive = { c = { fg = colors.fg, bg = colors.bg } },
				},
			},
			sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_y = {},
				lualine_z = {},
				lualine_c = {
					{ "filesize", cond = conditions.buffer_not_empty, padding = { left = 1 } },
					{ "filename", cond = conditions.buffer_not_empty, color = { fg = colors.magenta, gui = "bold" } },
					{ "location" },
					{ "progress", color = { fg = colors.fg, gui = "bold" } },
					{
						"diagnostics",
						sources = { "nvim_diagnostic" },
						symbols = { error = " ", warn = " ", info = " " },
						diagnostics_color = {
							color_error = { fg = colors.red },
							color_warn = { fg = colors.yellow },
							color_info = { fg = colors.cyan },
						},
					},
					{
						function()
							return "%="
						end,
					},
				},
				lualine_x = {
					{ "branch", icon = "", color = { fg = colors.violet, gui = "bold" } },
					{
						"diff",
						symbols = { added = " ", modified = "柳 ", removed = " " },
						diff_color = {
							added = { fg = colors.green },
							modified = { fg = colors.orange },
							removed = { fg = colors.red },
						},
						cond = conditions.hide_in_width,
					},
				},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_y = {},
				lualine_z = {},
				lualine_c = {},
				lualine_x = {},
			},
		}
	end,
}
