local set = require "gio".set

-- General
set { scrolloff = 5 }
set { laststatus = 3 }
set { conceallevel = 2 }
set { clipboard = "unnamedplus" }

-- Time
set { timeoutlen = 500 }
set { updatetime = 500 }

-- Splits
set "splitbelow"
set "splitright"

-- Completion
set "smartcase"
set { pumheight = 10 }
set { completeopt = "menuone,noselect" }

-- Numbers
set "number"
set "relativenumber"
set { numberwidth = 1 }

-- Indentation
set "smarttab"
set "expandtab"
set "linebreak"
set "autoindent"
set "smartindent"
set "breakindent"

-- Visual
set "list"
set "noruler"
set "cursorline"
set "termguicolors"
set { inccommand = "split" }
set { signcolumn = "yes" }
set {
    listchars = {
        tab = ">-",
        lead = ".",
        trail = "~",
        extends = "&",
        nbsp = "N",
    }
}

-- Folds
set "nofoldenable"

-- Misc
set "lazyredraw"
set { wildignore = ".git,target,node_modules" }
set { grepprg = "rg --hidden --vimgrep --smart-case --glob \"!{.git,node_modules,target,*~}/*\" --" }
