" Vim indent file
" Language: RIDE
" Maintainer: Ruslan Osmanov <rrosmanov@gmail.com>

if exists("b:did_indent")
  finish
endif
let b:did_indent = 1
let b:else_pattern = '\v<else>\s*\{$'
let b:else_only_pattern = '\v<else>\s*$'

setlocal indentexpr=GetRideIndent()
setlocal indentkeys=0{,0},!^F,o,O
setlocal nosmartindent

let b:undo_indent = "setl smartindent< indentkeys< indentexpr<"

if exists("*GetRideIndent")
  finish
endif
let s:keepcpo= &cpo
set cpo&vim

function s:prevnonblanknoncomment(lnum)
  let lnum = a:lnum
  let lnum = prevnonblank(lnum)
  let line = getline(lnum)
  if line =~ '^\s*#'
    let lnum -= 1
  endif
  return lnum
endfunction

function s:count_braces(lnum, count_open)
  let n_open = 0
  let n_close = 0
  let line = getline(a:lnum)
  let pattern = '[{}\[\]]'
  let i = match(line, pattern)
  while i != -1
    if synIDattr(synID(a:lnum, i + 1, 0), 'name') !~ 'ride\%(Comment\|StringQ\{1,2}\)'
      if line[i] == '{' || line[i] == '['
        let n_open += 1
      elseif line[i] == '}' || line[i] == ']'
        if n_open > 0
          let n_open -= 1
        else
          let n_close += 1
        endif
      endif
    endif
    let i = match(line, pattern, i + 1)
  endwhile
  return a:count_open ? n_open : n_close
endfunction

function GetRideIndent()
  let line = getline(v:lnum)
  let pnum = s:prevnonblanknoncomment(v:lnum - 1)
  let prev_line = getline(pnum)
  if pnum == 0
    return 0
  endif

  let indent = indent(pnum) + s:count_braces(pnum, 1) * shiftwidth()
        \ - s:count_braces(v:lnum, 0) * shiftwidth()

  if prev_line =~ '\<if\>.*\<then\>\s*$' || prev_line =~ b:else_only_pattern
      let indent += shiftwidth()
  endif

  if line =~ b:else_pattern
      let indent -= shiftwidth()
  endif

  return indent
endfunction

let &cpo = s:keepcpo
unlet s:keepcpo
