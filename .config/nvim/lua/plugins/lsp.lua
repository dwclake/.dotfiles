return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			inlay_hints = { enabled = false },
			servers = {
				zls = {
					settings = {
						zls = {
							enable_autofix = false,
							fmt_autosave = false,
						},
					},
				},
			},
		},
	},
}
