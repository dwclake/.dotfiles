return {
	{
		"stevearc/conform.nvim",
		opts = {
			formatters = {
				prettier = {
					prepend_args = {
						"--use-tabs",
						"--tab-width",
						"4",
						-- add more here, e.g.:
						"--trailing-comma",
						"none",
						"--single-quote",
						"--print-width",
						"100",
						-- "--no-semi",
					},
				},
			},
		},
	},
}
