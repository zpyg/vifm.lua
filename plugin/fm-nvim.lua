vim.cmd("command! -nargs=? -complete=dir Vifm :lua require('fm-nvim').Vifm(<f-args>)")
