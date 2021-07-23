# NeoVim Config

Hello there fellow stranger! This is my custom config to make NeoVim into a VSCode replacement or IDE. For now it has the following:
-   Code Completion
-   File Explorer
-   Git Integration
-   Icons
-   Builtin LSP
-   Snippets
-   Statusline
-   Tabline
-   Terminal Integration

## Index

-   [Prerequisite](#prerequisite)
    -   [Dependencies](#dependencies)
-   [Installation](#installation)
    -   [First Launch](#first-launch)
    -   [LSP](#lsp)
-   [Pluggins](#pluggins)
-   [Structure](#structure)
	- [Overview](#overview)
	- [TreeSitter Queries](#treesitter-queries)
	- [Settings](#settings)
	- [Keybindings](#keybindings)
	- [Pluggins](#pluggins)

## Prerequisite

-   Neovim v0.5 or [nightly](https://github.com/neovim/neovim/releases)
    builds.
-   A Patched Font (Pick your font of choice from the
    [NerdFonts](https://github.com/ryanoasis/nerd-fonts) guys)
-   Terminal emulator capable of using a patched font (For Windows you
    may try [Windows Terminal](https://github.com/Microsoft/Terminal)).
-   [Paq-nvim](https://github.com/savq/paq-nvim) (minimal package
    manager for neovim written in Lua).

### Dependencies

In order to complete the installation of the lsp’s you will need the
following packages: - `npm` - `go` - `ninja`

Most of the LSP use `npm`. `Go` and `ninja` are used for the `efm` and
`lua`.

### Windows

-   You need to install a compiler to work with TreeSitter. The one I’ve
    used was LLVM.
-   `lspinstall` won’t work. You’ve have to do it yourself.

## Installation

Currently there is not a custom installation script (for now). To use
this config, clone the repo:

	git clone https://github.com/fedepujol/nvim.git

-   **Windows**
    -   Place it inside your `~.\AppData\Local\` folder.
-   **Linux**
    -   Place it inside your `.config/` folder.

### First Launch

In the first launch of neovim, you will be notified with a lot of
errors. Mainly because the config needs the pluggins to be install and
currently there are none. To correct this errors, type:

	:PlugInstall

This will tell `Paq` to download the missing pluggins. After `Paq` has
finished, restart neovim.

#### LSP

In this config I’ve included several lsp’s (bash, css, html, etc.). If
you’re in Linux, to download the lsp’s, you must type:

	:LspInstall bash

If you are in Windows, you’ve got to do it manually (see [pr](https://github.com/kabouzeid/nvim-lspinstall/pull/96))
1.	Go to the [CONFIG.MD]() of the LspConfig project and search for the ones you want to install (almost everyone has a npm command to install it). 
2.	Go to your config dir (AppData/…./nvim-data/lspinstall).
3.	Create the folder with the name of the LSP:
	- Windows

			MD angularls

	- Linux

			mkdir angularls

4.  `cd` into that folder and execute the command. Most of the commands
    with `npm` have a `-g` flag, this will install it globally in your
    system. If you don’t want that you could do this instead:

		npm i --prefix . @angular/language-service

	*This tells `npm` to install the LSP in the folder you are currently on.

## Paq (Plugin Manager)

To manage all of them you have `Paq` (very minimal pluggin manager). It
has a few commands to interact with. - PaqInstall - PaqUpdate - PaqClean

#### Install a new Pluggin

To install new pluggins you have to do 2 things: 1. Add the new pluggin
in the `manager.lua` 2. Re-start neovim 3. Run the following command:

	:PaqInstall name-of-pluggin-to-install

#### Remove/Uninstall a pluggin

If you wish to remove a few pluggins. Follow this steps: 1. Remove the
pluggin from `manager.lua` 2. Re-start neovim 3. Run the following
command:

	:PaqClean

#### Update a Pluggin

Just run the following command:

	:PaqUpdate

#### More Info

If you want more info about how `Paq` works and other commands, go and
visit [the project page](https://github.com/savq/paq-nvim).

## Pluggins

These are the pluggins included:

|Name|Description|
|----|-----------|
|[barbar](https://github.com/romgrk/barbar.nvim)|Tabs, as understood by any other editor.|
|[colorizer](https://github.com/norcalli/nvim-colorizer.lua)|The fastest Neovim colorizer.|
|[galaxyline](https://github.com/glepnir/galaxyline.nvim)|Light-weight and Super Fast statusline plugin written in lua.|
|[gitsigns](https://github.com/lewis6991/gitsigns.nvim)|Super fast git decorations implemented purely in lua/teal.|
|[kommentary](https://github.com/b3nj5m1n/kommentary)|Neovim commenting plugin, written in lua.|
|[nvim-compe](https://github.com/hrsh7th/nvim-compe)|Auto completion plugin for nvim.|
|[nvim-lspconfig](https://github.com/kabouzeid/nvim-lspinstall)|Provides the missing :LspInstall for nvim-lspconfig.|
|[nvim-lspsaga](https://github.com/glepnir/lspsaga.nvim)|Provides LSP actions with a highly performant UI.|
|[nvim-tree](https://github.com/kyazdani42/nvim-tree.lua)|A File-Explorer tree for NeoVim written in Lua.|
|[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)|Nvim Treesitter configurations and abstraction layer.|
|[nvim-toggleterm](https://github.com/akinsho/nvim-toggleterm.lua)|A neovim lua plugin to help easily manage multiple terminal windows.|
|[nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons)|Lua fork of vim-web-devicons for NeoVim.|
|[playground](https://github.com/nvim-treesitter/playground)|Treesitter playground integrated into Neovim.|
|[telescope](https://github.com/nvim-telescope/telescope.nvim)|Find, Filter, Preview, Pick. All lua, all the time.|
|[vim-vsnip](https://github.com/hrsh7th/vim-vsnip)|Snippet plugin for vim/nvim that supports LSP/VSCode's snippet format.|
|[which-key](https://github.com/folke/which-key.nvim)|Lua plugin for Neovim 0.5 that displays a popup with possible key bindings of the command you started typing.|

## Structure

``` text
📁 ~/.config/nvim
├── 📁 after/queries
|   └── 📁 html
|       └── highlights.scm
├── 📁 lua/
│   ├── 📁 core/
|   |   ├── 📝 init.lua
|   |   ├── 📝 mappings.lua
|   |   └── 📝 settings.lua
│   └── 📁 pluggins/
│       ├── 📁 barbar/
│       ├── 📁 colorizer/
│       ...
│       ├── 📁 lsp/
│       ...
│       ├── 📁 which-key/
|       ├── 📝 manager.lua
│       └── 📝 init.lua
└─ 📝 init.lua
```

### Overview
The way the folder structure works is as `Lua modules`. Every folder has an `init.lua` that is required outside. In the `init.lua` you `require` the files you want to export.

For example in `./init.lua` you'll have something like this:

```lua
require('core')
require('pluggins')
```
And in core's `init.lua`:

```lua
require('core.mappings')
require('core.settings')
```

So, if you wanted to create the following sub-structure under `core`:
``` text
📁 lua
└── 📁 core
    ├── 📁 newFolder1
    |   ├── 📝 newFile011
    |   └── 📝 newFile012
    ├── 📁 newFolder2
    |   ├── 📝 newFile021
    |   └── 📝 newFile022
    ├── 📝 init.lua
    ├── 📝 mappings.lua
    └── 📝 settings.lua
```
You'll need to create a `init.lua` under `newFolder1` and `newFolder2`. Then required it in `core/init.lua`:
``` text
📁 lua
└── 📁 core
    ├── 📁 newFolder1
    |   ├── 📝 init.lua
    |   ├── 📝 newFile011
    |   └── 📝 newFile012
    ├── 📁 newFolder2
    |   ├── 📝 init.lua
    |   ├── 📝 newFile021
    |   └── 📝 newFile022
    ├── 📝 init.lua
    ├── 📝 mappings.lua
    └── 📝 settings.lua
```

- `core/newFolder1/init.lua`
```lua
require('newFolder1.newFile011')
require('newFolder1.newFile012')
```
- `core/newFolder2/init.lua`
```lua
require('newFolder2.newFile021')
require('newFolder2.newFile022')
```
- `core/init.lua`
```lua
require('core.mappings')
require('core.settings')
require('newFolder1')
require('newFolder2')
```
### TreeSitter Queries
In here goes your custom, language specific, queries for `treesitter`. I've created one for `HTML` that helps me in `Angular`.
- Folder: `after/queries/`

### Settings
Every setting you want to change about NeoVim goes in here.
- File: `lua/core/settings.lua`

### Keybindings
Custom keybindings
- File: `lua/core/mappings.lua`

### Pluggins
To control the pluggins you've got a few files:
- `lua/pluggins/manager.lua`
