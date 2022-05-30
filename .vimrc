" vim:foldmethod=marker

" language en_GB.utf8       " sets the language of the messages / ui (vim)

" ============== PLUGINS ===================== {{{
set nocompatible              " be iMproved, required

" auto install vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'junegunn/vim-plug'

Plug 'morhetz/gruvbox'

" snippets
" Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
" Plug 'honza/vim-snippets'

" Niceness
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'

" Filetype specific
" Plug 'lervag/vimtex'

" Themes
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

" Snippets configuration
let g:UltiSnipsExpandTrigger="<c-s>"
let g:UltiSnipsJumpForwardTrigger="<c-s>"
let g:UltiSnipsJumpBackwardTrigger="<c-a>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="tabdo"

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1


" ===================== END PLUGINS ==========================}}}

" command to edit this file
command! Erc tabnew ~/.vimrc
command! Src source ~/.vimrc

" ============== KEYBINDS ==================== {{{

" go from insert to visual mode with Ctrl-Space
"inoremap <C-Space> <Esc>viw

" save on \s
nnoremap <leader>s :w<CR>

" toggle relative numbers
nnoremap <leader>n :set relativenumber!<CR>

" when searching, remap \r to go to found, replace and insert mode
nnoremap <leader>r cgn
" stop highlighting
nnoremap <leader>h :nohlsearch<CR>
nnoremap <F3> :nohlsearch<CR>

" spell checking
nnoremap <F6> :call ToggleSpell()<CR>

" enable line wrapping
noremap <silent> <Leader>w :call ToggleWrap()<CR>

" toggle nerdTree
nnoremap <leader>f :NERDTreeToggle<CR>

" make
nnoremap <leader>m :make<CR>

" trim all whitespace
nnoremap <leader>t :call TrimWhitespace()<CR>

" AUTO COMPLETION {{{
" completion popup remaps for tab, enter and esc
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" pair autocompletion
inoremap {<CR> {<CR>}<Esc>ko<TAB>
" }}}

" SENSIBLE COPY AND PASTE {{{
" noremap <C-c> y
" noremap <M-v> <C-v>
" noremap <C-v> p
" noremap <C-x> d

" x just deletes, no clipboard, while d cuts to clipboard
nnoremap <leader>d "_d
vnoremap <leader>d "_d
nnoremap x "_x
vnoremap x "_x
" paste in insert mode
inoremap <C-v> <Esc>pa
" }}}

" TABS AND SPLITS {{{
"Map CTRL+T then:
"       left = previous tab     right= next tab
"       plus = new tab"
" Also <leader>n to tab n
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <C-o> :tabp<cr>
noremap <C-p> :tabn<cr>
noremap <C-t>+ :tabnew<cr>

" Move to splits
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

noremap <M-Left> <C-w>h
noremap <M-Down> <C-w>j
noremap <M-Up> <C-w>k
noremap <M-Right> <C-w>l
" Resize splits
noremap <M-h> <C-w>5<
noremap <M-l> <C-w>5>
noremap <M-k> <C-w>2+
noremap <M-j> <C-w>2-

noremap <M-,> <C-w>5<
noremap <M-.> <C-w>5>
" }}}
" }}}


" ============== FILETYPE SPECIFIC =========== {{{
augroup text
    autocmd!
    autocmd FileType tex,latex,markdown,plaintext,text call ToggleSpell()|call ToggleWrap()
augroup END
" }}}


" ============== TWEAKS ====================== {{{

"Make new splits open below or to the right instead of left and above
set splitbelow
set splitright

" make ToggleWrap do what it's supposed to
set nowrap nolinebreak

" Scroll before hitting bottom
set scrolloff=3

" Searching
set incsearch           " do incremental searching
set hlsearch            " highlight search results
set ignorecase smartcase " what to do with case-sensitivity when searching

" Funky clipboard business to set default copy to system clipboard (register
" +), as opposed to vim internal register "
set clipboard=unnamedplus
set encoding=utf-8

" some visual stuff
set number              " show line numbers
set ww+=<,>,[,],h,l	    " wrap cursor movement through line numbers and everything
set ruler               " show the cursor position all the time
set showcmd             " display incomplete commands
set cursorline          " highlight current line
set lazyredraw          " redraw less often to fix choppy scrolling and stuff
" indents
set tabstop=4 softtabstop=4 expandtab shiftwidth=4 smarttab
set mouse=a             " make the mouse work like a mouse

" backup of files stuff
set backupdir=~/.tmp//,.
set directory=~/.tmp//,.

"}}}


" ============== FUNCTIONS =================== {{{

function! ToggleSpell()     "{{{
    if &spell
        echo "Spell check OFF"
        setlocal nospell
    else
        echo "Spell check ON"
        setlocal spell spelllang=en_gb
    endif
endfunction
"}}}

function! ToggleWrap()      "{{{
    if &wrap
        echo "Wrap OFF"
        setlocal nowrap
        silent! nunmap <buffer> <Up>
        silent! nunmap <buffer> <Down>
        silent! nunmap <buffer> <Home>
        silent! nunmap <buffer> <End>
        silent! iunmap <buffer> <Up>
        silent! iunmap <buffer> <Down>
        silent! iunmap <buffer> <Home>
        silent! iunmap <buffer> <End>
    else
        echo "Wrap ON"
        setlocal wrap linebreak nolist
        setlocal display+=lastline
        noremap  <buffer> <silent> <Up>   gk
        noremap  <buffer> <silent> <Down> gj
        noremap  <buffer> <silent> <Home> g<Home>
        noremap  <buffer> <silent> <End>  g<End>
        inoremap <buffer> <silent> <Up>   <C-o>gk
        inoremap <buffer> <silent> <Down> <C-o>gj
        inoremap <buffer> <silent> <Home> <C-o>g<Home>
        inoremap <buffer> <silent> <End>  <C-o>g<End>
    endif
endfunction
" }}}

function! TrimWhitespace()           "{{{
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
" }}}
" }}}


" ============== COLOR ======================= {{{
" colorscheme magic to make any theme transparent
function! AdaptColorscheme()
    highlight clear CursorLine
    " highlight Normal ctermbg=none
    " highlight LineNr ctermbg=none
    " highlight Folded ctermbg=none
    " highlight NonText ctermbg=none
    " highlight SpecialKey ctermbg=none
    " highlight VertSplit ctermbg=none
    " highlight SignColumn ctermbg=none
    highlight SpellBad cterm=underline,bold
    highlight SpellCap cterm=underline,bold
    highlight SpellRare cterm=underline,bold
    highlight SpellLocal cterm=underline,bold
    " highlight SpellBad ctermbg=red
    " highlight SpellCap ctermbg=blue
    " highlight SpellRare ctermbg=brown
    " highlight SpellLocal ctermbg=brown
endfunction
augroup color_adapt
    autocmd!
    autocmd ColorScheme * call AdaptColorscheme()
augroup END

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    " "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  " "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  " "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  " if (has("termguicolors"))
    " set termguicolors
  " endif
endif

colorscheme gruvbox
set background=dark
"}}}
