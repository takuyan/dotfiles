-- ~/.config/wezterm/wezterm.lua

local wezterm = require 'wezterm'
local config = wezterm.config_builder()

local function file_exists(path)
  local f = io.open(path, "r")
  if f ~= nil then
    f:close()
    return true
  end
  return false
end

wezterm.on("window-focus-changed", function(window, _)
  if not window:is_focused() then
    return
  end

  -- Prefer im-select when available; fallback to EISU key event via osascript.
  if file_exists("/opt/homebrew/bin/im-select") then
    wezterm.run_child_process({ "/opt/homebrew/bin/im-select", "com.apple.keylayout.ABC" })
  elseif file_exists("/usr/local/bin/im-select") then
    wezterm.run_child_process({ "/usr/local/bin/im-select", "com.apple.keylayout.ABC" })
  else
    wezterm.run_child_process({
      "osascript",
      "-e",
      'tell application "System Events" to key code 102',
    })
  end
end)

-- 見た目系
config.color_scheme = 'Catppuccin Mocha'

config.font = wezterm.font_with_fallback {
  'JetBrainsMono Nerd Font',
  'Moralerspace Argon HWNF',
  'Noto Color Emoji',
}
config.font_size = 15.0
config.line_height = 1.15
config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }  -- たまにligature邪魔な時用

-- 透過 + モダン感
config.window_background_opacity = 0.92
config.macos_window_background_blur = 30

-- タブバーとか邪魔なの消す系
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "RESIZE" -- タイトルバー消してスッキリ
config.hide_mouse_cursor_when_typing = true -- タイピング中はマウスカーソルを非表示

-- 便利系
-- Keep IME available; focus hook above moves input source back to ABC.
config.use_ime = true
config.default_prog = { "/bin/zsh", "--login" }
config.automatically_reload_config = true

-- キーバインド（Leaderキー = Ctrl+a にするとtmuxっぽくて楽）
local act = wezterm.action
config.leader = { key = 'a', mods = 'CTRL' }
config.keys = {
  -- Leader + | で縦分割、- で横分割（tmuxライク）
  { key = '|', mods = 'LEADER|SHIFT', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
  { key = '-', mods = 'LEADER',       action = act.SplitVertical   { domain = 'CurrentPaneDomain' } },

  -- Leader + h/l でペイン移動
  { key = 'h', mods = 'LEADER', action = act.ActivatePaneDirection 'Left' },
  { key = 'l', mods = 'LEADER', action = act.ActivatePaneDirection 'Right' },

  -- 新しいタブとか
  { key = 't', mods = 'LEADER', action = act.SpawnTab 'CurrentPaneDomain' },
}

return config
