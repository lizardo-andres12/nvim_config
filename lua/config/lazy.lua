-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "plugins" },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

-- init
vim.cmd("syntax on")
--vim.cmd("colorscheme elflord")

-- set number
vim.cmd("set number")
vim.cmd("set relativenumber")

-- set tabs
vim.cmd("set tabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set expandtab")

-- show whitespace and line length limit
vim.opt.listchars = { tab = '  ', trail = '~', extends = '>' }
vim.cmd("highlight ExtraWhitespace ctermbg=lightgreen guibg=lightgreen")
vim.cmd("match ExtraWhitespace /\\s\\+$/")
vim.cmd("set textwidth=100")
vim.cmd("set colorcolumn=+1")
vim.cmd("highlight ColorColumn ctermbg=lightmagenta guibg=lightmagenta")

-- other
vim.cmd("set wildmenu")
vim.cmd("set backspace=indent,eol,start")
vim.cmd("set splitright")
