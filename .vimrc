" vim:foldmethod=marker

" ============== PLUGINS ===================== {{{
set nocompatible              " be iMproved, required

" auto install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
    echo "installing vim-plug"
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'junegunn/vim-plug'

" Some autocompletion plugins
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'stamblerre/gocode', {'rtp': 'nvim/'}
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }

" Linting
if has('nvim')
    Plug 'w0rp/ale'
else
    Plug 'vim-syntastic/syntastic'
endif

" Niceness
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'

" Filetype specific
Plug 'lervag/vimtex'

" Themes
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

" enable ALE
"let g:ale_completion_enabled=1
let g:ale_lint_on_text_changed = "normal"

" enable DEOPLETE
let g:deoplete#enable_at_startup = 1

" python 3 interpreter
let g:deoplete#sources#jedi#python_path = "python3"

" ===================== END PLUGINS ==========================}}}

" command to edit this file
command! Erc tabnew ~/.vimrc
command! Src source ~/.vimrc

" ============== KEYBINDS ==================== {{{

" go from insert to visual mode with Ctrl-Space
inoremap <C-Space> <Esc>viw

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

" enable line wrapping and keybinds
noremap <silent> <Leader>w :call ToggleWrap()<CR>

" toggle nerdTree
nnoremap <leader>d :NERDTreeToggle<CR>

" AUTO COMPLETION {{{
" some YouCompleteMe keys setup
"let g:ycm_key_list_stop_completion = ['<C-y>', '<Enter>']
"let g:ycm_key_list_select_completion = ['<Down>', '<j>', '<TAB>']
"let g:ycm_key_list_previous_completion = ['<Up>', '<k>']

" completion popup remaps for tab, enter and esc
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"inoremap <expr> <Down> pumvisible() ? "\<C-n>" : "\<Down>"
"inoremap <expr> <Up> pumvisible() ? "\<C-p>" : "\<Up>"
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
"inoremap <expr> <Esc> pumvisible() ? "\<C-e>" : "\<Esc>"

" pair autocompletion
inoremap {<CR> {<CR>}<Esc>ko<TAB>
" inoremap () ()<left>
" inoremap [] []<left>
" inoremap "" ""<left>
" }}}

" SENSIBLE COPY AND PASTE {{{
noremap <C-c> y
noremap <C-v> p
noremap <C-x> d
" paste in insert mode
inoremap <C-v> <Esc>pa
" }}}

" TABS AND SPLITS {{{
"Map CTRL+T then: 
"       down = last tab       up   = first tab        left = previous tab
"       right= next tab       plus = new tab"
noremap <C-t><up> :tabr<cr>
noremap <C-t><down> :tabl<cr>
noremap <C-t><left> :tabp<cr>
noremap <C-t><right> :tabn<cr>
noremap <C-t>+ :tabnew<cr>

" Move to splits
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
" Maps to resize splits
noremap <C-M-h> <C-w>5<
noremap <C-M-l> <C-w>5>
noremap <C-M-k> <C-w>2+
noremap <C-M-j> <C-w>2-
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
if has("vms")
  set nobackup          " do not keep a backup file, use versions instead
else
  set backupdir-=.
  set backupdir^=./tmp,~/tmp,/tmp  " keep a backup file in ./tmp
endif

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
" }}}


" ============== COLOR ======================= {{{
" colorscheme magic to make any theme transparent
function! AdaptColorscheme()
    highlight clear CursorLine
    highlight Normal ctermbg=none
    highlight LineNr ctermbg=none
    highlight Folded ctermbg=none
    highlight NonText ctermbg=none
    highlight SpecialKey ctermbg=none
    highlight VertSplit ctermbg=none
    highlight SignColumn ctermbg=none
    highlight SpellBad cterm=underline ctermfg=red
    highlight SpellCap cterm=underline ctermfg=yellow
    highlight SpellRare cterm=underline ctermfg=green
    highlight SpellLocal cterm=underline ctermfg=green
endfunction
augroup color_adapt
    autocmd!
    autocmd ColorScheme * call AdaptColorscheme()
augroup END

colorscheme gruvbox
set background=dark
"}}}
