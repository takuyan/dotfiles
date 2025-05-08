-- init.lua

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- 0) リーダーキーを最優先で設定
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
vim.g.mapleader      = ","      -- ノーマルモードのリーダー
vim.g.maplocalleader = ","      -- ローカルリーダー

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- 1) lazy.nvim をランタイムパスに追加
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

  ----------------------------------------------------------------
  -- Comment Out
  ----------------------------------------------------------------
  {
    "numToStr/Comment.nvim",
    config = function()
      -- プラグインの初期化
      require("Comment").setup({
        -- 必要であればキーをカスタマイズ可能
        mappings = {
          basic = true,    -- gcc, gc{motion} を有効化
          extra = false,   -- gcO, gcA などの追加マッピングは無効化
        },
      })
    end,
  },

  -- ファイラ: nvim-tree.lua
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons", -- すでに導入済みならOK
    },
    keys = {
      -- <leader>e でトグル表示
      { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Toggle file explorer" },
    },
    config = function()
      require("nvim-tree").setup({
        disable_netrw       = true,
        hijack_netrw        = true,
        view = {
          width = 30,
          side  = "left",
        },
        renderer = {
          icons = {
            -- #1: web-devicons のカラーを使う
            webdev_colors = true,

            -- #2: どの種類のアイコンを表示するか
            show = {
              file          = true,
              folder        = true,
              folder_arrow  = true,
              git           = true,
            },

            -- #3: git アイコンの配置（デフォルトは before）
            git_placement = "before",

            -- #4: 各種パディングや矢印文字など細かい調整が可能
            padding       = " ",
            symlink_arrow = " ➛ ",
          },
        },
        git = {
          enable = true,
          ignore = false,
        },
        update_focused_file = {
          enable      = true,
          update_cwd  = true,
        },
      })
    end,
  },

  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("chatgpt").setup({
        api_key_cmd = "echo $OPENAI_API_KEY",
        -- 必要に応じてモデルやプロンプトのデフォルトをカスタム可能
        chat = {
          welcome_message = "How can I help you today?",
        },
        popup_window = {
          border = { "", "", "", "", "", "", "", "" },
          -- width/height のパーセンテージ調整なども
        },
      })

      vim.keymap.set("n", "<leader>cg", "<cmd>ChatGPT<CR>", { desc = "ChatGPT: Open Chat" })
      vim.keymap.set("v", "<leader>ca", "<cmd>ChatGPTActAs<CR>", { desc = "ChatGPT: Act As…" })
      vim.keymap.set("v", "<leader>ce", "<cmd>ChatGPTEditWithInstructions<CR>", { desc = "ChatGPT: Edit Selection" })
    end,
  },
})

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- 3) Lua モジュールを読み込む（オプション・設定ファイル群）
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
require("settings")  -- vim.opt 系の基本設定
-- require("keymaps")   -- キーマッピング
