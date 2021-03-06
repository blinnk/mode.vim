" * 🍖 *
" Author: utubo
" Notes:
" Thx: This is based on https://github.com/ggalindezb/vim_colorscheme_template

highlight clear
if exists('syntax_on')
  syntax reset
endif
let s:colors_name = expand('<sfile>:t:r')
let g:colors_name = s:colors_name

" COLORS
"   <type><opacity>
" type:
"   n: normal
"   b: positiv1(blue)
"   g: positiv2(green)
"   y: warn(yellow)
"   r: error(red)
"   c: cyan(for terminal)
"   m: magenta(for terminal)
" opacity:
"   0: 0% Default BG (only n0)
"   1: 20% BG
"   2: 60% Middle FG
"   3: 80% Default FG
"   4: 100% Highlight (eg. b4=cursor,g4=search)
"   9: 100% Highlight on &background == 'light'
if has('gui_running') || &termguicolors
  let s:term = 'gui'
  let s:n0 = '#151515'
  let s:n1 = '#c3c9c2'
  let s:n2 = '#252525'
  let s:n3 = '#c3c9c2'
  let s:n4 = '#c3c9c2'
  let s:b1 = '#c3c9c2'
  let s:b2 = '#807C82'
  let s:b3 = '#e7e7e7'
  let s:b4 = '#5b655a'
  let s:b9 = '#292e28'
  let s:g1 = '#78535d'
  let s:g2 = '#737a6f'
  let s:g3 = '#78535d'
  let s:g4 = '#737a6f'
  let s:g9 = '#78535d'
  let s:y1 = '#4a4a4a'
  let s:y2 = '#d3c9ae' " not used
  let s:y3 = '#A59E8A'
  let s:y4 = '#d3c9ae'
  let s:y9 = '#d3c9ae'
  let s:r1 = '#282123'
  let s:r2 = '#78535d'
  let s:r3 = '#78535d'
  let s:r4 = '#78535d'
  let s:r9 = '#78535d'
  let s:c2 = '#595f56'
  let s:c4 = '#78535d'
  let s:m2 = '#473f3f'
  let s:m4 = '#766564'
else
  set t_Co=256
  let s:term = 'cterm'
  let s:n0 = '233'
  let s:n1 = '237'
  let s:n2 = '8'
  let s:n3 = '248'
  let s:n4 = '251'
  let s:b1 = '235'
  let s:b2 = '238'
  let s:b3 = '239'
  let s:b4 = '59'
  let s:b9 = '236'
  let s:g1 = '237'
  let s:g2 = '243'
  let s:g3 = '246'
  let s:g4 = '249'
  let s:g9 = '239'
  let s:y1 = '237'
  let s:y2 = '8' " not used
  let s:y3 = '144'
  let s:y4 = '187'
  let s:y9 = '101'
  let s:r1 = '235'
  let s:r2 = '238' " not used
  let s:r3 = '240'
  let s:r4 = '95'
  let s:r9 = '95'
  let s:c2 = '240'
  let s:c4 = '245'
  let s:m2 = '238'
  let s:m4 = '59'
endif

if &background == 'light'
  let [s:n0, s:n1, s:n3, s:n4] = [s:n4, s:n3, s:n1, s:n0]
  let [s:b1, s:b3, s:b4] = [s:b3, s:b1, s:b9]
  let [s:g1, s:g3, s:g4] = [s:g3, s:g1, s:g9]
  let [s:y1, s:y3, s:y4] = [s:y3, s:y1, s:y9]
  let [s:r1, s:r3, s:r4] = [s:r3, s:r1, s:r9]
endif

let s:fg     = s:term.'fg='
let s:bg     = s:term.'bg='
let s:sp     = s:term ==# 'gui' ? 'guisp=' : 'ctermul='
let s:style  = has('gui_running') ? 'gui=' : 'cterm='
let s:none   = s:style.'NONE'
let s:bold   = s:style.'bold'
let s:italic = s:style.'italic'
let s:underline = s:style.'underline'
let s:undercurl = s:style.'undercurl'

