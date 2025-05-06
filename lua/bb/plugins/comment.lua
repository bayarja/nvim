return {
  'numToStr/Comment.nvim',
  dependencies = {
    'JoosepAlviste/nvim-ts-context-commentstring',
  },
  config = function()
    require('ts_context_commentstring').setup({}) -- ➤ Шинэ API-г идэвхжүүлнэ
    vim.g.skip_ts_context_commentstring_module = true -- ➤ Хуучин модуль ачаалагдахаас сэргийлнэ

    require('Comment').setup({
      pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook()
    })
  end
}

