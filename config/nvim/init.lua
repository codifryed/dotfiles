## Guys new NeoVim setup with VSCode

-- Both envs

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.incsearch = true
vim.opt.scrolloff = 12
vim.opt.scrollback = 100000
vim.opt.isfname:append("@-@")

vim.opt.colorcolumn = "100"

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 50
vim.o.timeout = true
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

--vim.keymap.set("n", "<leader>vwm", function()
--  require("vim-with-me").StartVimWithMe()
--end)
--vim.keymap.set("n", "<leader>svwm", function()
--  require("vim-with-me").StopVimWithMe()
--end)

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
-- vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
--vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
--vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>");
-- vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");


-- Guy's kepmaps

--vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])
--
--vim.keymap.set("t", "<A-h>", [[<C-\><C-N><C-w>h]])
--vim.keymap.set("t", "<A-j>", [[<C-\><C-N><C-w>j]])
--vim.keymap.set("t", "<A-k>", [[<C-\><C-N><C-w>k]])
--vim.keymap.set("t", "<A-l>", [[<C-\><C-N><C-w>l]])
--
--vim.keymap.set("i", "<A-h>", [[<C-\><C-N><C-w>h]])
--vim.keymap.set("i", "<A-j>", [[<C-\><C-N><C-w>j]])
--vim.keymap.set("i", "<A-k>", [[<C-\><C-N><C-w>k]])
--vim.keymap.set("i", "<A-l>", [[<C-\><C-N><C-w>l]])
--
--vim.keymap.set("n", "<A-h>", [[<C-w>h]])
--vim.keymap.set("n", "<A-j>", [[<C-w>j]])
--vim.keymap.set("n", "<A-k>", [[<C-w>k]])
--vim.keymap.set("n", "<A-l>", [[<C-w>l]])
--
vim.keymap.set("n", "<leader>o", "o<Esc>k")
vim.keymap.set("n", "<leader>O", "O<Esc>j")

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})



if vim.g.vscode then
    -- VSCode extension

    require('vscode-neovim').update_config("editor.cursorSurroundingLines", 12) -- scrollOff in Vim
    require('vscode-neovim').update_config("editor.cursorSurroundingLinesStyle", "all")
    vim.keymap.set("n", "gc", "<Plug>VSCodeCommentary")
    vim.keymap.set("x", "gc", "<Plug>VSCodeCommentary")
    vim.keymap.set("o", "gc", "<Plug>VSCodeCommentary")
    vim.keymap.set("n", "gcc", "<Plug>VSCodeCommentaryLine")
    vim.keymap.set("n", "<leader>f", function()
        require('vscode-neovim').call('editor.action.formatDocument')
        --require('vscode-neovim').call('editor.action.formatSelection')
    end)
    --vim.keymap.set("n", "<leader>ff", function()
        --require('vscode-neovim').call('editor.action.formatDocument')
    --end)
    vim.keymap.set("n", "<leader><leader>", function()
	    require('vscode-neovim').call('workbench.action.quickOpenPreviousRecentlyUsedEditorInGroup')
    end)
    vim.keymap.set("n", "<leader>rn", function()
	    require('vscode-neovim').call('editor.action.rename')
    end)
    vim.keymap.set("n", "<leader>ri", function() -- refactor imports (doesn't work for all langs)
	    require('vscode-neovim').call('editor.action.organizeImports')
    end)
    vim.keymap.set("n", "<leader>cs", function() -- code suggestion
	    require('vscode-neovim').call('editor.action.quickFix')
    end)
    vim.keymap.set("n", "<leader>zo", function() -- open all folds
        require('vscode-neovim').call('editor.unfoldAll')
    end)
    vim.keymap.set("n", "<leader>zc", function() -- close all level 1 folds (main things open)
        require('vscode-neovim').call('editor.foldLevel1')
    end)
    vim.keymap.set("n", "<leader>q", function()
	    require('vscode-neovim').call('editor.action.showDefinitionPreviewHover')
    end)
    vim.keymap.set("n", "<C-o>", function()
	    require('vscode-neovim').call('workbench.action.navigateBack')
	    --require('vscode-neovim').call('workbench.action.gotoSymbol')
    end)
    vim.keymap.set("n", "<leader>d", function() -- generate doc with Mintlify
	    require('vscode-neovim').call('docs.write')
    end)
    --These don't seem to work as expected. Need to set in VSCode
    --vim.keymap.set("n", "<C-d>", "<C-d>zz")
    --vim.keymap.set("n", "<C-u>", "<C-u>zz")

else
    -- ordinary Neovim
 
    vim.keymap.set("n", "<leader><leader>", function()
        vim.cmd("so")
    end)
end