" --------
" - Base -
" --------
exe 'hi Normal'        s:fg s:m4 s:bg s:n0
exe 'hi Cursor'        s:fg s:n4 s:bg s:b2
exe 'hi CursorIM'      s:fg s:n4 s:bg s:y4
exe 'hi CursorLine'    s:fg s:n1 s:bg s:m2 s:none
exe 'hi LineNr'        s:fg s:m2 s:bg s:n1
exe 'hi CursorLineNR'  s:fg s:n4 s:bg s:n0 s:none

" -----------------
" - Number column -
" -----------------
exe 'hi CursorColumn'  s:bg s:b1
exe 'hi SignColumn'    s:fg s:g4 s:bg s:n1
exe 'hi FoldColumn'    s:fg s:n2 s:bg s:n1
exe 'hi Folded'        s:fg s:n2 s:bg s:n0

" -------------------------
" - Window/Tab delimiters -
" -------------------------
exe 'hi VertSplit'     s:fg s:n3 s:bg s:n3
exe 'hi ColorColumn'   s:fg s:n2 s:bg s:n1
exe 'hi TabLine'       s:fg s:n3 s:bg s:n1 s:none
exe 'hi TabLineFill'   s:fg s:n1 s:bg s:n1 s:none
exe 'hi TabLineSel'    s:fg s:b3 s:bg s:n0 s:bold

" -------------------------------
" - File Navigation / Searching -
" -------------------------------
exe 'hi Directory'     s:fg s:n1
exe 'hi Search'        s:fg s:n0 s:bg s:g4 s:bold
hi! link IncSearch Cursor

" -----------------
" - Prompt/Status -
" -----------------
exe 'hi StatusLine'    s:fg s:n2 s:bg s:n1
exe 'hi StatusLineNC'  s:fg s:n3 s:bg s:n2
exe 'hi Question'      s:fg s:y4 s:bg s:n0 s:none
exe 'hi Title'         s:fg s:b3 s:bg s:n0 s:bold
exe 'hi ModeMsg'       s:fg s:n3 s:bg s:n0 s:none
exe 'hi MoreMsg'       s:fg s:n2 s:bg s:n0 s:none
hi! link WildMenu Visual

" --------------
" - Visual aid -
" --------------
exe 'hi MatchParen'    s:fg s:b4 s:bg s:n1
exe 'hi Visual'        s:fg s:n0 s:bg s:m4 s:none
exe 'hi VisualNOS'     s:fg s:n3 s:bg s:n1 s:none
exe 'hi NonText'       s:fg s:n1 s:none

exe 'hi Todo'          s:fg s:b4 s:bg 'NONE' s:bold
exe 'hi Underlined'    s:fg s:b4
exe 'hi Error'         s:fg s:r4 s:bg 'NONE' s:bold
exe 'hi ErrorMsg'      s:fg s:r3 s:bg 'NONE' s:none
exe 'hi WarningMsg'    s:fg s:y3
hi! link Ignore NonText
hi! link SpecialKey NonText

" ------------------
" - Variable types -
" ------------------
exe 'hi Function'      s:fg s:n3
exe 'hi Identifier '   s:fg s:n3
exe 'hi Constant'      s:fg s:n3
exe 'hi String'        s:fg s:g2 s:bg s:n0
exe 'hi Character'     s:fg s:b2
exe 'hi Number'        s:fg s:b3
hi! link Boolean Number
hi! link Float Number

" -----------------------
" - Language constructs -
" -----------------------
exe 'hi Statement'     s:fg s:b3
exe 'hi Conditional'   s:fg s:b3
exe 'hi Repeat'        s:fg s:b3
exe 'hi Label'         s:fg s:b3 s:bold
exe 'hi Keyword'       s:fg s:b2
exe 'hi Exception'     s:fg s:y3
exe 'hi Comment'       s:fg s:y1
exe 'hi SpecialComment' s:fg s:g2 s:italic
exe 'hi SpecialChar'   s:fg s:b3
exe 'hi Tag'           s:fg s:g2
exe 'hi Type'          s:fg s:g4
exe 'hi Delimiter'     s:fg s:y3
exe 'hi Debug'         s:fg s:n2
hi! link Operator Normal
hi! link Special Statement

