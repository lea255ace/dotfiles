"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mandate how many lines of history to remember
set history=700

" Enable filetype plugins
filetype plugin on
filetype indent on

" Automatically detect external changes to a file
set autoread

" Set <leader> to ',' to allow quickfire commands
let mapleader=","
let g:mapleader=","

" Fast saving
nmap <leader>w :w!<cr>
nmap <leader>W :saveas

" Fast close all tabs
nmap <leader>q :qa<cr>

" Allow repetition (.) in visual mode
vnoremap . :norm.<CR>

inoremap jk <ESC>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM UI
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~

"Always show current position
set ruler

"The commandbar height
set cmdheight=2

" Hang onto changes when the buffer changes,
"  rather than force a save
set hid

" Allow backspace to run rampant
set backspace=2

" Ignore case when searching for all lower,
"  else consider case
set ignorecase
set smartcase

" Highlight search results, it's ugly but useful. Clear highlighting until
" next search with :noh
set hlsearch

" People will tell you to turn this on,
"  DON'T BELIEVE THEIR LIES
"  TODO(MW): Maybe believe their lies if you get good at jumping back to a
"  previous position
" set incsearch

" If vim gets sluggish, turn this on to not bother redrawing while macro'ing (performance)
" set lazyredraw

" Make regexes behave the way they should
set magic

" Highlight matching brackets
set showmatch

" Turn on line numbers, switch to hybrid in active buffer
set number
set relativenumber

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

" Set the colorscheme
colorscheme leef

" Set an orange color column at 81 characters
highlight ColorColumn ctermbg=DarkYellow
set colorcolumn=121

fun! ToggleHighlight()
  if !exists("g:hl_tl")
    let g:hl_tl = 0
  endif

  if g:hl_tl == 0
    let g:hl_tl = 1
    highlight TrailingWhitespace ctermbg=DarkRed ctermfg=white
  else
    let g:hl_tl = 0
    highlight clear TrailingWhitespace
  endif
endfun

" Highlight text over 100 chars with a red background
"highlight TrailingWhitespace ctermbg=DarkRed ctermfg=white
highlight clear TrailingWhitespace
match TrailingWhitespace /\s\+$/
map <leader>tw :call ToggleHighlight()<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => File Backups
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Make a temp backup until write succeeds, and keep a swap file
"  while file is open
set nobackup
set writebackup
set swapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, Tab, and Indent
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Expand tabs into spaces
set expandtab

" Be smart about tabs
set smarttab

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

" Wrap around screen width, early if necessary to avoid
"  breaking a word
set wrap
set linebreak
set breakat=\ !@;,/?
set showbreak=>\

" Indent reasonably
set autoindent
set smartindent
set cindent

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving Around, Tabs, Windows, and Buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Move the cursor over wrapped lines as if they had line breaks
map j gj
map k gk

" Better way to move between windows (masks redraw)
let g:BASH_Ctrl_j = 'off'
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Tab management
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>th :tabp<cr>
map <leader>tl :tabn<cr>
map <leader>tm :tabmove

" Open a new tab with the current buffer's path
map <leader>te :tabedit <c-r>=fnameescape(expand("%:p:h"))<cr>/<cr>

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Search other windows and tabs when switching buffers
try
  set switchbuf=useopen,usetab,newtab
catch
endtry

" Return to last edit position when opening a file
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif
" Remember info about open buffers on close
set viminfo^=%

" Always set the working directory to the directory of the
"   current file
set autochdir

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Status Line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Build the statusline
set statusline=%<\ 
set statusline+=%#statement#[%n]%*\               " Buffer number
set statusline+=[%f]%#special#%m%r%h%*\           " File Name and Flags
set statusline+=<%{strlen(&ft)?&ft:'none'}>\      " File Type
set statusline+=(%{&fileformat}->                 " File Format
set statusline+=%{strlen(&fenc)?&fenc:&enc})\ \   " File Encoding
set statusline+=CWD:%{CurDir()}\ \ \              " CWD
set statusline+=%#error#%{HasPaste()}%*           " Paste Mode
set statusline+=%=                                " Right Align
set statusline+=%P\                               " Percentage
set statusline+=%l/%L:%c\                         " Line and Column

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap 0 to first non-blank character
map 0 ^

"

" Allow use of ALT as meta
set winaltkeys=no

" Move a line of text with Ctrl-Shift-[jk]
nmap <M-j> :m+<cr>
nmap <M-k> :m-2<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spellcheck
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set ,ss to toggle spellcheck
map <leader>ss :setlocal spell!<cr>

" Next misspelled word
map <leader>sn ]s
" Previous misspelled word
map <leader>sp [s
" Add to dictionary
map <leader>sa zg
" Suggestions
map <leader>s? z=

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintain indentation format when pasting, F5 to toggle
nnoremap <F5> :set invpaste paste?<Enter>
imap <F5> <C-O><F5>
set pastetoggle=<F5>


function!CurDir()
	let curdir = substitute(getcwd(), '/home/leef/', "~/", "g")
    return curdir
endfunction

function! HasPaste()
    if &paste
        return ' PASTE '
    else
        return ''
    endif
endfunction
