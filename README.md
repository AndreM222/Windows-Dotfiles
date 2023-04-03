# Windows Dotfiles

<p align='center'>
<img style='padding-bottom:10px' src="Terminal-Preview_1.png">
<img style='padding-bottom:10px' src="Terminal-Preview_2.png">
<img src="Terminal-Preview_3.png">
</p>

## Windows Terminal 🖥️

```
--- Split ---

(ctrl + alt + down) - Split Down
(ctrl + alt + up) - Split Up
(ctrl + alt + right) - Split Right
(ctrl + alt + left) - Split Left
```

```
--- Resize ---

(alt + shift + down) - Resize Down
(alt + shift + up) - Resize Up
(alt + shift + right) - Resize Right
(alt + shift + left) - Resize Left
```

```
--- Windows ---

(ctrl + shift + w) - Close Window
(ctrl + shift + t) - New Window
(ctrl + tab) - Switch Tab
(alt + shift + right) - Switch Split right
(alt + shift + left) - Switch Split left
(alt + shift + up) - Switch Split up
(alt + shift + down) - Switch Split down
```

```
Duplicate Split Pane:
https://learn.microsoft.com/en-us/windows/terminal/tutorials/new-tab-same-directory

Center On Startup:
https://learn.microsoft.com/en-us/windows/terminal/customize-settings/startup

Default Size Startup:
Columns: 190
Rows: 50

Opacity Config: 80

Font Size: 9
```

## Font 🖌️

