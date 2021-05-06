# NeoVim As IDE
Hello there fellow stranger! This is my custom config to make NeoVim into a VSCode replacement. 

## Index
- [Included](#included)
- [Prerequisite](#prerequisite)
	- [Installation](#installation)
	- [Dependencies](#dependencies)
	- [First Launch](#first-launch)
	- [LSP](#lsp)
- [Pluggins](#pluggins)

## Features
- Code Completion
- Color highlight
- File Explorer
- Fuzzy finder, live grep, etc.
- Git integration
- Icons
- Lsp
- Snippets
- Statusline
- Syntax colors
- Tabline
- And a few more!

Also a very minimal colorscheme to make everything look a little bit nicer and custom key bindings.

## Prerequisite
- Neovim version 0.5.0 (not released yet) or above. Use [nightly](https://github.com/neovim/neovim/releases) builds.
- [Paq-nvim](https://github.com/savq/paq-nvim) (minimal package manager for neovim written in Lua).

### Installation
Currently there is not a custom installation script (for now). To use this config, clone the repo:

```
git clone https://github.com/fedepujol/nvim.git 
```

- **Windows**
	- Place it inside your `~.\AppData\Local\` folder.
- **Linux**
	- Place it inside your `.config/` folder.

#### Dependencies
In order to complete the installation of the lsp's you will need the following packages:
- `npm`
- `go`

#### First Launch
In the first launch of neovim, you will be notified with a lot of errors. Mainly because the config needs the pluggins to be install 
and currently there are none. To correct this errors, type:
```
:PlugInstall
```
This will tell `Paq` to download the missing pluggins. After `Paq` has finished, restart neovim.

#### LSP
In this config I've included several lsp's (bash, css, html, etc.). To download the lsp's, you must type:
```
:LspInstall bash
```

## Pluggins
These are the pluggins included:
- [barbar](https://github.com/romgrk/barbar.nvim)
- [colorizer](https://github.com/norcalli/nvim-colorizer.lua)
- [galaxyline](https://github.com/glepnir/galaxyline.nvim)
- [gitsigns](https://github.com/lewis6991/gitsigns.nvim)
- [nvim-compe](https://github.com/hrsh7th/nvim-compe)
- [nvim-lspconfig](https://github.com/kabouzeid/nvim-lspinstall)
- [nvim-lspsaga](https://github.com/glepnir/nvim-lspsaga)
- [nvim-tree](https://github.com/lewis6991/nvim-tree.lua)
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [nvim-web-devicons](https://github.com/norcalli/nvim-web-devicons)
- [telescope](https://github.com/nvim-telescope/teslecope.nvim)
- [vim-vsnip](https://github.com/hrsh7th/vim-vsnip)

To manage all of them you have `Paq`. Here are a few useful commands
- To install new pluggins
```
:PaqInstall
```
- Remove a Pluggin (you've to delete it from your _manager.lua_ first)
```
:PaqClean
```
- Update a Pluggin
```
:PaqUpdate
```
