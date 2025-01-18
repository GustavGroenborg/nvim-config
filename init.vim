set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.nvimrc

let g:python3_host_prog = '/home/gcrg/.pyenv/versions/neovim/bin/python'
lua require('config.lazy')
lua require('config.style-settings')
lua require('lspconfig')
lua require('plugins')
"lua require('after/ftplugin/haskell')
