vim.cmd("command! -nargs=? -complete=dir Vifm :lua require('vifm').Vifm(<f-args>)")
