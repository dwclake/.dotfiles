return {
	{
		"nvim-telescope/telescope.nvim",
		opts = {
			defaults = {
				vimgrep_arguments = {
					"rg",
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
					"--hidden", -- also search inside hidden files for live_grep
				},
			},
			pickers = {
				find_files = {
					hidden = true,
					find_command = { "fd", "--type", "f", "--hidden", "--exclude", ".git" },
				},
			},
		},
	},
}
