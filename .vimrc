call plug#begin('~/.vim/plugged')

Plug 'preservim/NERDTree'

" Integrate fzf with Vim.
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'

" Show git file changes in the gutter.
Plug 'mhinz/vim-signify'

" A git wrapper.
Plug 'tpope/vim-fugitive'

Plug 'rakr/vim-one'
" Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }
" Plug 'iamcco/markdown-preview.vim'
" Plug 'skanehira/preview-markdown.vim'
" Dim paragraphs above and below the active paragraph.
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'junegunn/limelight.vim'
Plug 'stephpy/vim-yaml'
" Distraction free writing by removing UI elements and centering everything.
Plug 'junegunn/goyo.vim'

Plug 'stephpy/vim-yaml'
call plug#end()
" Turn on syntax highlighting.
syntax on

" Color scheme set to desert.
packadd! dracula
colorscheme dracula
"Shows the cursor at all time.
set ruler
" Show the line numbers
set number
" Show tab suggetions a menu
set wildmenu
" Show incomplete commands
set showcmd
" Z enter will show 5 lines above 
set scrolloff=5
" Highligh the matching string while searching
set incsearch
set ignorecase
set smartcase

" Backups your files like emacs.
set backup

" Makes sure we dont break into next line in the middle of a word.
set lbr

set ai
set si
" .............................................................................
" junegunn/fzf.vim
" .............................................................................

let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'

" Customize fzf colors to match your color scheme.
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-b': 'split',
  \ 'ctrl-v': 'vsplit',
  \ 'ctrl-y': {lines -> setreg('*', join(lines, "\n"))}}

" Launch fzf with CTRL+P.
nnoremap <silent> <C-p> :FZF -m<CR>

" Map a few common things to do with FZF.
nnoremap <silent> <Leader><Enter> :Buffers<CR>
nnoremap <silent> <Leader>l :Lines<CR>

" Allow passing optional flags into the Rg command.
"   Example: :Rg myterm -g '*.md'
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \ "rg --column --line-number --no-heading --color=always --smart-case " .
  \ <q-args>, 1, fzf#vim#with_preview(), <bang>0)

