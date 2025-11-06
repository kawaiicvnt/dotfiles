--local utils = require("utils")

local plugin_dir = vim.fn.stdpath("data") .. "/lazy"
local lazypath = plugin_dir .. "/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

local plugin_specs = {
  -- auto-completion engine
  {
    "hrsh7th/nvim-cmp",
    name = "nvim-cmp",
    -- event = 'InsertEnter',
    event = "VeryLazy",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "onsails/lspkind-nvim",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-vsnip",
      "hrsh7th/vim-vsnip",
      "neovim/nvim-lspconfig",
      "p00f/clangd_extensions.nvim",
    --  "hrsh7th/cmp-omni",
     -- "quangnguyen30192/cmp-nvim-ultisnips",
    },
    config = function()
      require("config.nvim-cmp")
    end,
  },
  { -- optional blink completion source for require statements and module annotations
    "saghen/blink.cmp",
    build = "cargo +nightly build --release",
    opts = {
      sources = {
        -- add lazydev to your completion providers
        default = { "lazydev", "lsp", "path", "snippets", "buffer" },
        providers = {
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            -- make lazydev completions top priority (see `:h blink.cmp`)
            score_offset = 100,
          },
        },
      },
    },
  },

  --{
  --  "andrewferrier/wrapping.nvim",
  --  config = function()
  --    require("wrapping").setup({
  --      auto_set_mode_heuristically = false,
  --    })
  --  end
  --},

  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "lua_ls",
        "rust_analyzer",
        "clangd",
        "vimls",
        "bashls",
        --"csharp_ls",
        "cssls",
        "fish_lsp",
        --"hls",
        "html",
        "htmx",
        --"hyprls",
        --"java_language_server",
        --"java-debug-adapter",
        "jsonls",
        "kotlin_language_server",
        --"nix",
        --"pkg:cargo/nixpkgs-fmt@1.3.0",
        --"sql-formatter",
        "systemd_ls",
        "ts_ls",
        "tailwindcss",
      },
    },
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
  },
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },

  -- Bufferline babyyy
  --{
  --  "akinsho/bufferline.nvim",
  --  lazy = true,
  --  dependencies = { "nvim-tree/nvim-web-devicons" },
  --  config = function()
  --    require("config.bufferline")
  --  end,
  --},

  -- Winbar
  {
    "fgheng/winbar.nvim",
    config = function()
      require("winbar").setup({
        enabled = true,

        show_file_path = true,
        show_symbols = true,

        colors = {
            path = '', -- You can customize colors like #c946fd
            file_name = '',
            symbols = '',
        },

        icons = {
            file_icon_default = '',
            seperator = '>',
            editor_state = '●',
            lock_icon = '',
        },

        exclude_filetype = {
            'help',
            'startify',
            'dashboard',
            'packer',
            'neogitstatus',
            'NvimTree',
            'Trouble',
            'alpha',
            'lir',
            'Outline',
            'spectre_panel',
            'toggleterm',
            'qf',
        }
      })
    end,
  },

  --Lualine
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup()
    end
  },

  -- Super fast buffer jump
  {
    "smoka7/hop.nvim",
    event = "VeryLazy",
    config = function()
      require("config.nvim_hop")
    end,
  },

  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      -- calling `setup` is optional for customization
      require("fzf-lua").setup {}
    end,
  },

  { "sainnhe/everforest", lazy = true },                   -- light green leaning. I like it. Uses pink for magic numbers, which I like
  {
    "rockyzhang24/arctic.nvim",
    dependencies = { "rktjmp/lush.nvim" },
    name = "arctic",
    branch = "v2",
  },                                                       -- Just dark enough. I like the use of the greenish-cyan
  { "marko-cerovac/material.nvim", lazy = true },          -- palenight, deep-ocean and darker are nice
  { "sainnhe/sonokai", lazy = true },                      -- orange and yellow are a bit too close
  { "rebelot/kanagawa.nvim", lazy = true },                -- wave is a good amount of darkness, dragon is also good
  { "catppuccin/nvim", name = "catppuccin", lazy = true }, -- a classic, I prefer macchiato
  { "sainnhe/edge", lazy = true },                         -- very light green / light blue leaning. Solid imo 
  { "nvim-tree/nvim-web-devicons", event = "VeryLazy" },

  -- fancy start screen
  {
    "nvimdev/dashboard-nvim",
    cond = firenvim_not_active,
    config = function()
      require("config.dashboard-nvim")
    end,
  },

  -- Highlight URLs inside vim
  { "itchyny/vim-highlighturl", event = "VeryLazy" },

  -- The missing auto-completion for cmdline!
  {
    "gelguy/wilder.nvim",
    build = ":UpdateRemotePlugins",
  },

  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      -- more beautiful vim.ui.input
      input = {
        enabled = true,
        win = {
          relative = "cursor",
          backdrop = true,
        },
      },
      -- more beautiful vim.ui.select
      picker = { enabled = true },
      lazygit = {
        configure = true
      },
    },
  },
  -- show and trim trailing whitespaces
  { "jdhao/whitespace.nvim", event = "VeryLazy" },

  -- file explorer
  {
    "nvim-tree/nvim-tree.lua",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("config.nvim-tree")
    end,
  },
}

require("lazy").setup {
  spec = plugin_specs,
  ui = {
    border = "rounded",
    title = "Plugin Manager",
    title_pos = "center",
  },
  rocks = {
    enabled = false,
    hererocks = false,
  },
}
