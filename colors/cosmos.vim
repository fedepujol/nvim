" Maintainer: Fede Pujol

set background=dark
hi clear
if exists('syntax_on')
	syntax reset
endif
let g:colors_name='cosmos'

highlight Boolean guifg=#28B5F6 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight! link TSBoolean Boolean
highlight BufferCurrent guifg=#3B91E8 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight BufferCurrentMod guifg=#CB9343 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight BufferInactive guifg=#616161 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight BufferInactiveMod guifg=#AC7A39 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight BufferVisible guifg=#90CAF9 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight BufferVisibleMod guifg=#C5A56D guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight Character guifg=#FFAD33 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight! link TSCharacter Character
highlight CmpItemAbbrDeprecated guifg=NONE guibg=NONE guisp=NONE gui=strikethrough cterm=strikethrough
highlight CmpItemAbbrMatch guifg=#FFCC80 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight CmpItemAbbrMatchFuzzy guifg=#FFCC80 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight CmpItemKind guifg=#000000 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight CmpItemMenu guifg=#000000 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight ColorColumn guifg=#D54215 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight Comment guifg=#328636 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight! link TSComment Comment
highlight Conditional guifg=#B053C1 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight! link Exception Conditional
highlight! link Label Conditional
highlight! link Repeat Conditional
highlight! link TSConditional Conditional
highlight Constant guifg=#3B91E8 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight! link TSConstant Constant
highlight CursorColumn guifg=#616161 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight CursorLine guifg=NONE guibg=#212B31 guisp=NONE gui=NONE cterm=NONE
highlight CursorLineNr guifg=#9E9E9E guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight Debug guifg=NONE guibg=NONE guisp=NONE gui=reverse cterm=reverse
highlight! link PreCondit Define
highlight Delimiter guifg=#FF8A66 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight DiffAdd guifg=#00C251 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight! link GitSignsAdd DiffAdd
highlight DiffChange guifg=#FF950A guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight! link GitSignsChange DiffChange
highlight DiffDelete guifg=#FF4B14 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight! link GitSignsDelete DiffDelete
highlight! link NvimTreeGitDeleted DiffDelete
highlight DiffText guifg=#C9C9C9 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight Directory guifg=#FBC02D guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight ErrorMsg guifg=#CF2020 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight! link TSFloat Float
highlight Function guifg=#0096A3 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight! link Macro Function
highlight! link TSFunction Function
highlight! link TSMethod Function
highlight GitSignsCurrentLineBlame guifg=#B0B0B0 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight Identifier guifg=#7CC0F8 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight IncSearch guifg=#000000 guibg=#4EB7AC guisp=NONE gui=NONE cterm=NONE
highlight Include guifg=#A78B81 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight! link Define Include
highlight Keyword guifg=#61D6E5 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight LineNr guifg=#484242 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight LspDiagnosticsVirtualTextError guifg=#B51C1C guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight! link LspDiagnosticsFloatingError LspDiagnosticsVirtualTextError
highlight! link LspDiagnosticsSignError LspDiagnosticsVirtualTextError
highlight LspDiagnosticsVirtualTextHint guifg=#00B34A guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight! link LspDiagnosticsFloatingHint LspDiagnosticsVirtualTextHint
highlight! link LspDiagnosticsSignHint LspDiagnosticsVirtualTextHint
highlight LspDiagnosticsVirtualTextInformation guifg=#E0E0E0 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight! link LspDiagnosticsFloatingInformation LspDiagnosticsVirtualTextInformation
highlight! link LspDiagnosticsSignInformation LspDiagnosticsVirtualTextInformation
highlight LspDiagnosticsVirtualTextWarning guifg=#FF5724 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight! link LspDiagnosticsFloatingWarning LspDiagnosticsVirtualTextWarning
highlight! link LspDiagnosticsSignWarning LspDiagnosticsVirtualTextWarning
highlight ModeMsg guifg=#E0E0E0 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight MoreMsg guifg=#25C5DA guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight MsgArea guifg=NONE guibg=#1D262A guisp=NONE gui=NONE cterm=NONE
highlight MsgSeparator guifg=#029BED guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight NonText guifg=#171E21 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight Normal guifg=#C9C9C9 guibg=#171E21 guisp=NONE gui=NONE cterm=NONE
highlight! link Question Normal
highlight! link TSLiteral Normal
highlight! link TSTagDelimiter Normal
highlight! link TSText Normal
highlight NormalFloat guifg=#696969 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight NormalNC guifg=#A8A8A8 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight Number guifg=#CBDC38 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight! link Float Number
highlight! link TSNumber Number
highlight NvimTreeEmptyFolderName guifg=#616161 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight NvimTreeExecFile guifg=#C9C9C9 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight NvimTreeFolderIcon guifg=#FBC02D guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight NvimTreeFolderName guifg=#969696 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight NvimTreeGitDirty guifg=#FFCC80 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight NvimTreeGitIgnored guifg=#616161 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight NvimTreeGitNew guifg=#14B356 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight NvimTreeOpenedFile guifg=NONE guibg=#212B31 guisp=NONE gui=NONE cterm=NONE
highlight NvimTreeOpenedFolderName guifg=#A8A8A8 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight NvimTreeRootFolder guifg=#FF9100 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight NvimTreeSpecialFile guifg=#4EB7AC guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight Operator guifg=#88AFAB guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight! link TSOperator Operator
highlight Pmenu guifg=#000000 guibg=#008577 guisp=NONE gui=NONE cterm=NONE
highlight PmenuSbar guifg=NONE guibg=#008577 guisp=NONE gui=NONE cterm=NONE
highlight PmenuSel guifg=#23BDD1 guibg=#000000 guisp=NONE gui=NONE cterm=NONE
highlight PmenuThumb guifg=#21C8DE guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight PreProc guifg=#F06090 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight QuickFixLine guifg=#FFFF7A guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight! link TSRepeat Repeat
highlight SignColumn guifg=NONE guibg=#171E21 guisp=NONE gui=NONE cterm=NONE
highlight Special guifg=#F9A824 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight! link TSStringRegex Special
highlight SpecialChar guifg=#E08C06 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight! link TSStringEscape SpecialChar
highlight SpecialComment guifg=#3D948C guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight SpellBad guifg=#FF4B14 guibg=NONE guisp=NONE gui=underline cterm=underline
highlight SpellCap guifg=#C2CC33 guibg=NONE guisp=NONE gui=underline cterm=underline
highlight SpellLocal guifg=#00C753 guibg=NONE guisp=NONE gui=underline cterm=underline
highlight SpellRare guifg=#FF950A guibg=NONE guisp=NONE gui=underline cterm=underline
highlight Statement guifg=#F8BACF guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight StatusLine guifg=NONE guibg=#212121 guisp=NONE gui=NONE cterm=NONE
highlight StatusLineNC guifg=NONE guibg=#424242 guisp=NONE gui=NONE cterm=NONE
highlight StorageClass guifg=#90CAF9 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight String guifg=#FFCC80 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight! link TSString String
highlight Structure guifg=#B49EDB guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight TSConstBuiltin guifg=#1A7ADB guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight! link TSConstMacro TSConstBuiltin
highlight TSConstructor guifg=#9B7A6F guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight TSEmphasis guifg=NONE guibg=NONE guisp=NONE gui=bold,reverse cterm=bold,reverse
highlight TSError guifg=#CF2020 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight TSException guifg=#212121 guibg=#B51C1C guisp=NONE gui=NONE cterm=NONE
highlight TSField guifg=#8D6E62 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight TSFuncBuiltin guifg=#00B6C7 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight TSFuncMacro guifg=#00A4B3 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight! link TSTag TSFunction
highlight TSInclude guifg=#BCAAA4 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight TSKeyword guifg=#A985C1 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight TSKeywordOperator guifg=#3F94E9 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight! link TSKeywordReturn TSKeywordOperator
highlight TSPunctDelimiter guifg=#B0B0B0 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight! link TSPunctBracket TSPunctDelimiter
highlight! link TSPunctSpecial TSPunctDelimiter
highlight TSStrike guifg=NONE guibg=NONE guisp=NONE gui=strikethrough cterm=strikethrough
highlight TSStringSpecial guifg=#BD7605 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight TSStrong guifg=NONE guibg=NONE guisp=NONE gui=bold cterm=bold
highlight TSTagAttribute guifg=#79CBD2 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight TSURI guifg=#69B7F7 guibg=NONE guisp=NONE gui=underline cterm=underline
highlight TSUnderline guifg=NONE guibg=NONE guisp=NONE gui=underline cterm=underline
highlight TSVariable guifg=#F6A7C3 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight Tag guifg=#CC7400 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight TelescopeBorder guifg=#F06090 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight TelescopeMultiSelection guifg=#FFFF8F guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight TelescopePreviewBorder guifg=#5D6CC0 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight TelescopePromptBorder guifg=#5D6CC0 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight TelescopeResultsBorder guifg=#5D6CC0 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight TelescopeSelection guifg=#B49EDB guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight TelescopeSelectionCaret guifg=#BB69C9 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight TermCursor guifg=NONE guibg=#E0E0E0 guisp=NONE gui=NONE cterm=NONE
highlight TermCursorNC guifg=NONE guibg=#B3B3B3 guisp=NONE gui=NONE cterm=NONE
highlight Type guifg=#7B88CC guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight Typedef guifg=#5D6CC0 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight VertSplit guifg=#424242 guibg=#171E21 guisp=NONE gui=NONE cterm=NONE
highlight Visual guifg=NONE guibg=NONE guisp=NONE gui=reverse cterm=reverse
highlight WarningMsg guifg=#000000 guibg=#D54215 guisp=NONE gui=NONE cterm=NONE
highlight Whitespace guifg=#484242 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight! link NvimTreeIndentMarker Whitespace
highlight WildMenu guifg=#000000 guibg=NONE guisp=NONE gui=NONE cterm=NONE
