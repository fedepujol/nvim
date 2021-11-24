# NeoVim Config

Hello there fellow stranger! This is my custom config for NeoVim,
it has been tested on Linux and Windows.

It provides the following:

-   Code Completion
-   File Explorer
-   Git Integration
-   Icons
-   LSP’s
-   Snippets
-   Statusline
-   Tabline
-   Terminal Wrapper

## Index

-   [Requirements](#requirements)
    -   [Dependencies](#dependencies)
-   [Installation](#installation)
    -   [First Launch](#first-launch)
    -   [LSP](#lsp)
    -   [Formatters](#formatters)
-   [Structure](#structure)
    -   [Overview](#overview)
    -   [TreeSitter Queries](#treesitter-queries)
    -   [Settings](#settings)
    -   [Keybindings](#keybindings)
-   [Pluggins](#pluggins)

## Requirements

-   Neovim v0.5 or [nightly](https://github.com/neovim/neovim/releases)
    builds.
-   A Patched Font (Pick your font of choice from the
    [NerdFonts](https://github.com/ryanoasis/nerd-fonts) guys)
-   Terminal emulator capable of using a patched font (For Windows you
    may try [Windows Terminal](https://github.com/Microsoft/Terminal)).
-   [Paq-nvim](https://github.com/savq/paq-nvim) (minimal package
    manager for neovim written in Lua).

### Dependencies

#### LSP

In order to complete the installation of any lsp, you’ll need the
following packages:

-   `npm`
-   `go`
-   `ninja`

Most of the LSP’s use `npm`. `Go` and `ninja` are used for the `efm` and
`lua`.

-   `ripgrep`: for Telescope
-   `lazygit`: for Lazygit integration
-   `delta`: for diffview

#### Formatters

| Package     | Language   |
|-------------|------------|
| js-beautify | HTML, CSS  |
| prettier    | JSON, YAML |
| lua-format  | Lua        |
| pandoc      | markdown   |

## Installation

Currently there is not a custom installation script (for now). To use
this config, clone the repo:

    git clone https://github.com/fedepujol/nvim.git

-   **Windows**
    -   Place it inside your `~.\AppData\Local\` folder.
-   **Linux**
    -   Place it inside your `.config/` folder.

### First Launch

In the first launch, you’ll be notified with a lot of errors. Mainly
because the config needs the pluggins to be install and currently there
are none. To correct this errors, type:

    :PaqInstall

This will tell `Paq` to download the missing pluggins. After `Paq` has
finished, restart neovim.

#### LSP

I’ve included several lsp’s (bash, css, html, etc.), to download the
lsp’s, just type:

    :LspInstall bashls

To view all available LSP’s to download:

    :LspInstallInfo

If you want an Lsp that it’s not listed, check custom installation
[methods](https://github.com/williamboman/nvim-lsp-installer/blob/main/CUSTOM_SERVERS.md).

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
│       ├── 📁 colors/
│       ├── 📁 completion/
│       ...
│       ├── 📁 lsp/
│       ...
|       ├── 📝 manager.lua
│       └── 📝 init.lua
└─ 📝 init.lua
```

### Plugin Folder Structure

| Folder Name    | Description                                   |
|----------------|-----------------------------------------------|
| 📁colors        | Every color related plugin                    |
| 📁completion    | Completion system                             |
| 📁ef            | Editor functions (autopairs, comment, tabout) |
| 📁git           | Git Integration                               |
| 📁keys          | Plugins related to keymapping                 |
| 📁lsp           | Lsp config and servers                        |
| 📁telescope     | Telescope                                     |
| 📁treesiter     | Treesitter functionality                      |
| 📁ui-components | UI Plugins (File-Manager, Statusline, etc)    |

### Overview

The way the folder structure works is as `Lua modules`. Every folder has
an `init.lua` that is required outside. In the `init.lua` you `require`
the files you want to export.

For example in `./init.lua` you’ll have something like this:

``` lua
require('core')
require('pluggins')
```

And in core’s `init.lua`:

``` lua
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

You’ll need to create a `init.lua` under `newFolder1` and `newFolder2`.
Then required it in `core/init.lua`:

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

-   `core/newFolder1/init.lua`

``` lua
require('newFolder1.newFile011')
require('newFolder1.newFile012')
```

-   `core/newFolder2/init.lua`

``` lua
require('newFolder2.newFile021')
require('newFolder2.newFile022')
```

-   `core/init.lua`

``` lua
require('core.mappings')
require('core.settings')
require('newFolder1')
require('newFolder2')
```

### TreeSitter Queries

In here goes your custom, language specific, queries for `treesitter`.
I’ve created one for `HTML` that helps me in `Angular`.

-   Folder: `after/queries/`

### Settings

Every setting you want to change about NeoVim goes in here.

-   File: `lua/core/settings.lua`

### Keybindings

NeoVim related keybindings

-   File: `lua/core/mappings.lua`

Pluggins keybindings:

-   File: `lua/pluggins/which-key/init.lua`

## Pluggins

These are the pluggins included:

| Name                                                                     | Description                                                            |
|--------------------------------------------------------------------------|------------------------------------------------------------------------|
| [Comment](https://github.com/numToStr/Comment.nvim)                      | Neovim commenting plugin, written in lua.                              |
| [barbar](https://github.com/romgrk/barbar.nvim)                          | Tabs, as understood by any other editor.                               |
| [better-escape](https://github.com/max397574/better-escape.nvim)         | Escape from insert mode without delay when typing                      |
| [colorizer](https://github.com/norcalli/nvim-colorizer.lua)              | The fastest Neovim colorizer.                                          |
| [feline](https://github.com/famiu/feline.nvim)                           | Light-weight and Super Fast statusline plugin written in lua.          |
| [gitsigns](https://github.com/lewis6991/gitsigns.nvim)                   | Super fast git decorations implemented purely in lua/teal.             |
| [lush](https://github.com/rktjmp/lush.nvim)                              | Define Neovim themes as a DSL in lua, with real-time feedback.         |
| [nvim-autopairs](https://github.com/windwp/nvim-autopairs)               | Autopairs for NeoVim written in Lua.                                   |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)                          | A completion plugin for neovim coded in Lua.                           |
| [nvim-lsp-installer](https://github.com/williamboman/nvim-lsp-installer) | Install LSP servers.                                                   |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)               | Quickstart configurations for the Nvim LSP client                      |
| [nvim-lspsaga](https://github.com/tami5/lspsaga.nvim)                    | Provides LSP actions with a highly performant UI.                      |
| [nvim-toggleterm](https://github.com/akinsho/nvim-toggleterm.lua)        | A neovim lua plugin to help easily manage multiple terminal windows.   |
| [nvim-tree](https://github.com/kyazdani42/nvim-tree.lua)                 | A File-Explorer tree for NeoVim written in Lua.                        |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)    | Nvim Treesitter configurations and abstraction layer.                  |
| [nvim-ts-rainbow](https://github.com/p00f/nvim-ts-rainbow)               | Rainbow parentheses for neovim using tree-sitter                       |
| [nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons)     | Lua fork of vim-web-devicons for NeoVim.                               |
| [playground](https://github.com/nvim-treesitter/playground)              | Treesitter playground integrated into Neovim.                          |
| [shipwright](https://github.com/rktjmp/shipwright.nvim)                  | Ship it wright this time, formerly LushBuild.                          |
| [tabout.nvim](https://github.com/abecodes/tabout.nvim)                   | tabout plugin for neovim                                               |
| [telescope](https://github.com/nvim-telescope/telescope.nvim)            | Find, Filter, Preview, Pick. All lua, all the time.                    |
| [vim-visual-multi](https://github.com/mg979/vim-visual-multi)            | Multiple cursors plugin for vim/neovim                                 |
| [vim-vsnip](https://github.com/hrsh7th/vim-vsnip)                        | Snippet plugin for vim/nvim that supports LSP/VSCode’s snippet format. |
| [which-key](https://github.com/folke/which-key.nvim)                     | Popup with possible key bindings of the command you started typing.    |

To control the pluggins you’ve got a few files:

-   `lua/pluggins/manager.lua`: Add/Remove the pluggins from this file.
-   `lua/pluggins/init.lua`: Add/Remove the module configuration.

And `Paq` (Plugin Manager).

### Paq (Plugin Manager)

To manage all of them you have `Paq` (minimal pluggin manager). It has a
few commands to interact with.

-   PaqInstall
-   PaqUpdate
-   PaqClean
-   PaqSync (runs PaqInstall-PaqUpdate-PaqClean)
-   PaqList
-   PaqRunHooks

#### Install a new Pluggin

To install new pluggins you have to do 3 things:

1.  Add the new pluggin in the `manager.lua`

2.  Re-start Neovim

3.  Run the following command:

         :PaqInstall name-of-pluggin-to-install

#### Remove/Uninstall a pluggin

If you wish to remove a few pluggins. Follow this steps:

1.  Remove the pluggin from `lua/pluggins/manager.lua`

2.  Re-start neovim

3.  Run the following command:

        :PaqClean

#### Update a Pluggin

Just run the following command:

    :PaqUpdate

#### More Info

If you want more info about how `Paq` works and other commands, go and
visit [the project page](https://github.com/savq/paq-nvim).
