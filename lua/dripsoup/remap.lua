vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

--my own remaps
vim.keymap.set("i", "(", "()<left>")
vim.keymap.set("i", "[", "[]<left>")
vim.keymap.set("i", "{", "{}<left>")
vim.keymap.set("i", ")", "<cmd>lua Skip_closing_bracket(')')<CR>")
vim.keymap.set("i", "]", "<cmd>lua Skip_closing_bracket(']')<CR>")
vim.keymap.set("i", "}", "<cmd>lua Skip_closing_bracket('}')<CR>")

vim.keymap.set("i", "\"", "\"\"<Left>")
vim.keymap.set("i", "\'", "\'\'<left>")

--virtualedit = "onemore" must be on for this to work on line ends!!
function Skip_closing_bracket(bracket)
    local col = vim.api.nvim_win_get_cursor(0)[2]
    local line = vim.api.nvim_get_current_line()
    local char = line:sub(col+1, col+1)
    if(string.match(char, "%" .. bracket)) --if cursor is over closing bracket already
    then
        vim.cmd("norm! l") --move cursor to right
    else -- insert closing bracket normally
        local nline = line:sub(0, col) .. bracket .. line:sub(col + 1)
        vim.api.nvim_set_current_line(nline)
        vim.cmd("norm! l")
    end
end

vim.keymap.set("i", "\"", "<cmd>lua My_parentheses_solution('\"')<CR>")
vim.keymap.set("i", "\'", "<cmd>lua My_parentheses_solution('\'')<CR>")
function My_parentheses_solution(par)
    local col = vim.api.nvim_win_get_cursor(0)[2]
    local line = vim.api.nvim_get_current_line()
    local char = line:sub(col+1, col+1)
    if(string.match(char, "%" .. par))
    then
        vim.cmd("norm! l")
    else
        local nline = line:sub(0, col) .. par .. par .. line:sub(col + 1)
        vim.api.nvim_set_current_line(nline)
        vim.cmd("norm! l")
    end
end
-- local pos = vim.api.nvim_win_get_cursor(0)[2]
 -- local line = vim.api.nvim_get_current_line()
 -- local nline = line:sub(0, pos) .. 'hello' .. line:sub(pos + 1)
 -- vim.api.nvim_set_current_line(nline)

vim.keymap.set("i", "<BS>", "<cmd>lua Backspace_deletebrackets()<CR><BS>")
function Backspace_deletebrackets()
    local col = vim.api.nvim_win_get_cursor(0)[2]
    local line = vim.api.nvim_get_current_line()
    local char = line:sub(col+1, col+1)
    local prevchar = line:sub(col, col)
    if(string.match(char, "%)") or string.match(char, "%]") or string.match(char, "%}"))
    then
        vim.cmd("norm! x")
    end
    print(string.match(char, "%)") or string.match(char, "%]") or string.match(char, "%}"))
end
--my own remaps set


vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")


-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>");
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");


