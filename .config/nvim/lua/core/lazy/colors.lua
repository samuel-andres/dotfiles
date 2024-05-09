return {
	{
		"rebelot/kanagawa.nvim",
		name = "kanagawa",
		config = function()
			local kanagawa = require("kanagawa")
            kanagawa.setup({
				-- if true modify config, restart, :KanagawaCompile
                compile = true,
                undercurl = true,
				commentStyle = { italic = true },
				functionStyle = {},
				keywordStyle = { italic = true},
				statementStyle = { bold = true },
				typeStyle = {},
				transparent = true,
				dimInactive = false,
				terminalColors = true,
                theme = "wave",
                background = {
                    dark = "dragon",
                    light = "lotus"
                },
            })
            vim.cmd("colorscheme kanagawa")
		end
	},
}
