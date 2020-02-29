" fzf-to-functions.vim - Use fzf for navegate throught functions/methods of any
" language
" Maintainer:   Alex VKO
" Version:      0.1
"
if exists("g:fzf_to_function_loaded")
  finish
endif
let g:fzf_to_function_loaded = 1

function! s:align_lists(lists)
  let maxes = {}
  for list in a:lists
    let i = 0
    while i < len(list)
      let maxes[i] = max([get(maxes, i, 0), len(list[i])])
      let i += 1
    endwhile
  endfor
  for list in a:lists
    call map(list, "printf('%-'.maxes[v:key].'s', v:val)")
  endfor
  return a:lists
endfunction

function! s:methods_source()
  let lines = map(split(system(printf('cat %s | grep "def\ .*do"', expand('%:S'))), "\n"), 'split(v:val, "\t")')
  return map(s:align_lists(lines), 'join(v:val, "\t")')
endfunction

function! s:bmethods_sink(line)
  let line = substitute(a:line, '\s*$', '', 'g')
  execute search(line)
  normal zz
endfunction

function! s:fzfmethods()
  try
    call fzf#run({
    \ 'source':  s:methods_source(),
    \ 'options': '+m -d "\t" --with-nth 1,4.. -n 1 --tiebreak=index',
    \ 'down':    '20%',
    \ 'sink':    function('s:bmethods_sink')})
  catch
    echohl WarningMsg
    echom v:exception
    echohl None
  endtry
endfunction

command! FzfMethods call s:fzfmethods()
