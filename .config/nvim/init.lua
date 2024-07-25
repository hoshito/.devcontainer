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
vim.keymap.set("n", "<leader>cd", function ()
    vim.cmd(":cd %:h")
    vim.cmd(":pwd")
end)
vim.keymap.set("n", "<leader>c.", function ()
    vim.cmd(":cd ..")
    vim.cmd(":pwd")
end)
vim.keymap.set("n", "<leader>p", function ()
    vim.cmd(":pwd")
end)
