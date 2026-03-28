local parsers = { "lua", "vim", "vimdoc" }

local function on_filetype(args)
  local buf = args.buf
  pcall(vim.treesitter.start, buf)
  local ok, parser = pcall(vim.treesitter.get_parser, buf)
  if ok and parser then
    vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end
end

local function setup()
  dofile(vim.g.base46_cache .. "syntax")
  require("nvim-treesitter").setup()

  if vim.fn.executable("tree-sitter") == 0 then
    vim.notify(
      "tree-sitter CLI not found (nvim-treesitter main requires it). Run :MasonInstall tree-sitter-cli or install tree-sitter ≥ 0.26 from your OS.",
      vim.log.levels.WARN
    )
  else
    require("nvim-treesitter").install(parsers)
  end

  local group = vim.api.nvim_create_augroup("NvimTreesitterMain", { clear = true })
  vim.api.nvim_create_autocmd("FileType", {
    group = group,
    callback = on_filetype,
  })
end

return { setup = setup, parsers = parsers }
