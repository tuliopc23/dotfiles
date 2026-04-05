-- Ctrl+motion navigation for MiniPick and MiniFiles
local ok_pick, pick = pcall(require, 'mini.pick')
if ok_pick then
  pick.setup(vim.tbl_deep_extend('force', pick.config, {
    mappings = {
      move_down = '<C-j>',
      move_up = '<C-k>',
      caret_left = '<C-h>',
      caret_right = '<C-l>',
    },
  }))
end

local ok_files, files = pcall(require, 'mini.files')
if ok_files then
  files.setup(vim.tbl_deep_extend('force', files.config, {
    mappings = {
      go_in = '<C-l>',
      go_out = '<C-h>',
    },
  }))

  -- Keep Ctrl-j/k for movement inside file explorer buffers
  vim.api.nvim_create_autocmd('User', {
    pattern = 'MiniFilesBufferCreate',
    callback = function(args)
      local opts = { buffer = args.data.buf_id, remap = true, nowait = true }
      vim.keymap.set('n', '<C-j>', 'j', opts)
      vim.keymap.set('n', '<C-k>', 'k', opts)
    end,
  })
end
