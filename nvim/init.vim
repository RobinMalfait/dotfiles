"==============================================================
" Vim Cofiguration
"==============================================================

call plug#begin('~/.config/nvim/plugged')
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-surround'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'vim-test/vim-test'
Plug 'benmills/vimux'
Plug 'vim-airline/vim-airline'
Plug 'arcticicestudio/nord-vim'
Plug 'machakann/vim-highlightedyank'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
call plug#end()

let mapleader = " "

syntax on
filetype plugin indent on

set autoindent
set clipboard=unnamed
set cmdheight=2
set expandtab
set hidden
set incsearch
set nobackup
set noerrorbells
set nohlsearch
set nomodeline
set noshowmode
set noswapfile
set nowrap
set nowritebackup
set number
set relativenumber
set shiftwidth=2
set shortmess+=c
set signcolumn=yes:2
set smartcase
set smartindent
set softtabstop=2
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
set tabstop=2
set termguicolors
set undodir=~/.config/nvim/undodir
set undofile
set updatetime=50

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" Neovim config
nnoremap <leader>rc :vsp ~/.config/nvim/init.vim<CR>
nnoremap <leader><CR> :source ~/.config/nvim/init.vim<CR>

" Remove arrow keys
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>

" Allow to use ; instead of : (No need for a shift!)
nnoremap ; :

" Unfuck my screen
nnoremap U :syntax sync fromstart<cr>:redraw!<cr>

" Delete in the void register and paste original value
vnoremap <leader>p "_dP

" Theming/Styling
colorscheme nord
let g:airline_powerline_fonts = 1

" Allow for transparent background
hi Normal ctermbg=NONE guibg=NONE 
hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE

" Mark files to use the zsh syntax
autocmd BufNewFile,BufRead .zalias   set syntax=zsh

" Project Navigation 
"==============================================================
let $FZF_DEFAULT_COMMAND='rg --files'
let $FZF_DEFAULT_OPTS='--reverse'
let g:fzf_layout = { 'window': {'width': 0.8, 'height': 0.8} }

" Switch between last 2 buffers
nnoremap <leader><leader> :b#<CR>

" Find in files
nnoremap <C-f> :Rg<CR>

" Find files
:map <C-p> :Files<CR>

" Treesitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  },
}
EOF

" Navigation
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" Resizing, use ctrl+hjkl to resize windows
nnoremap <C-h> :vertical resize -2<CR>
nnoremap <C-j> :resize -2<CR>
nnoremap <C-k> :resize +2<CR>
nnoremap <C-l> :vertical resize +2<CR>

" Visual move
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Yank highlighter
let g:highlightedyank_highlight_duration = 100

" Tab navigate completion
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Integrated terminal
nnoremap <leader>t :below new +term<CR> :resize 20<CR> i
tnoremap <ESC> <C-\><C-N>
tnoremap jk <C-\><C-N>

" Git
nmap <leader>g :Git<SPACE>
nmap <leader>gj :diffget //3<CR>
nmap <leader>gf :diffget //2<CR>
nmap <leader>gs :G<CR>

" Testing
let test#strategy = "neovim" " vimux
let g:test#javascript#runner = 'jest'
nmap <silent> tn :TestNearest<CR>
nmap <silent> tf :TestFile<CR>
nmap <silent> ts :TestSuite<CR>
nmap <silent> tl :TestLast<CR>
nmap <silent> tg :TestVisit<CR>

" Nerdcommenter
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1

" Use ctrl+\ to toggle comments
nmap <C-\> <Plug>NERDCommenterToggle
vmap <C-\> <Plug>NERDCommenterToggle<CR>gv

" Nerdtree
let g:NERDTreeShowHidden=1
let g:NERDTreeWinPos = "right"
nnoremap <leader>ne :NERDTreeToggle<CR>

" Prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" CoC 
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Applying codeAction to the selected region.
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>

