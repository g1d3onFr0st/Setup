-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
local del = vim.keymap.del

map("", "<leader>E", function()
    require("neo-tree.command").execute({
        position = "float",
        action = "focus",
    })
end, { desc = "File Explorer (Picker) " })

map("", "<leader>e", function()
    require("neo-tree.command").execute({
        position = "right",
        action = "focus",
    })
end, { desc = "File Explorer (Preview) " })

map({ "n", "i", "v" }, "<c-q>", "<cmd>q<cr>")
map({ "n", "i", "v" }, "<a-w>", "<cmd>wq<cr>")
map({ "n", "i", "v" }, "<a-q>", "<cmd>wqa<cr>", { desc })
