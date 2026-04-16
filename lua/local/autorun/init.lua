local M = {}

local runners = {
  python = "python3",
  rust = "cargo run",
  javascript = "node",
  typescript = "ts-node",
  c = "gcc % -o %< && ./%<",
  cpp = "g++ % -o %< && ./%<",
  java = "javac % && java %<",
}

function M.setup()
  vim.keymap.set("n", "<leader>r", function()
    local ft = vim.bo.filetype
    local cmd = runners[ft]
    if not cmd then
      print("No runner for " .. ft)
      return
    end
    vim.cmd("w")
    vim.cmd("split | terminal " .. cmd:gsub("%%", vim.fn.expand("%")))
  end, { desc = "Autorun file" })
end

return M

