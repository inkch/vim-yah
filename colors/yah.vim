" Initialisation
" ----------------------------------------------------------------------------
hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "yah"


" highlight helper function
" ----------------------------------------------------------------------------
function! s:h(group_name, values)
  if type(a:values) == v:t_string
    exe "hi! " . a:group_name . " " . a:values
    return
  endif

  if type(a:values) == v:t_list
    let l:fg  = " guifg=" .a:values[0]
    let l:bg  = " guibg=" .a:values[1]
    let l:fmt = a:values[2]
    exe "hi! " . a:group_name . " " . l:fg . l:bg . l:fmt
    return
  endif

  echoe "vim-yah: Invalid argument type: " . a:values
endfunction



" Palette
" ----------------------------------------------------------------------------
let s:p = {}
let s:p.black     = "#121212"
let s:p.bri_black = "#1f1f1f"
let s:p.gray      = "#333333"
let s:p.bri_gray  = "#525252"
let s:p.dim_white = "#707880"
let s:p.white     = "#cccccc"
let s:p.orange    = "#de935f"
let s:p.red       = "#cc6666"
let s:p.yellow    = "#f0c674"
let s:p.magenta   = "#b294bb"
let s:p.cyan      = "#8abeb7"
let s:p.green     = "#b5bd68"
let s:p.blue      = "#81a2be"
let s:p.bri_green = "#d7ffaf"



" Formatting Options
" ----------------------------------------------------------------------------
let s:none   = "NONE"
let s:t_none = "NONE"
let s:n      = "NONE"
let s:c      = ",undercurl"
let s:r      = ",reverse"
let s:s      = ",standout"
let s:b      = ",bold"
let s:u      = ",underline"
let s:i      = ",italic"

exe "let s:fmt_none = ' gui=NONE".          " cterm=NONE".          " term=NONE"        ."'"
exe "let s:fmt_bold = ' gui=NONE".s:b.      " cterm=NONE".s:b.      " term=NONE".s:b    ."'"
exe "let s:fmt_bldi = ' gui=NONE".s:b.      " cterm=NONE".s:b.      " term=NONE".s:b    ."'"
exe "let s:fmt_undr = ' gui=NONE".s:u.      " cterm=NONE".s:u.      " term=NONE".s:u    ."'"
exe "let s:fmt_undb = ' gui=NONE".s:u.s:b.  " cterm=NONE".s:u.s:b.  " term=NONE".s:u.s:b."'"
exe "let s:fmt_undi = ' gui=NONE".s:u.      " cterm=NONE".s:u.      " term=NONE".s:u    ."'"
exe "let s:fmt_curl = ' gui=NONE".s:c.      " cterm=NONE".s:c.      " term=NONE".s:c    ."'"
exe "let s:fmt_ital = ' gui=NONE".s:i.      " cterm=NONE".s:i.      " term=NONE".s:i    ."'"
exe "let s:fmt_stnd = ' gui=NONE".s:s.      " cterm=NONE".s:s.      " term=NONE".s:s    ."'"
exe "let s:fmt_revr = ' gui=NONE".s:r.      " cterm=NONE".s:r.      " term=NONE".s:r    ."'"
exe "let s:fmt_revb = ' gui=NONE".s:r.s:b.  " cterm=NONE".s:r.s:b.  " term=NONE".s:r.s:b."'"



" Vim Highlighting: (see :help highlight-groups)
" ----------------------------------------------------------------------------
call s:h("Normal"          , [s:p.white     , s:p.black     , s:fmt_none])
call s:h("ColorColumn"     , ["NONE"        , s:p.bri_black , s:fmt_none])
call s:h("CursorColumn"    , ["NONE"        , s:p.bri_black , s:fmt_none])
call s:h("CursorLine"      , ["NONE"        , s:p.bri_black , s:fmt_none])
call s:h("CursorLineNr"    , [s:p.yellow    , "NONE"        , s:fmt_none])
call s:h("LineNr"          , [s:p.bri_gray  , "NONE"        , s:fmt_none])
call s:h("Directory"       , [s:p.blue      , "NONE"        , s:fmt_none])
call s:h("DiffAdd"         , [s:p.green     , s:p.black     , s:fmt_none])
call s:h("DiffChange"      , [s:p.magenta   , s:p.black     , s:fmt_none])
call s:h("DiffText"        , [s:p.white     , s:p.black     , s:fmt_none])
call s:h("ErrorMsg"        , [s:p.white     , s:p.red       , s:fmt_stnd])
call s:h("VertSplit"       , [s:p.black     , "NONE"        , s:fmt_none])
call s:h("Folded"          , [s:p.dim_white , s:p.black     , s:fmt_none])
call s:h("FoldColumn"      , ["NONE"        , s:p.black     , s:fmt_none])
call s:h("SignColumn"      , ["NONE"        , s:p.black     , s:fmt_none])
call s:h("MatchParen"      , [s:p.yellow    , s:p.black     , s:fmt_undb])
call s:h("ModeMsg"         , [s:p.green     , "NONE"        , s:fmt_none])
call s:h("MoreMsg"         , [s:p.green     , "NONE"        , s:fmt_none])
call s:h("NonText"         , [s:p.bri_gray  , "NONE"        , s:fmt_none])
call s:h("Pmenu"           , [s:p.white     , s:p.gray      , s:fmt_none])
call s:h("PmenuSel"        , [s:p.white     , s:p.gray      , s:fmt_revr])
call s:h("Question"        , [s:p.green     , "NONE"        , s:fmt_none])
call s:h("Search"          , [s:p.white     , s:p.gray      , s:fmt_none])
call s:h("SpecialKey"      , [s:p.gray      , "NONE"        , s:fmt_none])
call s:h("SpellCap"        , [s:p.magenta   , "NONE"        , s:fmt_undr])
call s:h("SpellLocal"      , [s:p.blue      , "NONE"        , s:fmt_undr])
call s:h("SpellBad"        , [s:p.red       , "NONE"        , s:fmt_undr])
call s:h("SpellRare"       , [s:p.cyan      , "NONE"        , s:fmt_undr])
call s:h("StatusLine"      , [s:p.white     , s:p.bri_black , s:fmt_none])
call s:h("StatusLineNC"    , [s:p.dim_white , s:p.bri_black , s:fmt_none])
call s:h("WildMenu"        , [s:p.black     , s:p.orange    , s:fmt_none])
call s:h("TabLine"         , [s:p.white     , s:p.black     , s:fmt_revr])
call s:h("Title"           , [s:p.yellow    , "NONE"        , s:fmt_none])
call s:h("Visual"          , ["NONE"        , s:p.gray      , s:fmt_none])
call s:h("WarningMsg"      , [s:p.red       , "NONE"        , s:fmt_none])
call s:h("LongLineWarning" , ["NONE"        , "NONE"        , s:fmt_undr])



