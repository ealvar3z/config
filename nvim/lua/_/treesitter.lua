local ok, nvim_treesitter_configs = pcall(require, "nvim-treesitter.configs")
if not ok then
	return
end

nvim_treesitter_configs.setup({
	ensure_installed = {
		"bash",
		"lua",
		"javascript",
		"typescript",
		"json",
		"html",
		"css",
		"graphql",
		"markdown",
		"sql",
		"toml",
		"yaml",
		"tsx",
		"vim",
	},
	highlight = { enable = true },
	indent = { enable = true },
	context_commentstring = { enable = true },
	incremental_selection = {
		enable = true,
		keymaps = {
			node_incremental = "vv",
			node_decremental = "<C-v>",
		},
	},
})
