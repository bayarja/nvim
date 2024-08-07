local opt = vim.opt -- for conciseness

-- line number
opt.relativenumber = true
opt.number = true

-- tabs & indention
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = false

-- line wrapping
opt.wrap = false
opt.smartcase = true
-- search settings
opt.ignorecase = true
opt.smartcase = true

-- cursor line
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace 
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- split window
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")

-- turn off swapfile
opt.swapfile = false

-- Define a syntax rule to match multiline text within backticks in JSON
vim.cmd([[
  autocmd BufEnter *.{json} syntax match jsonMultiline /`[^`]*`/
  autocmd BufEnter *.{json} highlight link jsonMultiline NONE
]])





