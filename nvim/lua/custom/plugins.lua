local plugins = {
  { "nvim-neotest/nvim-nio" },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = "mfussenegger/nvim-dap",
    config = function ()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function ()
        dapui.close()
      end
    end
  },
  {
    "mfussenegger/nvim-dap",
    config = function (_,opts)
      require("core.utils").load_mappings("dap")
    end
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function(_, opts)
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
      require("core.utils").load_mappings("dap_python")
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    ft = {"python"},
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "pyright",
      },
    },
  },
  
  -- Enhanced notifications for better UI feedback
  {
    "rcarriga/nvim-notify",
    config = function()
      require("notify").setup({
        stages = "fade_in_slide_out",
        timeout = 3000,
        background_colour = "#000000",
        render = "minimal",
      })
      vim.notify = require("notify")
    end,
  },
  -- Beautiful markdown preview for better chat viewing
  {
    "ellisonleao/glow.nvim",
    config = true,
    cmd = "Glow",
    keys = {
      { "<leader>mg", "<cmd>Glow<cr>", desc = "Markdown Glow Preview" }
    }
  },

{
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "sudo-tee/opencode.nvim",
    config = function()
      require("opencode").setup({
        preferred_completion = "blink", -- or "nvim-cmp" if you prefer
        default_global_keymaps = true,
        keymap_prefix = "<leader>o",
        -- Force clear any conflicts with Space+o
        keymap = {
          editor = {
            ["<leader>og"] = { 'toggle' }, -- Force set main toggle
          },
        },
        ui = {
          position = "right",
          window_width = 0.45,
          display_model = true,
          display_context_size = true,
          display_cost = true,
          icons = {
            preset = "nerdfonts",
          },
          -- Enhanced markdown rendering
          render_markdown = true,
          syntax_highlighting = true,
        },
        ui = {
          position = "right",
          window_width = 0.40,
          display_model = true,
          display_context_size = true,
          display_cost = true,
          icons = {
            preset = "nerdfonts",
          },
        },
        context = {
          enabled = true,
          current_file = {
            enabled = true,
            show_full_path = true,
          },
          selection = {
            enabled = true,
          },
          diagnostics = {
            info = false,
            warn = true,
            error = true,
          },
        },
      })
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          anti_conceal = { enabled = false },
          file_types = { 'markdown', 'opencode_output', 'Avante' },
          heading = {
            sign = false,
            icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
          },
          code = {
            sign = false,
            width = "block",
            right_pad = 1,
            left_pad = 1,
          },
          dash = {
            width = "full",
          },
          bullet = {
            icons = { "●", "○", "◆", "◇" },
          },
          checkbox = {
            unchecked = { icon = " 󰄱 " },
            checked = { icon = "  " },
          },
          quote = {
            icon = "│",
            repeat_linebreak = true,
          },
          pipe_table = {
            padding = 1,
            border = {
              "┌", "─", "┬", "┐",
              "│", "│", "│",
              "├", "─", "┼", "┤",
              "│", "│", "│", 
              "└", "─", "┴", "┘",
            },
          },
        },
        ft = { 'markdown', 'opencode_output', 'Avante' },
      },
    -- Additional markdown enhancement for better visual experience
    {
      "OXY2DEV/markview.nvim",
      event = "VeryLazy",
      dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons"
      },
      config = function()
        require("markview").setup({
          modes = { "n", "no", "c" },
          hybrids = { "n" },
          callback = {
            on_enable = function (_, win)
              vim.wo[win].conceallevel = 2
              vim.wo[win].concealcursor = ""
            end,
          },
        })
      end,
    },
      -- For autocomplete - choose one
      'saghen/blink.cmp',
      {
        'hrsh7th/nvim-cmp',
        config = function()
          require('cmp').setup({
            sources = {
              { name = 'opencode' },
            },
          })
        end,
      },
      
      -- For file picker - choose one (snacks recommended)
      'folke/snacks.nvim',
      -- 'nvim-telescope/telescope.nvim',
      -- 'ibhagwan/fzf-lua',
    },
  },
  
{
    "f-person/git-blame.nvim",
    -- load the plugin at startup
    event = "VeryLazy",
    -- Because of the keys part, you will be lazy loading this plugin.
    -- The plugin wil only load once one of the keys is used.
    -- If you want to load the plugin at startup, add something like event = "VeryLazy",
    -- or lazy = false. One of both options will work.
    opts = {
        -- your configuration comes here
        -- for example
        enabled = true,  -- if you want to enable the plugin
        message_template = " <summary> • <date> • <author> • <<sha>>", -- template for the blame message, check the Message template section for more options
        date_format = "%m-%d-%Y %H:%M:%S", -- template for the date, check Date format section for more options
        virtual_text_column = 1,  -- virtual text start column, check Start virtual text at column section for more options
    },
},
  {
    "tpope/vim-fugitive",
    lazy=false
  },
}
return plugins