- [JetBrainsMonoNL NFM](https://www.nerdfonts.com/font-downloads) - Font

## Theme 🎭

- [Dracula](https://github.com/Mofiqul/dracula.nvim) - Dracula Color Theme

## Terminal 📟

- Windows terminal - Terminal
- [PowerShell](https://learn.microsoft.com/en-us/powershell/) - Shell

## Setup ⚒️

- [Scoop](https://scoop.sh/) - `irm get.scoop.sh | iex`
- [Fira-Font](https://scoop.sh/#/apps?q=firacode&s=0&d=1&o=true) - `scoop install FiraCode-NF-Mono`
- [Git](https://git-scm.com/download/win) - `winget install --id Git.Git`
- [Sudo & Curl](https://scoop.sh/#/) - `scoop install curl sudo jq`
- [SQLite | MySQL](https://scoop.sh/#/apps?q=SQLITE&s=0&d=1&o=true) - `scoop install sqlite`
- [Neovim](https://scoop.sh/#/apps?q=neovim&s=0&d=1&o=true) - `scoop install neovim`
- [Packer](https://github.com/wbthomason/packer.nvim) - `git clone https://github.com/wbthomason/packer.nvim "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim"`
- [Oh-My-Posh](https://scoop.sh/#/apps?q=oh+my+posh&s=0&d=1&o=true) - `scoop bucket add main`
- [Oh-My-Posh](https://scoop.sh/#/apps?q=oh+my+posh&s=0&d=1&o=true) - `scoop install oh-my-posh`
- [Terminal-Icons](https://github.com/devblackops/Terminal-Icons) - `Install-Module -Name Terminal-Icons -Repository PSGallery -Force`
- [PSReadLine](https://github.com/PowerShell/PSReadLine) - `Install-Module PSReadLine -AllowPrerelease -Force`
- [Yarn & NodeJS](https://scoop.sh/#/) - `scoop install yarn`
- [NVM](https://scoop.sh/#/apps?q=nvm&s=0&d=1&o=true) - `scoop install nvm`
- [Make](https://scoop.sh/#/apps?q=make&s=0&d=1&o=true) - `scoop install make`
- [Dotnet](https://scoop.sh/#/apps?s=0&d=1&o=true&q=dotnet) - `scoop install dotnet-sdk`
- [Dotnet-Nuget](https://learn.microsoft.com/en-us/dotnet/core/tools/dotnet-nuget-add-source#examples)- `dotnet nuget add source https://api.nuget.org/v3/index.json -n nuget.org`

## Servers 🗃️

`Live-Server` npm install -g live-server

`Python` npm install -g pyright

`Typescript` npm install -g typescript-language-server

`C++` scoop install clangd

`Lua` scoop install lua-language-server

`LaTeX` scoop install texlab 

`C-Sharp` At the installation of dotnet

## Format Languages 📄

`Python` pip install --upgrade autopep8

`Typescript` npm install -g prettier

`C Languages` scoop install astyle

`Latex` scoop install latexindent

## Neovim Plugins 📲

- [Packer](https://github.com/wbthomason/packer.nvim) - Nvim Plugin Installer
- [Lualine](https://github.com/nvim-lualine/lualine.nvim) - Neovim Bar
- [nvim-Web-Devicons](https://github.com/kyazdani42/nvim-web-devicons) - Icons
- [Nvim-Tree](https://github.com/kyazdani42/nvim-tree.lua) - Neovim Tree
- [LSPConfig](https://github.com/neovim/nvim-lspconfig) - Keys Configuration
- [Plenary](https://github.com/nvim-lua/plenary.nvim) - Plenary
- [Telescope](https://github.com/nvim-telescope/telescope.nvim) - Telescope
- [Telescope Browser](https://github.com/nvim-telescope/telescope-file-browser.nvim) - Telescope File Browser
- [Markdown Preview](https://github.com/iamcco/markdown-preview.nvim) - Live Markdown Preview
- [Nvim-CMP](https://github.com/hrsh7th/nvim-cmp) - Auto Complete Setup
- [Lspkind-Nvim](https://github.com/onsails/lspkind.nvim) - Icons for Nvim LSP
- [Mason-nvim](https://github.com/williamboman/mason.nvim) - Language server installer
- [Mason-Null-LS](https://github.com/jay-babu/mason-null-ls.nvim) - Integrate Null-LS with Mason
- [Mason-LspConfig](https://github.com/williamboman/mason-lspconfig.nvim) - Integrate LspConfig with mason 
- [Mason-Dap](https://github.com/jay-babu/mason-nvim-dap.nvim) - Integrate Dap With Mason
- [Buffer-Line](https://github.com/akinsho/bufferline.nvim) - File Tabs
- [Git-Signs](https://github.com/lewis6991/gitsigns.nvim) - Git Changes Sign Bar
- [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - Highlight Functions
- [Comment](https://github.com/numToStr/Comment.nvim) - Commenter For Languages
- [Auto-Pair](https://github.com/jiangmiao/auto-pairs) - Auto Pair Characters
- [Close-Tag](https://github.com/alvan/vim-closetag) - Close Tags
- [LuaSnip](https://github.com/L3MON4D3/LuaSnip) - Snippets
- [Hexokinase](https://github.com/RRethy/vim-hexokinase) - Color Preview
- [Null-LS](https://github.com/jose-elias-alvarez/null-ls.nvim) - Formatting Languages
- [Indent-Blankline](https://github.com/lukas-reineke/indent-blankline.nvim) - Indent Lines
- [Nvim-Notify](https://github.com/rcarriga/nvim-notify) - Animated Notifications
- [Lspsaga](https://github.com/glepnir/lspsaga.nvim) - LSP UI
- [VGit](https://github.com/tanvirtin/vgit.nvim) - Visual Git
- [DAP](https://github.com/mfussenegger/nvim-dap) - Debugger
- [DAP-UI](https://github.com/rcarriga/nvim-dap-ui) - Debugger UI
- [DAP-Virtual-Text](https://github.com/theHamsta/nvim-dap-virtual-text) - Debugger Text Highlight
- [Minimap](https://github.com/gorbit99/codewindow.nvim) - Minimap Code Preview
- [Nvim-UFO](https://github.com/kevinhwang91/nvim-ufo) - Folding Design
- [Vim-Illuminate](https://github.com/RRethy/vim-illuminate) - Highlight
- [Nvim-Surround](https://github.com/kylechui/nvim-surround) - Sorround Selection With Desired Character
- [Vim-Visual-Multi](https://github.com/mg979/vim-visual-multi) - Multiple Cursors Like Submlime

## Installations ⬇️

- [Miktek](https://miktex.org/) - LaTeX Compiler

- [Strawberry Pearl](https://strawberryperl.com/) - Libraries

## Compilers And Intrepeters ⚙️

- [NodeJS](https://scoop.sh/#/apps?s=0&d=1&o=true&q=nodejs) - scoop install nodejs

- [CPP - CLANG](https://scoop.sh/#/apps?q=llvm&s=0&d=1&o=true) - scoop install mingw-winlibs-llvm

- [Python](https://www.python.org/downloads/) - Python Compiler

## Directory Structure 🗂️

```
📂 $HOME/AppData/Local/Nvim
|__📂after/plugin
|__📂lua
|   |__📄plugins.lua
|   |__📄theme.lua
|__📄init.lua

📂$HOME/.config/powershell
|__📄user_profile.ps1
|__📂themes
    |__📄minimalNight.omp.json
```

## Info ℹ️

Read: `To visualize on vim the keybindings press F3. I also documented all my custom bindings.`

<details>

<summary>Custom Mappings ⌨️</summary>

`\ + f` - Telescope Find Files

`\ + r` - Telescope Live Grep

`\ + \ + \` - Telescope Buffers

`\ + t` - Telescope

`\ + r` - Telescope Resume Search

`\ + w` - Telescope Diagnostics

`F2` - Telescope Help Tags

`F3` - Telescope Keymaps

`F5` - Lsp Status

`F6` - Null-LS Status

`\ + m` - Minimap Toggle

`\ + P` - Markdown Preview Toggle

`Ctrl - s` - Save

`Ctrl - Alt - s` Save All

`Alt - w` - Save And Quit All

`Alt - q` - Force Quit All

`Shift - Up` - Move Line | Block up

`Shift - Down` - Move Line | Block Down

`Shift - Left` - Move Line | Block Left

`Shift - Right` - Move Line | Block Right

`Shift - f` - Format

`CTRL - c` - Color Picker

`f` - Lspsaga Hover Doc

`g + d` - lspsaga Finder

`g + p` - Lspsaga Peek Definition

`g + r` - Lspsaga Rename

`A - k` - Increase Pane Vertical

`A - i` - Decrease Pane Vertical

`A - l` - Increase Pane Horizontal

`A - j` - Decrease Pane Horizontal

`A - Up` - Pane Move Up

`A - Down` - Pane Move Down

`A - Left` - Pane Move Left

`A - Right` - Pane Move Right

`F9` - Debugger Continue

`F10` - Debugger Step Over

`F11` - Debugger Step Into

`F12` - Debugger Step Out

`b` - Debugger Breakpoint

`B` - Debugger Breakpoint With Conditions

`lp` - Debugger Breakpoint With Log Message

`dr` - Debugger Toggle

`CTRL - g` - Git Buffer Hunk Preview Current

`Alt - g` - Git Buffer Gutter Blame Preview Current

`\g` - Git Project Diff Preview

`S - g` - Git Toggle Diff Preference

`CTRL - Alt - c` - Copy

`CTRL - Alt - v` - Paste

`=` - Open Fold

`-` - Close Fold

`+` - Open All Folds

`_` - Close All Folds

`CTRL - /` - Comment Line In Line

`CTRL - Alt - /` - Comment BLock

`CTRL - a` - Select All

`CTRL - p` - Add Cursor At Current Position
</details>

<details>
<summary>Debugging 🐞</summary>

Problem:
```
The script autopep8.exe is installed in 'C:\Users\YOURNAME\AppData\Roaming\Python\Python311\Scripts' 
which is not on PATH. Consider adding this directory to PATH or, if you prefer to suppress this warning,
use --no-warn-script-location.
```
Fix: `Add environment variable to path: (C:\Users\YOURNAME\AppData\Roaming\Python\Python311\Scripts)`

Problem: `Icons are not showing completly`

Fix:
```
Some fonts do not work well with some color themes and can cause that issue or the terminal. 
You have to try until you find the right font, switch the theme, terminal or make tweaks by yourself. Generaly fonts ending with mono work.
```
problem: `Transparency Not Available`

Fix: 
```
Check you enabled transparency in the temrinal. If you still encounter
problems then you probably have to enable it from your nvim configuration.
Dracula theme transparency is not sufficient so some tweaks are requried.
For example:
                colors = { bg = "NONE" },
                transparent_bg = true,
                show_end_of_buffer = true,
                overrides = {
                    EndOfBuffer = { fg = "#282A36" }
                },

This will disable the background from dracula so transparency can be seen.
```

Problem: `C-Sharp not running`

Fix: `You are required to create a project for it to work`

</details>
