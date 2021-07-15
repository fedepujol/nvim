# NeoVim Config

Hello there fellow stranger! This is my custom config to make NeoVim into a VSCode replacement. This is not a full replacement but It comes very close.

## Index
-   [Features](#features)
-   [Prerequisite](#prerequisite)
	-   [Dependencies](#dependencies)
-   [Installation](#installation)
	-   [First Launch](#first-launch)
    -   [LSP](#lsp)
-   [Project Structure](#structure)
-   [Pluggins](#pluggins)

## Features
-   Code Completion
-   File Explorer
-   Git Integration
-   Icons
-   Builtin LSP
-   Snippets
-   Statusline
-   Tabline

## Prerequisite
- Neovim v0.5 or [nightly](https://github.com/neovim/neovim/releases) builds.
- A Patched Font (Pick your font of choice from the [NerdFonts](https://github.com/ryanoasis/nerd-fonts) guys)
- Terminal emulator capable of using a patched font (For Windows you may try [Windows Terminal](https://github.com/Microsoft/Terminal)).
- [Paq-nvim](https://github.com/savq/paq-nvim) (minimal package manager for neovim written in Lua).

### Dependencies
In order to complete the installation of the lsp's you will need the following packages:
- `npm`
- `go`
- `ninja`

Most of the LSP use `npm`. `Go` and `ninja` are used for the `efm` and `lua`.

### Windows
- You need to install a compiler to work with TreeSitter. The one I've used was LLVM.
- `lspinstall` won't work. You've have to do it yourself.

## Installation
Currently there is not a custom installation script (for now). To use this config, clone the repo:
```
git clone https://github.com/fedepujol/nvim.git 
```

- **Windows**
    - Place it inside your `~.\AppData\Local\` folder.
- **Linux**
    - Place it inside your `.config/` folder.

### First Launch

In the first launch of neovim, you will be notified with a lot of errors. Mainly because the config needs the pluggins to be install and currently there are none. To correct this errors, type:
```
:PlugInstall
```
This will tell `Paq` to download the missing pluggins. After `Paq` has finished, restart neovim.

#### LSP
In this config I've included several lsp's (bash, css, html, etc.). 
If you're in Linux, to download the lsp's, you must type:
```
:LspInstall bash
```
If you are in Windows, you've got to do it manually.
1. Go to the [CONFIG.MD]() of the LspConfig project and search for the ones you want to install (almost everyone has a npm command to install it)
2. Go to your config dir (AppData/..../nvim-data/lspinstall)
3. Create the folder with the name of the LSP like:
```
MD angularls
```
4. `Cd` into that folder and execute the command. 
Most of the commands with `npm` have a `-g` flag, this will install it globally in your system. If you don't want that you could do this instead:
```
npm i --prefix . @angular/language-service
```
What that command does is tell npm to install the LSP in the folder you are currently on.

## Paq (Plugin Manager)
To manage all of them you have `Paq` (very minimal pluggin manager). It has a few commands to interact with.
- PaqInstall
- PaqUpdate
- PaqClean

#### Install a new Pluggin
To install new pluggins you have to do 2 things:
1. Add the new pluggin in the `manager.lua`
2. Re-start neovim
3. Run the following command:
```
:PaqInstall name-of-pluggin-to-install
```
#### Remove/Uninstall a pluggin
If you wish to remove a few pluggins. Follow this steps:
1. Remove the pluggin from `manager.lua`
2. Re-start neovim
3. Run the following command:
```
:PaqClean
```
#### Update a Pluggin
Just run the following command:
```
:PaqUpdate
```

#### More Info
If you want more info about how `Paq` works and other commands, go and visit [the project page](https://github.com/savq/paq-nvim).

## Pluggins
These are the pluggins included:

-   [barbar](https://github.com/romgrk/barbar.nvim)
-   [colorizer](https://github.com/norcalli/nvim-colorizer.lua)
-   [galaxyline](https://github.com/glepnir/galaxyline.nvim)
-   [gitsigns](https://github.com/lewis6991/gitsigns.nvim)
-   [kommentary](https://github.com/b3nj5m1n/kommentary)
-   [nvim-compe](https://github.com/hrsh7th/nvim-compe)
-   [nvim-lspconfig](https://github.com/kabouzeid/nvim-lspinstall)
-   [nvim-lspsaga](https://github.com/glepnir/nvim-lspsaga)
-   [nvim-tree](https://github.com/lewis6991/nvim-tree.lua)
-   [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
-   [nvim-toggleterm](https://github.com/akinsho/nvim-toggleterm.lua)
-   [nvim-web-devicons](https://github.com/norcalli/nvim-web-devicons)
-   [playground](https://github.com/nvim-treesitter/playground)
-   [telescope](https://github.com/nvim-telescope/teslecope.nvim)
-   [vim-vsnip](https://github.com/hrsh7th/vim-vsnip)
-   [which-key](https://github.com/folke/which-key.nvim)

## Structure

``` text
📁 ~/.config/nvim
├── 📁 lua/
│   ├── 📁 general/
|   |   └── 📝 general.lua
│   ├── 📁 pluggins/
│   |   ├── 📁 barbar/
│   |   ...
│   |   ├── 📝 init.lua
│   |   └── 📝 settings.lua
│   └── 📁 theme/
│       ├── 📁 compe
│       ...
│       ├── 📝 colors.lua
│       └── 📝 init.lua
└─ 📝 init.lua
```
