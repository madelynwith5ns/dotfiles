local telescope = require('telescope.builtin')

vim.keymap.set("n", "<leader><leader><leader>", vim.cmd.so);
vim.keymap.set("n", "<leader>fs", vim.cmd.Oil);
vim.keymap.set("n", "<leader>pv", telescope.find_files, {});
vim.keymap.set('n', '<leader>gf', telescope.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
    telescope.grep_string({ search = vim.fn.input("search query? ") })
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
vim.keymap.set("n", "<leader>bgb", "<CMD>!./gradlew build<CR>");
vim.keymap.set("n", "<leader>bgs", "<CMD>!./gradlew shadowJar<CR>");
vim.keymap.set("n", "<leader>bv", "<CMD>!./mvnw build<CR>");
vim.keymap.set("n", "<leader>bm", "<CMD>!make -j24<CR>");
vim.keymap.set("n", "<leader>bc", "<CMD>!cargo build<CR>");
vim.keymap.set("n", "<leader>bs", "<CMD>!./build.sh<CR>");
-- beautiful term keybind
vim.keymap.set("n", "<leader>te", "<CMD>split<CR><C-w>j<CMD>term<CR>i");
-- because this definitely needs to be a keybind
vim.keymap.set("n", "<leader><leader>uwu", "<CMD>split<CR><C-w>j<CMD>term<CR>ihyfetch<CR>i");
-- how much the memories are we usin
vim.keymap.set("n", "<leader><leader>vn", "<CMD>!pvmrss nvim<CR>");
-- the greatest keybind of all time
vim.keymap.set("n", "<leader>jq", "<CMD>%!jq .<CR>");

vim.keymap.set("n", "<leader>vfb", function() vim.lsp.buf.format({ async = true }) end);

vim.keymap.set("n", "<leader><leader>cf", "mmggvGV\"+y'm");
vim.keymap.set("n", "<leader><leader>df", "ggvGVd");

vim.keymap.set("n", "<leader>df", function()
    local here = vim.fn.expand("%:p");
    local newname = vim.fn.input("Duplicate to? ", here);
    if newname == '' then
        print("cancelled");
        return
    end

    vim.cmd('silent! !cp "' .. here .. '" "' .. newname .. '"');
    print("duuplicated to " .. newname);
end);
vim.keymap.set("n", "<leader>ds", function()
    local here = vim.fn.expand("%:p");
    local newname = vim.fn.input("Duplicate to? ", here);
    if newname == '' then
        print("cancelled");
        return
    end

    vim.cmd('silent! !cp "' .. here .. '" "' .. newname .. '"');
    print("duuplicated to " .. newname);
    vim.cmd('e "' .. newname .. '"');
end);

-- okay *THESE* are the greatest binds of all time.
vim.keymap.set("v", "<leader><leader>e", ":!xargs -I visualselection echo \"print(visualselection);\" | python3<CR>");
vim.keymap.set("v", "<leader><leader>p", ":!python3<CR>");
vim.keymap.set("v", "<leader><leader>b", ":!bash<CR>");

-- evil eldritch stack trace hack
vim.keymap.set("v", "<leader><leader>st", "y<CMD>new __stack_trace_stuff<CR>ggvGV\"_dpggd2dggvGV<ggvGV:s/\\(.*\\)(\\(.*\\)) \\[\\(.*\\)\\]/addr2line -e \\1 \\2/<CR>ggvGV:!bash<CR>ggvGV>ggO<BS>Stack Trace:<ESC>ggvGV:s/??:?/Unknown Location/<CR>ggvGV:s/??:0/Unknown Location/<CR>");
vim.keymap.set("v", "<leader><leader>te", ":!echo %<CR>");

vim.keymap.set("i", "<C-e>", "expect();<Left><Left>");

vim.keymap.set("i", "<C-s>ma", function()
    local t = vim.fn.input("type? ");
    local n = vim.fn.input("name? ");
    vim.fn.feedkeys(t .. " *" .. n .. " = malloc(sizeof(*" .. n .. "));o");
end);
vim.keymap.set("i", "<C-s>xma", function()
    local t = vim.fn.input("type? ");
    local n = vim.fn.input("name? ");
    vim.fn.feedkeys(t .. " *" .. n .. " = malloc(sizeof(*" .. n .. "));o");
end);
vim.keymap.set("n", "<C-s>na", function()
    vim.fn.feedkeys([[yiwoif (!pa) {fprintf(stderr, "mp");abort();}'pci"\nba]]);
end);
