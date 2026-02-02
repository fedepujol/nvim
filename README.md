# Neovim Config

This is custom config was tested on *Linux* and *Windows*

Included:

- Code Completion
- File Explorer
- Git Integration
- Icons
- LSP’s
- Snippets
- Statusline
- Bufferline
- Terminal Wrapper
- And more!

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

## Requirements

- Neovim v0.11.0 or [nightly](https://github.com/neovim/neovim/releases) builds.
- A Patched Font (Pick your font of choice from the [NerdFonts](https://github.com/ryanoasis/nerd-fonts) guys)
- Terminal emulator capable of using a patched font (For Windows you may try [Windows Terminal](https://github.com/Microsoft/Terminal)).

>[!note]
If you're using this configuration with Neovim 0.6/0.6.1, you'll have to deal
with the formatters outputting wrong `eol` on `Windows` files (`fileformat=dos`)
More info in `:h fileformat`

## Installation

- Windows
  - Open a `CMD`/`PowerShell`/`Bash`
  - Navigate to `~\AppData\Local` (C:\\Users\\your_user\\AppData\\Local)
  - Clone the repo with `git clone https://github.com/fedepujol/nvim.git`

- Linux
  - Open a terminal (it depends on your distribution)
  - Navigate to `~/.config/`
  - Clone the repo with `git clone https://github.com/fedepujol/nvim.git`

### First Launch

On first launch, *lazy* package manager will download
every plugin declared on the folder `/lua/plugins` and on `/lua/core/lazy.lua` file.

After this, re-open Neovim. Then when you open a file, `lspconfig`
will download the LSP's configured in the file `/lua/plugins/lspconfig.lua`.

| LSP           | File                   |
| ------------- | ---------------------- |
| angularls     | HTMLAngular/TypeScript |
| bashls        | SH/Bash                |
| cssls         | CSS                    |
| html          | HTML                   |
| lua_ls        | Lua                    |
| marksman      | Markdown               |
| harper_ls     | Markdown               |
| tsserver      | TypeScript             |
| vimlsp        | Vim                    |
| yamllsp       | YAML                   |

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

I’ve included several LSP's initializations (Bash, CSS, HTML, etc.) in
`lua/plugins/lspconfig.lua`.

These are maintained in `nvim-lspconfig` repo. There you'll find the configurations
for several servers. If you want one, just take the config and paste it on the file.
If you want more control, change the default values.
A lot of time, you'll have something like this:

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

### Plug in Folder Structure

This repo follows the **plugin structure** of `lazy.nvim`. If you want to know more
visit the [repo](https://github.com/folke/lazy.nvim).

## Settings

- File: `lua/core/settings.lua`

Every piece of setting you want to change about Neovim goes in here.

## Keybindings

Neovim related keybindings

- File: `lua/core/mappings.lua`

Plugins keybindings:

- File: `lua/core/whichkey.lua`

