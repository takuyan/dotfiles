-- ~/.config/wezterm/wezterm.lua

local wezterm = require 'wezterm'

return {
  -- 推奨フォント（自分のフォントに合わせて）
  font = wezterm.font_with_fallback { "JetBrains Mono", "Noto Sans Mono CJK JP", "Symbols Nerd Font Mono" },
  font_size = 13.0,

  -- カラースキーム
  color_scheme = "Tokyo Night Storm", -- https://wezfurlong.org/wezterm/colorschemes/index.html

  -- 起動時のシェル
  default_prog = { "/bin/zsh", "-l" },  -- ログインシェルで起動（macOS）

  -- キーボード操作向け
  hide_mouse_cursor_when_typing = true,  -- タイピング中はマウスカーソルを非表示

  -- ウィンドウ装飾
  window_decorations = "RESIZE", -- タイトルバーやリサイズ枠のみ表示（最小構成）

  -- 背景透明度（0.0〜1.0）
  window_background_opacity = 0.92, -- うっすら透ける（好みに合わせて調整）

  -- パフォーマンス安定化
  adjust_window_size_when_changing_font_size = false,  -- フォントサイズ変更時のちらつきを防止

  -- タブU
  enable_tab_bar = false,
  use_fancy_tab_bar = false,

  keys = {
    -- 上下分割（縦分割）
    {
      key = "Enter",
      mods = "CMD|SHIFT",
      action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" },
    },
    -- 左右分割（横分割）
    {
      key = "d",
      mods = "CMD|SHIFT",
      action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" },
    },

    -- ペイン間移動
    {
      key = "h",
      mods = "CMD|ALT",
      action = wezterm.action.ActivatePaneDirection "Left",
    },
    {
      key = "l",
      mods = "CMD|ALT",
      action = wezterm.action.ActivatePaneDirection "Right",
    },
    {
      key = "k",
      mods = "CMD|ALT",
      action = wezterm.action.ActivatePaneDirection "Up",
    },
    {
      key = "j",
      mods = "CMD|ALT",
      action = wezterm.action.ActivatePaneDirection "Down",
    },
  }
}
