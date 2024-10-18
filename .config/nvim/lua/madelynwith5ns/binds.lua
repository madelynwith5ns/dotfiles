local telescope = require('telescope.builtin')
local magichat = require("magichat")
magichat.setup()

vim.keymap.set("n", "<leader><leader><leader>", vim.cmd.so);
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex);
vim.keymap.set("n", "<leader>pf", telescope.find_files, {});
vim.keymap.set('n', '<leader>gf', telescope.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
    telescope.grep_string({ search = vim.fn.input("grep > ") })
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

vim.keymap.set("n", "<leader>hs", function() 
    magichat.stash()
end)
vim.keymap.set("n", "<leader>hu", function() magichat.unstash() end)
vim.keymap.set("n", "<leader>hb", function() magichat.burn() end)

-- vocomment...
vim.keymap.set("n", "<leader><leader>vc", function() require("vocomment").vocomplay() end)
vim.keymap.set("n", "<leader><leader>vr", function() require("vocomment").vocomrecord() end)
