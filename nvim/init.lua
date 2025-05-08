-- init.lua

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- 1) lazy.nvim をランタイムパスに追加（最優先で読み込むため）
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
vim.opt.rtp:prepend(vim.fn.stdpath("data") .. "/lazy/lazy.nvim")

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- 2) lazy.nvim をロードしてプラグインをセットアップ
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
require("lazy").setup({
  ----------------------------------------------------------------
  -- ステータスライン
  ----------------------------------------------------------------
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup {
        options = { theme = "auto" },
      }
    end,
  },

  ----------------------------------------------------------------
  -- Mason (LSP/DAP/Formatter インストーラ)
  ----------------------------------------------------------------
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup {
        ensure_installed = { "solargraph", "ts_ls" },
      }
    end,
  },

  ----------------------------------------------------------------
  -- LSP 設定
  ----------------------------------------------------------------
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      -- Ruby LSP
      lspconfig.solargraph.setup {}
      -- JS/TS LSP
      lspconfig.ts_ls.setup {}
    end,
  },

  ----------------------------------------------------------------
  -- 補完エンジン + LuaSnip スニペット
  ----------------------------------------------------------------
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp     = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"]     = cmp.mapping.confirm({ select = true }),
          ["<Tab>"]    = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"]  = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = {
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        },
      })
    end,
  },
})

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- 3) Lua モジュールを読み込む（オプション・設定ファイル群）
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
require("settings")  -- vim.opt 系の基本設定
-- require("keymaps")   -- キーマッピング
