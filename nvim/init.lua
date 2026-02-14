require "core"

local custom_init_path = vim.api.nvim_get_runtime_file("lua/custom/init.lua", false)[1]

if custom_init_path then
  dofile(custom_init_path)
end

require("core.utils").load_mappings()

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

-- bootstrap lazy.nvim!
if not vim.uv.fs_stat(lazypath) then
  require("core.bootstrap").gen_chadrc_template()
  require("core.bootstrap").lazy(lazypath)
end

dofile(vim.g.base46_cache .. "defaults")
vim.opt.rtp:prepend(lazypath)
require "plugins"

vim.wo.relativenumber = true

-- Auto-start OpenCode with autocmd
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    -- Small delay to ensure all plugins are loaded
    vim.defer_fn(function()
      if require('opencode') then
        -- Optional: Auto-open OpenCode on startup (uncomment if desired)
        -- require('opencode.api').toggle()
      end
    end, 1000)
  end,
})
