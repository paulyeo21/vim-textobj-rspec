filetype plugin on
runtime! plugin/textobj/rspec.vim

function! ImportSampleFile()
  read `='t/sample_test.rb'`
endfunction

function! Select(line_number, object)
  call cursor(a:line_number, 1)
  execute 'normal' 'v'.a:object."\<Esc>"
  return [visualmode(), line("'<"), line("'>")]
endfunction

describe '<Plug>(textobj-rspec-a)'
  before
    new
    setfiletype ruby
    call ImportSampleFile()
  end

  after
    close!
  end

  it 'selects the parent of a nested block'
    Expect Select(4, 'af') ==# ['V', 4, 46]
    Expect Select(5, 'af') ==# ['V', 5, 15]
  end

  it 'selects the child of a nested block'
    " start of block
    Expect Select(6, 'af') ==# ['V', 6, 14]

    " within block
    Expect Select(11, 'af') ==# ['V', 6, 14]

    " end of block
    Expect Select(14, 'af') ==# ['V', 6, 14]
  end
end

describe '<Plug>(textobj-rspec-i)'
  before
    new
    setfiletype ruby
    call ImportSampleFile()
  end

  after
    close!
  end

  it 'selects the parent of a nested block'
    Expect Select(4, 'if') ==# ['V', 5, 45]
    Expect Select(5, 'if') ==# ['V', 6, 14]
  end

  it 'selects the child of a nested block'
    " start of block
    Expect Select(6, 'if') ==# ['V', 7, 13]

    " within block
    Expect Select(11, 'if') ==# ['V', 7, 13]

    " end of block
    Expect Select(14, 'if') ==# ['V', 7, 13]
  end
end
