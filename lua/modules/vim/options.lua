---> general
vim.opt.scrolloff = 5
vim.opt.conceallevel = 2
vim.opt.clipboard = "unnamedplus"
vim.opt.laststatus = 3

---> Disabling something
vim.opt.shortmess = "asIcF"
vim.opt.fillchars = { eob = " " }
vim.opt.hlsearch = false
vim.opt.ruler = false
vim.opt.showmode = false

---> time
vim.opt.timeoutlen = 500
vim.opt.updatetime = 500

---> splits
vim.opt.splitbelow = true
vim.opt.splitright = true

---> completion
vim.opt.pumheight = 10
vim.opt.completeopt = "menuone,noselect"
vim.opt.smartcase = true

---> numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 1

---> indentation
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.smarttab = true
vim.opt.linebreak = true
vim.opt.breakindent = true

---> visual
vim.opt.pumblend = 10
vim.opt.inccommand = "split"
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"
vim.opt.guifont = "FiraCode NF:h10"
vim.opt.list = true
vim.opt.listchars = { tab = "->", lead = ".", trail = "~", extends = "&", nbsp = "N" }

---> misc
vim.opt.wildignore = ".git,target"

---> shell
vim.opt.shell = "nu"
vim.opt.shellcmdflag = "-c"
vim.opt.shellquote = ""
vim.opt.shellxquote = ""