" Generic Syntax Highlighting: (see :help group-name)
" ----------------------------------------------------------------------------
call s:h("Comment"           , [s:p.dim_white , "NONE"        , s:fmt_none])
call s:h("Constant"          , [s:p.red       , "NONE"        , s:fmt_none])
call s:h("String"            , [s:p.green     , "NONE"        , s:fmt_none])
call s:h("Identifier"        , [s:p.magenta   , "NONE"        , s:fmt_none])
call s:h("Function"          , [s:p.yellow    , "NONE"        , s:fmt_none])
call s:h("Statement"         , [s:p.blue      , "NONE"        , s:fmt_none])
call s:h("Operator"          , [s:p.yellow    , "NONE"        , s:fmt_none])
call s:h("PreProc"           , [s:p.blue      , "NONE"        , s:fmt_none])
call s:h("Type"              , [s:p.orange    , "NONE"        , s:fmt_none])
call s:h("Structure"         , [s:p.blue      , "NONE"        , s:fmt_none])
call s:h("Special"           , [s:p.cyan      , "NONE"        , s:fmt_none])
call s:h("Underlined"        , [s:p.blue      , "NONE"        , s:fmt_none])
call s:h("Ignore"            , ["NONE"        , "NONE"        , s:fmt_none])
call s:h("Error"             , [s:p.white     , s:p.red       , s:fmt_none])
call s:h("Todo"              , [s:p.bri_green , "NONE"        , s:fmt_none])
call s:h("qfLineNr"          , [s:p.blue      , "NONE"        , s:fmt_none])
call s:h("Conceal"           , [s:p.dim_white , "NONE"        , s:fmt_none])
call s:h("CursorLineConceal" , [s:p.dim_white , s:p.bri_black , s:fmt_none])



" Fix colors in NeoVim terminal buf
" ----------------------------------------------------------------------------
if has("nvim")
  let g:terminal_color_0  = s:p.black
  let g:terminal_color_1  = s:p.orange
  let g:terminal_color_2  = s:p.yellow
  let g:terminal_color_3  = s:p.yellow
  let g:terminal_color_4  = s:p.magenta
  let g:terminal_color_5  = s:p.red
  let g:terminal_color_6  = s:p.cyan
  let g:terminal_color_7  = s:p.white
  let g:terminal_color_8  = s:p.gray
  let g:terminal_color_9  = s:p.red
  let g:terminal_color_10 = s:p.yellow
  let g:terminal_color_11 = s:p.yellow
  let g:terminal_color_12 = s:p.magenta
  let g:terminal_color_13 = s:p.red
  let g:terminal_color_14 = s:p.cyan
  let g:terminal_color_15 = s:p.dim_white
  let g:terminal_color_background = g:terminal_color_0
  let g:terminal_color_foreground = s:p.white
endif



" Git Gutter
" ----------------------------------------------------------------------------
call s:h("GitGutterAdd"          , [s:p.green  , "NONE" , s:fmt_none])
call s:h("GitGutterChange"       , [s:p.blue   , "NONE" , s:fmt_none])
call s:h("GitGutterDelete"       , [s:p.red    , "NONE" , s:fmt_none])
call s:h("GitGutterChangeDelete" , [s:p.yellow , "NONE" , s:fmt_none])



" minimap.vim
" ----------------------------------------------------------------------------
call s:h("MinimapBaseLine"    , [s:p.dim_white , "NONE"   , s:fmt_none])
call s:h("MinimapCurrentLine" , [s:p.yellow    , s:p.gray , s:fmt_none])



" Diff Syntax Highlighting
" ----------------------------------------------------------------------------
call s:h("link", "diffRemoved Constant")
call s:h("link", "diffAdded String")



" This is needed for some reason
let &background = 'dark'
