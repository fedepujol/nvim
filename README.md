# Neovim Config

Hello there fellow stranger! This is my custom config for Neovim, it has been
tested on Linux and Windows.

It provides the following:

- Code Completion
- File Explorer
- Git Integration
- Icons
- LSP’s
- Snippets
- Statusline
- Tabline
- Terminal Wrapper

## Index

- [Requirements](#requirements)
- [Installation](#installation)
  - [First Launch](#first-launch)
  - [Language Server Protocol](#language-server-protocol)
    - [Install](#install)
    - [Configuration](#configuration)
    - [Formatters and Linters](#formatters-and-linters)
- [Settings](#settings)
- [Keybindings](#keybindings)
- [Plugins](#plugins)

## Requirements

- Neovim v0.9.0 or [nightly](https://github.com/neovim/neovim/releases)
  builds.
- A Patched Font (Pick your font of choice from the
  [NerdFonts](https://github.com/ryanoasis/nerd-fonts) guys)
- Terminal emulator capable of using a patched font (For Windows you may try
  [Windows Terminal](https://github.com/Microsoft/Terminal)).
- [Lazy.nvim](https://github.com/folke/lazy.nvim)
  (package manager to lazy load your config).

If you're using this configuration with NeoVim 0.6/0.6.1, you'll have to deal
with the formatters outputing wrong `eol` in `Windows` files (fileformats=dos).
There's an issue on NeoVim, which is already merge.

## Installation

There is not a custom installation script (for now). To use this
config follow steps:

- Windows

  - Open a `CMD`/`PowerShell`/`Bash`
  - Navigate to `~\AppData\Local` (C:\\Users\\your_user\\AppData\\Local)
  - Clone the repo with `git clone https://github.com/fedepujol/nvim.git`

- Linux

  - Open a terminal (it depends on your distribution)
  - Navigate to `~/.config/`
  - Clone the repo with `git clone https://github.com/fedepujol/nvim.git`

### First Launch

On first launch, _lazy_ package manager will download
every plugin declared on the folder `/lua/plugins` and on `/lua/core/lazy.lua` file.

After this, re-open neovim. Then when you open a file, `mason-lspconfig.nvim`
will download the LSP's configured in the file `/lua/plugins/lspconfig.lua`.

| Lsp           | File            |
| ------------- | --------------- |
| angularls     | html/typescript |
| bashls        | sh/bash         |
| css           | css             |
| html          | html            |
| lua_ls        | lua             |
| marksman      | markdown        |
| prosemd_lsp   | markdown        |
| rust-analyzer | rust            |
| tsserver      | typescript      |
| vimlsp        | vim             |
| yamllsp       | yaml            |

### Language Server Protocol

Neovim has integrated a lot of cool features, one of them is the ability to
interact with `language servers` to get some auto-completions, diagnostics and
more based on the language you're using.

#### Install

To install a server you'll use the plugin `mason.nvim` and `mason-lspconfig.nvim`
by typing:

```text
:MasonInstall name-of-server
```

To view all available servers to download and managed the ones you've got:

```text
:Mason
```

#### Configuration

I’ve included several lsp’s initializations (bash, css, html, etc.) in
`lua/plugins/lspconfig.lua`.

These are maintained in `nvim-lspconfig` repo. There you'll find the configurations
for several servers. If you want one, just take the config and paste it on the file.
If you want more control, change the default values.
A lot of the times, you'll have something like this:

```lua
require('lspconfig').tsserver.setup({})
```

The `setup` function already has default values,
which in most cases works out of the box. Then install the server:

```text
:MasonInstall tsserver
```

And you're ready to go!

#### Formatters and Linters

`mason.nvim` takes care of installing of configure the formatters and linters.
Just type:

```text
:Mason
```

And navigate to `Formatters` or `Linters`, select the ones you want and install them!

### Plugin Folder Structure

This repo follows the **plugin structure** of `lazy.nvim`. If you want to know more
visit the [repo](https://github.com/folke/lazy.nvim).

## Settings

- File: `lua/core/settings.lua`

Every setting you want to change about Neovim goes in here.

## Keybindings

Neovim related keybindings

- File: `lua/core/mappings.lua`

Pluggins keybindings:

- File: `lua/core/which-key.lua`

## Plugins

These are the plugins included:

| Name                                                                       |
| -------------------------------------------------------------------------- |
| [Comment](https://github.com/numToStr/Comment.nvim)                        |
| [barbar](https://github.com/romgrk/barbar.nvim)                            |
| [better-escape](https://github.com/max397574/better-escape.nvim)           |
| [bracketpair.nvim](https://github.com/fedepujol/bracketpair.nvim)          |
| [colorizer](https://github.com/NvChad/nvim-colorizer.lua)                  |
| [cosmos.nvim](https://github.com/fedepujol/cosmos.nvim)                    |
| [dressing.nvim](https://github.com/stevearc/dressing.nvim)                 |
| [fidget.nvim](https://github.com/j-hui/fidget.nvim)                        |
| [formatter.nvim](https://github.com/mhartington/formatter.nvim)            |
| [gitsigns](https://github.com/lewis6991/gitsigns.nvim)                     |
| [heirline](https://github.com/rebelot/heirline.nvim)                       |
| [lazy.nvim](https://github.com/folke/lazy.nvim)                            |
| [lush](https://github.com/rktjmp/lush.nvim)                                |
| [mason-lspconfig.nvim](https://github.com/williamboman/nvim-lsp-installer) |
| [mason.nvim](https://github.com/williamboman/nvim-lsp-installer)           |
| [move.nvim](https://github.com/fedepujol/move.nvim)                        |
| [neo-tree](https://github.com/kyazdani42/nvim-tree.lua)                    |
| [neodev.nvim](https://github.com/folke/neodev.nvim)                        |
| [nvim-autopairs](https://github.com/windwp/nvim-autopairs)                 |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)                            |
| [nvim-dap](https://github.com/mfussenegger/nvim-dap)                       |
| [nvim-jdtls](https://github.com/mfussenegger/nvim-jdtls)                   |
| [nvim-lint](https://github.com/mfussenegger/nvim-lint)                     |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)                 |
| [nvim-toggleterm](https://github.com/akinsho/nvim-toggleterm.lua)          |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)      |
| [nvim-ts-rainbow](https://github.com/p00f/nvim-ts-rainbow)                 |
| [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)        |
| [package-info.nvim](https://github.com/vuki656/package-info.nvim')         |
| [playground](https://github.com/nvim-treesitter/playground)                |
| [schemastore.nvim](https://github.com/b0o/SchemaStore.nvim)                |
| [shipwright](https://github.com/rktjmp/shipwright.nvim)                    |
| [tabout.nvim](https://github.com/abecodes/tabout.nvim)                     |
| [telescope](https://github.com/nvim-telescope/telescope.nvim)              |
| [trouble.nvim](https://github.com/folke/trouble.nvim)                      |
| [undotree](https://github.com/mbbill/undotree)                             |
| [vim-visual-multi](https://github.com/mg979/vim-visual-multi)              |
| [vim-vsnip](https://github.com/hrsh7th/vim-vsnip)                          |
| [which-key](https://github.com/folke/which-key.nvim)                       |
