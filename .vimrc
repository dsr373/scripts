set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-syntastic/syntastic'
" Plugin 'flazz/vim-colorschemes'
Plugin 'morhetz/gruvbox'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" command to edit this file
command Erc e ~/.vimrc
command Src source ~/.vimrc
" spell checking
nnoremap <F6> :call ToggleSpell()<CR>
function ToggleSpell()
    if &spell
        echo "Spell check OFF"
        setlocal nospell
    else
        echo "Spell check ON"
        setlocal spell spelllang=en_gb
    endif
endfunction

" when searching, remap \r to go to found, replace and insert mode
nnoremap <leader>r cgn
nnoremap <leader>s :w<CR>

" some YouCompleteMe keys setup
let g:ycm_key_list_stop_completion = ['<C-y>', '<Enter>']
let g:ycm_key_list_select_completion = ['<Down>', '<TAB>']
let g:ycm_key_list_previous_completion = ['<Up>']

" Funky clipboard business to set default copy to system clipboard (register
" +), as opposed to vim internal register "
set clipboard=unnamedplus
set encoding=utf-8

"Map CTRL+T then: 
"       down = last tab       up   = first tab        left = previous tab
"       right= next tab       plus = new tab"
noremap <C-t><up> :tabr<cr>
noremap <C-t><down> :tabl<cr>
noremap <C-t><left> :tabp<cr>
noremap <C-t><right> :tabn<cr>
noremap <C-t>+ :tabnew<cr>

" Maps to resize splits
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
" Move to splits
noremap <C-w>, <C-w>5<
noremap <C-w>. <C-w>5>
noremap <C-w>] <C-w>2+
noremap <C-w>[ <C-w>2-
"Make new splits open below or to the right instead of left and above
set splitbelow
set splitright

" backup of files stuff
if has("vms")
  set nobackup          " do not keep a backup file, use versions instead
else
  set backupdir-=.
  set backupdir^=./tmp,~/tmp,/tmp  " keep a backup file in ./tmp
endif

" magic for setting and unsetting wrap with \w
noremap <silent> <Leader>w :call ToggleWrap()<CR>
function ToggleWrap()
  if &wrap
    echo "Wrap OFF"
    setlocal nowrap
    set virtualedit=all
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
    set virtualedit=
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
set nowrap nolinebreak  " make the magic function above do what it's supposed to when initialized

" Searching
set incsearch           " do incremental searching
set hlsearch            " highlight search results
set ignorecase smartcase " what to do with case-sensitivity when searching

" some visual stuff
set number              " show line numbers
set ww+=<,>,[,],h,l	    " wrap cursor movement through line numbers and everything
set ruler               " show the cursor position all the time
set showcmd             " display incomplete commands
set cursorline          " highlight current line
" indents
set tabstop=4 softtabstop=4 expandtab shiftwidth=4 smarttab
set mouse=a             " make the mouse work like a mouse

" toggle relative numbers
nnoremap <leader>n :set relativenumber!<CR>

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
autocmd ColorScheme * call AdaptColorscheme()

colorscheme gruvbox
set background=dark

