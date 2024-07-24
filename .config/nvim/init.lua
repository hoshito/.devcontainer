require("config.lazy")

-- vimrc
local opt = vim.opt
-- 行
opt.number = true
opt.cursorline = true
opt.list = true
-- タブ
opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4
-- 検索
opt.ignorecase = true
opt.smartcase = true
-- ファイル
opt.swapfile = false
opt.autoread = true
-- マウス無効
opt.mouse = ""

--opt.autochdir = true
