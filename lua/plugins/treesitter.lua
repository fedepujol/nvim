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
			'java', 'javascript', 'json', 'json5',
			'lua', 'luau', 'luadoc',
			'markdown', 'markdown_inline',
			'nix',
			'powershell',
			'scss', 'sql',
			'toml',
			'typescript',
			'vim', 'vimdoc',
			'xml',
			'yaml',
		}

		-- Returns all filetypes for parsers installed
		---@return table
		local function get_fts()
			local fts = {}

			for _, name in ipairs(parsers) do
				table.insert(fts, vim.treesitter.language.get_filetypes(name))
			end
			return vim.iter(fts):flatten():totable()
		end

		local ok, ts = pcall(require, 'nvim-treesitter')
		if not ok then
			vim.notify('nvim-treesitter not installed', vim.log.levels.ERROR)
		else
			vim.treesitter.language._complete()
			ts.install(parsers)
		end

		-- Treesitter features need to be manually enabled
		vim.api.nvim_create_autocmd('FileType', {
			pattern = get_fts(),
			callback = function(event)
				local ok_start, _ = pcall(vim.treesitter.start, event.buf)
				if not ok_start then
					vim.notify('Error loading tree-sitter', vim.log.levels.ERROR)
				else
					vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end
			end,
		})
	end,
}
