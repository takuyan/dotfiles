-- Keep this file for local autocmds.

-- 外部プロセスによるファイル変更を自動リロード
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  callback = function()
    if vim.fn.mode() ~= "c" then
      vim.cmd("silent! checktime")
    end
  end,
})
