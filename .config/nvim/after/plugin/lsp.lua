local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

require("neodev").setup({})

cmp.setup({
    sources = {
        {name = 'nvim_lsp'},
    },
    mapping = {
        ['<C-y>'] = cmp.mapping.confirm({select = true}),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<Up>'] = cmp.mapping.select_prev_item({behavior = 'select'}),
        ['<Down>'] = cmp.mapping.select_next_item({behavior = 'select'}),
        ['<C-p>'] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_prev_item({behavior = 'insert'})
            else
                cmp.complete()
            end
        end),
        ['<C-n>'] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_next_item({behavior = 'insert'})
            else
                cmp.complete()
            end
        end),
    },
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
})

local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
	lsp_zero.default_keymaps({buffer = bufnr})
	local opts = {buffer = bufnr, remap = false}
	vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts);

	vim.keymap.set('n', '<leader>vd', function() vim.diagnostic.open_float() end, opts);
	vim.keymap.set('n', '<leader>vca', function() vim.lsp.buf.code_action() end, opts);
	vim.keymap.set('n', '<leader>vfr', function() vim.lsp.buf.references() end, opts);
	vim.keymap.set('n', '<leader>vr', function() vim.lsp.buf.rename() end, opts);
	vim.keymap.set('n', '<leader>tsh', function() vim.lsp.buf.signature_help() end, opts);
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {},
  handlers = {
    lsp_zero.default_setup,
  },
})


