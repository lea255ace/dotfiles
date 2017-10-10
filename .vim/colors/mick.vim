" local syntax file - set colors on a per-machine basis:
" vim: tw=0 ts=4 sw=4
" Vim color file
" Maintainer:Mick Wollman
" Last Change:Tue Oct 08  2245 2013 EST

hi clear
set background=dark
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "mick"
hi Normal		  	  ctermfg=White       ctermbg=Black
hi SpecialKey	  	ctermfg=Blue
hi NonText        ctermfg=LightGrey
hi Directory	  	ctermfg=Blue
hi ErrorMsg		  	ctermfg=White       ctermbg=Red
hi Search		  	  ctermfg=white       ctermbg=Red
hi MoreMsg		  	ctermfg=Green
hi ModeMsg		  	ctermfg=White       ctermbg=Black
hi LineNr		  	  ctermfg=Yellow
hi Question		  	gui=bold  guifg=Green
hi StatusLineNC		cterm=none ctermfg=grey  ctermbg=darkblue
hi StatusLine		  cterm=none ctermfg=white ctermbg=darkblue
hi VertSplit      ctermfg=Cyan ctermbg=Black
hi Title			    gui=bold	guifg=Magenta
hi Visual			    cterm=none ctermfg=white ctermbg=darkgreen gui=NONE		guifg=white guibg=darkgreen
hi WarningMsg		  guifg=Red
hi FoldColumn		  ctermfg=Black ctermbg=Grey guibg=DarkGrey guifg=Black
hi Folded			    ctermfg=Black ctermbg=Grey guifg=Black
hi Cursor			    guifg=bg	guibg=Green
hi Comment			  cterm=none ctermfg=DarkGreen gui=italic guifg=green
hi Constant			  ctermfg=Cyan guifg=cyan 
hi Special			  ctermfg=Yellow guifg=Orange
hi Identifier		  ctermfg=Grey guifg=cyan 
hi Statement		  ctermfg=DarkYellow gui=bold guifg=darkyellow 
hi Number			    ctermfg=Cyan guifg=Cyan
hi PreProc			ctermfg=Magenta guifg=darkmagenta
hi String			ctermfg=DarkRed guifg=Red
hi Type				ctermfg=DarkBlue  guifg=blue
hi Error			ctermbg=Red ctermfg=White guifg=Red	guibg=Black
hi Todo				ctermfg=Black ctermbg=Yellow guifg=Blue  guibg=Yellow
hi link IncSearch		Visual
hi link String			Constant
hi link Character		Constant
hi link Number			Constant
hi link Boolean			Constant
hi link Float			Number
hi link Function		Identifier
hi link Conditional		Statement
hi link Repeat			Statement
hi link Label			Statement
hi link Operator		Statement
hi link Keyword			Statement
hi link Exception		Statement
hi link Include			PreProc
hi link Define			PreProc
hi link Macro			PreProc
hi link PreCondit		PreProc
hi link StorageClass	Type
hi link Structure		Type
hi link Typedef			Type
hi link Tag				Special
hi link SpecialChar		Special
hi link Delimiter		Special
hi link SpecialComment	Special
hi link Debug			Special
