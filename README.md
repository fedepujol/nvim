# NeoVim Config

Hello there fellow stranger! This is my custom config for NeoVim, it has been
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
  - [Dependencies](#dependencies)
    - [Essentials](#essentials)
    - [Optionals](#optionals)
- [Installation](#installation)
  - [First Launch](#first-launch)
  - [Language Server Protocol](#language-server-protocol)
    - [Install](#install)
    - [Configuration](#configuration)
    - [Formatters and Linters](#formatters-and-linters)
- [Structure](#structure)
  - [Overview](#overview)
- [TreeSitter Queries](#treesitter-queries)
- [Settings](#settings)
- [Keybindings](#keybindings)
- [Plugins](#plugins)

## Requirements

- Neovim v0.6.1 or [nightly](https://github.com/neovim/neovim/releases)
    builds.
- A Patched Font (Pick your font of choice from the
    [NerdFonts](https://github.com/ryanoasis/nerd-fonts) guys)
- Terminal emulator capable of using a patched font (For Windows you may try
    [Windows Terminal](https://github.com/Microsoft/Terminal)).
- [Paq-nvim](https://github.com/savq/paq-nvim) (minimal package manager for
    neovim written in Lua).

If you're using this configuration with NeoVim 0.6/0.6.1, you'll have to deal
with the formatters outputing wrong `eol` in `Windows` files (fileformats=dos).
There's an issue on NeoVim which is already merge.

The solution is to use a nightly build (v0.7.0).

### Dependencies

In order to complete the installation process of this config, you’ll need the following
packages:

#### Essentials

This packages are for the most common use of plugins such as `Telescope`
and if you want to install and use Lsp's.

| Category   | Package          |  Use       |
|------------|------------------|------------|
| Lsp        | NPM              | Install    |
| Lsp        | Ninja            | Install    |
| Plugin     | ripgrep          | Telescope  |

#### Optionals

To enhanced your experience with this configuration, I'll suggest to
download the following:

| Category   | Package          |  Use       |
|------------|------------------|------------|
| Formatter  | Prettier         | YAML       |
| Formatter  | js-beautify      | HTML, CSS  |
| Formatter  | lua-format       | Lua        |
| Formatter  | markdownlint-cli | Markdown   |
| Linter     | JsonLint         | Json       |
| Linter     | Shellcheck       | shell      |
| Linter     | Vint             | VimScript  |
| Linter     | YamlLint         | YAML       |
| Plugin     | delta            | Delta      |
| Plugin     | lazygit          | Lazygit    |

You could use other formatters and linters too! or skip the download
if you don't interact with those languages at all.

If you like `pandoc` more than `markdownlint-cli` as a markdown formatter, you
could change it. All you need to do is create the following configuration in
`lua/plugins/lsp/servers/null-ls.lua`:

``` lua
local pandoc = helpers.make_builtin({
    name = 'pandoc',
    method = null_ls.methods.FORMATTING,
    filetypes = { 'markdown' },
    generator_opts = {
        command = 'pandoc',
        args = {
            '-f', 'gfm',
            '-t', 'gfm',
            '--columns=80'
        },
        to_stdin = true,
    },
    factory = helpers.formatter_factory
})

local sources = {
--...
   pandoc,
}
```

And comment the line `builtins.formatting.markdownlint`

## Installation

Currently there is not a custom installation script (for now). To use this
config follow this steps:

- Windows

  - Open a `CMD`/`PowerShell`/`Bash`
  - Navigate to `~\AppData\Local` (C:\\Users\\your_user\\AppData\\Local)
  - Clone the repo with `git clone https://github.com/fedepujol/nvim.git`

- Linux

  - Open a terminal (it depends on your distribution)
  - Navigate to `~/.config/`
  - Clone the repo with `git clone https://github.com/fedepujol/nvim.git`

### First Launch

In the first launch, you’ll be notified with a lot of errors. Mainly because the
config needs the plugins to be install and currently there are none. To correct
this, type:

```text
:PaqInstall
```

This will tell `Paq` to download all the plugins. After `Paq` has finished,
restart neovim.

### Language Server Protocol

Neovim has integrated a lot of cool features, one of them is the ability to 
interact with `language servers` to get some auto-completions, diagnostics and
more based on the language you're using.

#### Install

To install a server you'll use the plugin `nvim-lsp-installer` by typing:

```text
:LspInstall name-of-server
```

To view all available servers to download and managed the ones you've got:

```text
:LspInstallInfo
```

If you want an Lsp that it’s not listed, check custom installation
[methods](https://github.com/williamboman/nvim-lsp-installer/blob/main/CUSTOM_SERVERS.md).

#### Configuration

I’ve included several lsp’s configuration files (bash, css, html, etc.) under
`lua/plugins/lsp/servers`.

This files are maintained in `nvim-lspconfig` repo. There you'll find the configurations
for several servers. If you want one, just take the config and change some of
the default values to make it work. A lot of the times, you'll have something like this:

```lua
require('lspconfig').tsserver.setup({})
```

The `setup` function already has default values, which in most cases works out of the box.
But you'll need to change the `cmd` option which tells where is the server file to execute it:

```lua
require('lspconfig').tsserver.setup({
	cmd = { 'path-to-server'},
)
```

Then install the server:

```text
:LspInstall tsserver
```

And you're ready to go!

#### Formatters and Linters

Depending on the Language server, it may or may not include a formatter/linter.

If you want to configure an additional formatter/linter for an specific language,
you should check [null-ls.nvim](https://github.com/jose-elias-alvarez/null-ls.nvim) to integrate them into the mix.
Also see `/lua/plugins/lsp/servers/null-ls.lua`.

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
│   └── 📁 plugins/
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

| Folder Name  | Description                                   |
|--------------|-----------------------------------------------|
| 📁colors     | Every color related plugin                    |
| 📁completion | Completion system                             |
| 📁ef         | Editor functions (autopairs, comment, tabout) |
| 📁git        | Git Integration                               |
| 📁keys       | Plugins related to keymapping                 |
| 📁lsp        | Lsp config and servers                        |
| 📁telescope  | Telescope                                     |
| 📁treesiter  | Treesitter functionality                      |
| 📁ui         | UI Plugins (File-Manager, Statusline, etc)    |

### Overview

The way the folder structure works is as `Lua modules`. Every folder has an
`init.lua` that is required outside. In the `init.lua` you `require` the files
you want to export.

For example in `./init.lua` you’ll have something like this:

``` lua
require('core')
require('plugins')
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

You’ll need to create a `init.lua` under `newFolder1` and `newFolder2`. Then
required it in `core/init.lua`:

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

``` lua
require('newFolder1.newFile011')
require('newFolder1.newFile012')
```

- `core/newFolder2/init.lua`

``` lua
require('newFolder2.newFile021')
require('newFolder2.newFile022')
```

- `core/init.lua`

``` lua
require('core.mappings')
require('core.settings')
require('newFolder1')
require('newFolder2')
```

## TreeSitter Queries

- Folder: `after/queries/`

In here goes your custom-language-specific queries for `treesitter`. I’ve
created one for `HTML` that helps me with `Angular`.

## Settings

- File: `lua/core/settings.lua`

Every setting you want to change about NeoVim goes in here.

## Keybindings

NeoVim related keybindings

- File: `lua/core/mappings.lua`

Pluggins keybindings:

- File: `lua/plugins/which-key/init.lua`

## Plugins

These are the plugins included:

| Name                                                                     |
|--------------------------------------------------------------------------|
| [Comment](https://github.com/numToStr/Comment.nvim)                      |
| [barbar](https://github.com/romgrk/barbar.nvim)                          |
| [better-escape](https://github.com/max397574/better-escape.nvim)         |
| [colorizer](https://github.com/norcalli/nvim-colorizer.lua)              |
| [gitsigns](https://github.com/lewis6991/gitsigns.nvim)                   |
| [heirline](https://github.com/rebelot/heirline.nvim)                     |
| [lush](https://github.com/rktjmp/lush.nvim)                              |
| [null-ls](https://github.com/jose-elias-alvarez/null-ls.nvim)            |
| [nvim-autopairs](https://github.com/windwp/nvim-autopairs)               |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)                          |
| [nvim-lsp-installer](https://github.com/williamboman/nvim-lsp-installer) |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)               |
| [nvim-lspsaga](https://github.com/tami5/lspsaga.nvim)                    |
| [nvim-toggleterm](https://github.com/akinsho/nvim-toggleterm.lua)        |
| [nvim-tree](https://github.com/kyazdani42/nvim-tree.lua)                 |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)    |
| [nvim-ts-rainbow](https://github.com/p00f/nvim-ts-rainbow)               |
| [nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons)     |
| [playground](https://github.com/nvim-treesitter/playground)              |
| [shipwright](https://github.com/rktjmp/shipwright.nvim)                  |
| [tabout.nvim](https://github.com/abecodes/tabout.nvim)                   |
| [telescope](https://github.com/nvim-telescope/telescope.nvim)            |
| [vim-visual-multi](https://github.com/mg979/vim-visual-multi)            |
| [vim-vsnip](https://github.com/hrsh7th/vim-vsnip)                        |
| [which-key](https://github.com/folke/which-key.nvim)                     |

To control the plugins you’ve got a few files:

- `lua/plugins/manager.lua`: Add/Remove the plugins from this file.
- `lua/plugins/init.lua`: Add/Remove the module configuration.

And `Paq` (Plugin Manager).

### Paq (Plugin Manager)

To manage all of them you have `Paq` (minimal plugin manager). It has a few
commands to interact with.

- PaqInstall
- PaqUpdate
- PaqClean
- PaqSync (runs PaqInstall-PaqUpdate-PaqClean)
- PaqList
- PaqRunHooks

#### Install a new Plugin

To install new plugins you have to do 3 things:

1. Add the new plugin in the `manager.lua`

2. Re-start Neovim

3. Run the following command:

```text
    :PaqInstall name-of-plugin-to-install
```

#### Remove/Uninstall a plugin

If you wish to remove a few plugins. Follow this steps:

1. Remove the plugin from `lua/plugins/manager.lua`

2. Re-start neovim

3. Run the following command:

```text
   :PaqClean
```

#### Update a Plugin

Just run the following command:

```text
    :PaqUpdate
```

#### More Info

If you want more info about how `Paq` works and other commands, go and visit
[the project page](https://github.com/savq/paq-nvim).
