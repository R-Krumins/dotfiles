vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd("LspAttach", {
    desc = "Confgure Lsp",
    group = vim.api.nvim_create_augroup("configure-lsp", { clear = true }),
    callback = function(event)
        local map = function(keys, func, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end

        local tb = require('telescope.builtin')

        --map("gd", vim.lsp.buf.definition, "[G]oto [D]efinition]")
        --map("K", vim.lsp.buf.hover, "Hover documentation")
        map('gr', tb.lsp_references, '[G]oto [R]eferences')
        map('gI', tb.lsp_implementations, '[G]oto [I]mplementation')
        map('<leader>D', tb.lsp_type_definitions, 'Type [D]efinition')
        map('<leader>ds', tb.lsp_document_symbols, '[D]ocument [S]ymbols')
        map('<leader>ws', tb.lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
        map('<F2>', vim.lsp.buf.rename, '[R]e[n]ame')
        map('<C-.>', vim.lsp.buf.code_action, 'Code Action', { 'n', 'x' })
        map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
        map('<leader>e', vim.diagnostic.open_float, 'show [E]rror')

    end
})
