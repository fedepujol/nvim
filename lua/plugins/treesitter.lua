---@module "lazy"
---@type LazyPluginSpec
return {
	'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate',
	lazy = false,
	branch = 'main',
	config = function()
		-- stylua: ignore
		local parsers = {
			'angular',
			'bash',
			'c', 'comment', 'css', 'cmake',
			'diff', 'dockerfile', 'dot',
			'editorconfig',
			'git_config', 'gitcommit', 'git_rebase', 'gitattributes', 'gitignore',
			'html',
			'ini',
			'javascript',
			'json', 'json5', 'jsonc',
			'lua', 'luau', 'luadoc',
			'markdown', 'markdown_inline',
			'nix', 'norg', 'norg_meta',
			'powershell',
			'scss', 'sql',
			'toml',
			'typescript',
			'vim', 'vimdoc',
			'xml',
			'yaml',
		}

		-- stylua: ignore
		local fts = {
			"htmlangular",
			"bash", "sh",
			"c", "cpp", "objc", "objcpp", "cuda",
			"css", "scss", "less", "cmake",
			"diff", "dockerfile", "dot",
			"editorconfig",
			'git_config', 'gitcommit', 'git_rebase', 'gitattributes', 'gitignore',
			'html',
			'ini',
			'javascript', 'json', 'json5', 'jsonc',
			'lua', 'luau', 'luadoc',
			'markdown',
			'nix', 'norg',
			'powershell', 'psh',
			'sql',
			'toml',
			'typescript', "typescriptreact", "typescript.tsx",
			'vim', 'vimdoc',
			'xml',
			'yaml',
		}

		require('nvim-treesitter').setup({
			install = parsers,
		})

		-- Treesitter features need to be manually enabled
		vim.api.nvim_create_autocmd('FileType', {
			pattern = fts,
			callback = function(event)
				local ok, _ = pcall(vim.treesitter.start, event.buf)
				if not ok then
					vim.notify('tree-sitter error')
				end

				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})
	end,
}
