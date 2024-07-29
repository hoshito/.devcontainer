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

-- ディレクトリ移動
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
--opt.autochdir = true

-- 開業時にコメントアウトしないようにする
vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('turn_off_auto_commenting', {}),
  pattern = '*',
  command = [[setlocal fo-=cro]]
})

-- 言語に応じてファイル実行
local function run_file(file_runners)
    local filetype = vim.bo.filetype
    local interpreter = file_runners[filetype]
    if interpreter then
        vim.cmd('write')  -- ファイルを保存
        vim.cmd('TermExec cmd="' .. interpreter .. ' ' .. vim.fn.expand('%:p') .. '"')
    else
        print("このファイルタイプの実行方法が定義されていません: " .. filetype)
    end
end
vim.api.nvim_set_keymap('n', '<leader>r', '', {
    noremap = true,
    silent = true,
    callback = function()
        local file_runners = {
            python = "python3",
            javascript = "node",
            ruby = "ruby",
        }
        run_file(file_runners)
    end
})


-- セッション管理
local session_file = vim.fn.stdpath("config") .. "/last_session.vim"
-- Neovim終了時にセッションを自動保存
vim.api.nvim_create_autocmd("VimLeavePre", {
  callback = function()
    vim.cmd("mksession! " .. session_file)
  end,
})
-- セッションを読み込むためのコマンド
vim.api.nvim_create_user_command('LoadLastSession', function()
  if vim.fn.filereadable(session_file) == 1 then
    vim.cmd("source " .. session_file)
    print("前回のセッションを読み込みました。")
  else
    print("保存されたセッションが見つかりません。")
  end
end, {})

