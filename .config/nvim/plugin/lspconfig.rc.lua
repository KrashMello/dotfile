local status, nvim_lsp = pcall(require, 'lspconfig')
if (not status) then return end

local protocol = require('vim.lsp.protocol')

local on_attach = function(client, bufnr)
  -- formatting
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_command [[augroup Format]]
    vim.api.nvim_command [[autocmd! * <buffer>]]
    vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
    vim.api.nvim_command [[augroup END]]
  end
end

nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  filetypes = { "typescript", "typescriptreact", "typescrypt.tsx" },
  cmd = { "typescript-lenguage-server", "--stdio" }
}

nvim_lsp.vuels.setup {
  on_attach = on_attach,
  filetypes = { "vue" },
  cmd = { "vls" }
}

nvim_lsp.eslint.setup {

  on_attach = on_attach,
  cmd = { "vscode-eslint-language-server", "--stdio" },
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx",
    "vue", "svelte", "astro" }

}

nvim_lsp.sumneko_lua.setup {
  on_attach = on_attach,
  settings = {
    lua = {
      diagnostics = {
        -- Get the server aware of  neovim runtime files
        globals = { 'vim' }
      },

      workspace = {
        -- Make the server aware of the neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true)
      }
    }
  }
}
