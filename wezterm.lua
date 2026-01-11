-- ~/.config/wezterm/wezterm.lua

local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- ~/.wezterm.lua
local wezterm = require 'wezterm'
local config = wezterm.config_builder()

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
