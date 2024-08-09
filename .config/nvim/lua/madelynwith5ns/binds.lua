local telescope = require('telescope.builtin')

vim.keymap.set("n", "<leader><leader><leader>", vim.cmd.so);
vim.keymap.set("n", "<leader>pv", vim.cmd.Neotree);
vim.keymap.set("n", "<leader>f", telescope.find_files, {});
vim.keymap.set('n', '<leader>gf', telescope.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
    telescope.grep_string({search = vim.fn.input("whatcha lookin for? ")})
end, {})
vim.keymap.set('n', '<leader>u', function()
    vim.cmd.UndotreeShow()
    vim.cmd.UndotreeFocus()
end)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("x", "<leader>p", "\"_dP")
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")
-- the most insane looking keybind ever, it just does a S+R on the current word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- chmod +x but instead of chmod +x its just <leader>x
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
vim.keymap.set("n", "<C-s>", vim.cmd.w);
vim.keymap.set("i", "<C-s>", vim.cmd.w);
vim.keymap.set("v", "<C-s>", vim.cmd.w);
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev);
vim.keymap.set("n", "]d", vim.diagnostic.goto_next);
vim.keymap.set("n", "<leader>gs", vim.cmd.Git);
vim.keymap.set("n", "<leader>gp", function() vim.cmd.Git("push") end);
-- ton of build shortcuts
vim.keymap.set("n", "<leader>bf", "<CMD>!./fluffy<CR>");
vim.keymap.set("n", "<leader>bg", "<CMD>!./gradlew build<CR>");
vim.keymap.set("n", "<leader>bv", "<CMD>!./mvnw build<CR>");
vim.keymap.set("n", "<leader>bm", "<CMD>!make -j24<CR>");
vim.keymap.set("n", "<leader>bc", "<CMD>!cargo build<CR>");
vim.keymap.set("n", "<leader>rc", "<CMD>!cargo run<CR>");
vim.keymap.set("n", "<leader>bs", "<CMD>!./build.sh<CR>");
-- beautiful term keybind
vim.keymap.set("n", "<leader>te", "<CMD>split<CR><C-w>j<CMD>term<CR>i");
-- because this definitely needs to be a keybind
vim.keymap.set("n", "<leader><leader>uwu", "<CMD>split<CR><C-w>j<CMD>term<CR>ihyfetch<CR>i");
-- how much the memories are we usin
vim.keymap.set("n", "<leader><leader>vn", "<CMD>!pvmrss nvim<CR>");
-- the greatest keybind of all time
vim.keymap.set("n", "<leader>jq", "<CMD>%!jq .<CR>");
