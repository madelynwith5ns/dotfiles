local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    lsp_zero.default_keymaps({ buffer = bufnr })
    local opts = { buffer = bufnr, remap = false }
    vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts);

    vim.keymap.set('n', '<leader>vd', function() vim.diagnostic.open_float() end, opts);
    vim.keymap.set('n', '<leader>vca', function() vim.lsp.buf.code_action() end, opts);
    vim.keymap.set('n', '<leader>vfr', function() vim.lsp.buf.references() end, opts);
    vim.keymap.set('n', '<leader>vr', function() vim.lsp.buf.rename() end, opts);
    vim.keymap.set('n', '<leader>tsh', function() vim.lsp.buf.signature_help() end, opts);
    vim.keymap.set('i', '<C-k>', function() vim.lsp.buf.hover() end, opts);
end)

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {},
    handlers = {
        lsp_zero.default_setup,
    },
})
