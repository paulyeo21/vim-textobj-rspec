" Vim text obj plugin for rspec functions
" Author: Paul Yeo <paulyeo21@gmail.com>

let s:RSPEC_BLOCK_PATTERNS = {
      \ 'begin': '\v^\s*<%(describe|context|it)>',
      \ 'end': '\v^\s*<end>',
      \ }

function! s:select_a()
  if getline('.') !~# s:RSPEC_BLOCK_PATTERNS.end
    if searchpair(s:RSPEC_BLOCK_PATTERNS.begin, '', s:RSPEC_BLOCK_PATTERNS.end, 'W') <= 0
      return 0
    endif
  endif

  normal! $
  let e = getpos('.')

  normal! 0
  call searchpair(s:RSPEC_BLOCK_PATTERNS.begin, '', s:RSPEC_BLOCK_PATTERNS.end, 'bW')
  let b = getpos('.')

  if b != e
    return ['V', b, e]
  else
    return 0
  endif
endfunction

function! s:select_i()
  let range = s:select_a()
  if range is 0
    return 0
  endif

  let [_, ba, ea] = range
  if ea[1] - ba[1] <= 1 " The function doesn't contain any code
    return 0
  endif

  call setpos('.', ba)
  normal! j0
  let bi = getpos('.')

  call setpos('.', ea)
  normal! k$
  let ei = getpos('.')

  return ['V', bi, ei]
endfunction

function! textobj#rspec#a() abort
  return s:select_a()
endfunction

function! textobj#rspec#i() abort
  return s:select_i()
endfunction
