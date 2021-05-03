-- Nvim-Tree Colorscheme
vim.api.nvim_exec([[
    hi NvimTreeFolderName           guifg=#FFFFFF
    hi NvimTreeRootFolder           guifg=#FFAA0D
    hi NvimTreeFolderIcon           guifg=#FFB327
    hi NvimTreeEmptyFolderName      guifg=#E2E2E2
    hi NvimTreeOpenedFolderName     guifg=#B1B1B1
    hi NvimTreeOpenedFile           guifg=#B1B1B1
    hi NvimTreeExecFile             guifg=#

    hi NvimTreeGitNew               guifg=#96E098
    hi NvimTreeGitDeleted           guifg=#FF3B3B
    hi NvimTreeGitDirty             guifg=#FFDA97
    hi NvimTreeGitIgnored           guifg=#C5C5C5   gui=italic
]], false)
