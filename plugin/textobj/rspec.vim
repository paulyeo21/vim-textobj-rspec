" Vim text obj plugin for rspec functions
" Author: Paul Yeo <paulyeo21@gmail.com>

if exists('g:loaded_textobj_rspec')
  finish
endif

call textobj#user#plugin('rspec', {
      \ 'describe': {
      \   'sfile': expand('<sfile>:p'),
      \   'select-a': 'ad',
      \   'select-a-function': 'textobj#rspec#a_describe',
      \   'select-i': 'id',
      \   'select-i-function': 'textobj#rspec#i_describe',
      \  },
      \ 'context': {
      \   'sfile': expand('<sfile>:p'),
      \   'select-a': 'ac',
      \   'select-a-function': 'textobj#rspec#a_context',
      \   'select-i': 'ic',
      \   'select-i-function': 'textobj#rspec#i_context',
      \  },
      \ 'it': {
      \   'sfile': expand('<sfile>:p'),
      \   'select-a': 'ai',
      \   'select-a-function': 'textobj#rspec#a_it',
      \   'select-i': 'ii',
      \   'select-i-function': 'textobj#rspec#i_it',
      \  },
})

let g:loaded_textobj_rspec = 1
