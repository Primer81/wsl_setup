" Vim syntax file
" Language:	LibConfig
" Maintainer:	Ethan Larkham <ethanlarkham@protonmail.com>
" Last Change: 2019-19-25
" Version: 0.1

if !exists("main_syntax")
  " quit when a syntax file was already loaded
  if exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'libconfig'
endif


syn match cfgKey /\v\s*\zs[[:alnum:]._-]+\ze\s*[\=:]/ display

syn match  cfgStringMatch /"\([^"]\|\\\"\)\+"\ze[[:blank:]\r\n]*[;,}\]]/ contains=cfgString
syn region cfgString oneline matchgroup=cfgQuote start=/"/  skip=/\\\\\|\\"/  end=/"/ contained

syn match cfgNumber "-\=\<\%(0\|[1-9]\d*\)\%(\.\d\+\)\=\%([eE][-+]\=\d\+\)\=\>\ze[[:blank:]\r\n]*[;,}\]]"
syn match cfgBoolean /\(true\|false\)\(\_s\+\ze"\)\@!/

syn region cfgFold matchgroup=cfgBraces start="{" end=/}\(\_s\+\ze\("\|{\)\)\@!/ transparent fold
syn region cfgFold matchgroup=cfgBraces start="\[" end=/]\(\_s\+\ze"\)\@!/ transparent fold
syn region cfgFold matchgroup=cfgBraces start="(" end=/)\(\_s\+\ze"\)\@!/ transparent fold

syn keyword cfgInclude @include
hi def link cfgInclude Include

" Comments
syn keyword cfgTodo TODO FIXME XXX BUG contained
hi def link cfgTodo Todo

syn match cfgComment /#.*/ contains=@Spell,cfgTodo
hi def link cfgComment Comment

syn match cfgComment /\/\/.*/ contains=@Spell,cfgTodo
hi def link cfgComment Comment

" Define the default highlighting.
" Only when an item doesn't have highlighting yet
hi def link cfgKey        Identifier
hi def link cfgString     String
hi def link cfgNumber     Number
hi def link cfgBraces     Delimiter
hi def link cfgBoolean    Boolean
hi def link cfgQuote      Quote

let b:current_syntax = "libconfig"
if main_syntax == 'libconfig'
  unlet main_syntax
endif