" ----------
" - C like -
" ----------
exe 'hi PreProc' s:fg s:b3


" --------
" - Diff -
" --------
exe 'hi DiffAdd'       s:fg s:b1 s:bg s:b3
exe 'hi DiffChange'    s:fg s:y1 s:bg s:y3
exe 'hi DiffDelete'    s:fg s:r2 s:bg s:r3
exe 'hi DiffText'      s:fg s:g1 s:bg s:g3 s:none

" -------------------
" - Completion menu -
" -------------------
exe 'hi Pmenu'         s:fg s:n1 s:bg s:b4
hi! link PmenuSel Cursor
exe 'hi PmenuSbar'     s:bg s:b1
exe 'hi PmenuThumb'    s:bg s:b3

" ------------
" - Spelling -
" ------------
exe 'hi SpellBad'      s:fg s:r3 s:bg s:r1 s:sp s:r4 s:undercurl
exe 'hi SpellCap'      s:fg s:y3 s:bg s:n0 s:sp s:y4 s:undercurl
exe 'hi SpellLocal'    s:fg s:g3 s:bg s:n0 s:sp s:g4 s:undercurl
exe 'hi SpellRare'     s:fg s:b3 s:bg s:n0 s:sp s:b4 s:undercurl

" ---------------------
" - Terminal -
" ---------------------
if s:term ==# 'gui'
  let g:terminal_ansi_colors = [
  \ s:n0, s:r2, s:g2, s:y2, s:b2, s:m2, s:c2, s:n3,
  \ s:n0, s:r4, s:g4, s:y4, s:b4, s:m4, s:c4, s:n4
  \ ]
endif

" ---------------------
" - Specific settings -
" ---------------------
exe 'hi JavaScriptEmbed' s:fg s:g4 s:bg s:n1

" Easy motion
exe 'hi EasyMotionShadeDefault' s:fg s:n2 s:bg s:n0
exe 'hi EasyMotionTarget' s:fg s:b4 s:bg s:n0
exe 'hi EasyMotionTarget2First' s:fg s:g4 s:bg s:n0
hi! link EasyMotionTarget2Second EasyMotionTarget2First

" ALE
exe 'hi ALEErrorSign' s:fg s:r4 s:bg s:n1
exe 'hi ALEWarningSign' s:fg s:y4 s:bg s:n1

" rainbow
let g:rainbow_conf = get(g:, 'rainbow_conf', {})
let g:rainbow_conf[s:term.'fgs'] = [s:b4, s:g4, s:y4, s:r4]

" rainbow-csv
if s:term ==# 'gui'
  let g:rcsv_colorpairs = [['7', s:b4], ['7', s:g4], ['7', s:y4], ['7', s:r4]]
else
  let g:rcsv_colorpairs = [[s:b4, 'Gray'], [s:g4, 'Gray'], [s:y4, 'Gray'], [s:r4, 'Gray']]
endif

function s:CustomSyntax()
  if g:colors_name != s:colors_name
    exe 'augroup CustomSyntax_' . s:colors_name . '|au!|augroup END'
    return
  endif
  " GitGutter
  exe 'hi GitGutterAdd' s:fg s:g3 s:bg s:none
  exe 'hi GitGutterChange' s:fg s:b2 s:bg s:none
  exe 'hi GitGutterDelete' s:fg s:r3 s:bg s:none
  hi! link diffAdded DiffAdd
  hi! link diffChanged DiffChange
  hi! link diffRemoved DiffDelete
endfunction

exe 'augroup CustomSyntax_' . s:colors_name . '|au!|au ColorScheme,Syntax * call <SID>CustomSyntax()|augroup END'
call s:CustomSyntax()

