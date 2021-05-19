" Vim text obj plugin for rspec functions
" Author: Paul Yeo <paulyeo21@gmail.com>

if exists('g:loaded_textobj_rspec')
  finish
endif

call textobj#user#plugin('rspec', {
      \ 'func': {
      \   'sfile': expand('<sfile>:p'),
      \   'select-a': 'af',
      \   'select-a-function': 'textobj#rspec#a',
      \   'select-i': 'if',
      \   'select-i-function': 'textobj#rspec#i',
      \ },
      \ })

let g:loaded_textobj_rspec = 1
