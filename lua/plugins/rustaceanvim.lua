return {
  {
    'mrcjkb/rustaceanvim',
    version = '^6',
    lazy = false,
    ft = { 'rust' },
    config = function()
      vim.g.rustaceanvim = {
        server = {
          on_attach = function(client, bufnr)
            local map = function(mode, lhs, rhs)
              vim.keymap.set(mode, lhs, rhs, { silent = true, buffer = bufnr })
            end

            -- Override default code action with grouped Rust code actions
            if client.name == "rust_analyzer" then
              map('n', '<leader>ca', function()
                vim.cmd.RustLsp('codeAction')
              end)

              -- Enhanced hover actions (docs + runnables etc.)
              map('n', 'K', function()
                vim.cmd.RustLsp({ 'hover', 'actions' })
              end)
            end
          end,
        },
      }
    end,
  }
}
