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
  require("nvim-treesitter").install(parsers)

  local group = vim.api.nvim_create_augroup("NvimTreesitterMain", { clear = true })
  vim.api.nvim_create_autocmd("FileType", {
    group = group,
    callback = on_filetype,
  })
end

return { setup = setup, parsers = parsers }
