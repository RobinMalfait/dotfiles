"==============================================================
" Vim Configuration
"==============================================================

call plug#begin('~/.config/nvim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'antoinemadec/coc-fzf'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-surround'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'editorconfig/editorconfig-vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'nvim-treesitter/playground'
Plug 'vim-test/vim-test'
Plug 'benmills/vimux'
Plug 'arcticicestudio/nord-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sheerun/vim-polyglot'
Plug 'machakann/vim-highlightedyank'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'kana/vim-textobj-user'
Plug 'whatyouhide/vim-textobj-xmlattr'
Plug 'jbyuki/venn.nvim'
Plug 'github/copilot.vim'
Plug 'overcache/NeoSolarized'
Plug 'imsnif/kdl.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'eandrju/cellular-automaton.nvim'
Plug 'RyanMillerC/better-vim-tmux-resizer'
Plug 'folke/zen-mode.nvim'
Plug 'mbbill/undotree'
call plug#end()

let mapleader = " "

syntax on
filetype plugin indent on

set encoding=utf-8
set autoindent
set clipboard=unnamed
set shortmess=atc
set cmdheight=3
set expandtab
set hidden
set incsearch
set ignorecase
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
set signcolumn=yes:2
set smartcase
set smartindent
set softtabstop=2
set laststatus=0
set tabstop=2
set undodir=~/.config/nvim/undodir
set undofile
set updatetime=50
set noautochdir
set textwidth=100
set fo+=t

" let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" if exists('+termguicolors')
"   let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"   let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
"   set termguicolors
" endif

" Neovim config
nnoremap <leader>rc :vsp $MYVIMRC<CR>
nnoremap <leader><CR> :source $MYVIMRC<CR>

" Undotree
nnoremap <leader>u :UndotreeToggle<CR>

" Remove arrow keys
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>

" Allow to use ; instead of : (No need for a shift!)
nnoremap ; :

" Unfuck my screen
nnoremap U :syntax sync fromstart<cr>:redraw!<cr>:edit!<cr>

" Delete in the void register and paste original value
vnoremap <leader>p "_dP

" Delete in the void reigster
vnoremap <leader>d "_d

" Dynamic themeing
let color_path = expand('~/.config/nvim/colors/theme.vim')
if filereadable(color_path)
  execute 'source'.color_path
else
  " Default color scheme
  colorscheme Nord
endif

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_powerline_fonts = 1

let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#coc#show_coc_status = 1

" Allow for transparent background
hi Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE

" InlayHint styles
hi default CocInlayHint ctermfg=8 guifg=#4c566a guibg=NONE ctermbg=NONE

" Configure file types for certain files
autocmd BufNewFile,BufRead .zalias   set syntax=zsh
autocmd BufNewFile,BufRead *.njk     setfiletype html

" Project Navigation
let $FZF_DEFAULT_COMMAND='rg --files'
let $FZF_DEFAULT_OPTS='--reverse'
let g:fzf_layout = { 'window': {'width': 0.8, 'height': 0.8} }
" let g:fzf_action = {
"   \ 'ctrl-t': 'tab split',
"   \ 'ctrl-x': 'split',
"   \ 'ctrl-v': 'vsplit',
"   \ 'ctrl-q': 'fill_quickfix'}

" Switch between last 2 buffers
nnoremap <leader><leader> :b#<CR>

" When I want a fun break...
nnoremap <leader>fml :CellularAutomaton make_it_rain<CR>

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


" Zen Mode
" lua <<EOF
"   require("zen-mode").setup {
"     window = {
"       backdrop = 1, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
"       -- height and width can be:
"       -- * an absolute number of cells when > 1
"       -- * a percentage of the width / height of the editor when <= 1
"       -- * a function that returns the width or the height
"       width = 80, -- width of the Zen window
"       height = 1, -- height of the Zen window
"       -- by default, no options are changed for the Zen window
"       -- uncomment any of the options below, or add other vim.wo options you want to apply
"       options = {
"         signcolumn = "no", -- disable signcolumn
"         number = false, -- disable number column
"         relativenumber = false, -- disable relative numbers
"         cursorline = false, -- disable cursorline
"         cursorcolumn = false, -- disable cursor column
"         -- foldcolumn = "0", -- disable fold column
"         -- list = false, -- disable whitespace characters
"       },
"     },
"   }
" EOF

" Keeping it centered
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" Undo breakpoints
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

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

" Rust
" noremap <C-i><C-h> :CocCommand rust-analyzer.toggleInlayHints<CR>

" Tab navigate completion
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
" inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              " \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Integrated terminal
nnoremap <leader>t :below new +term<CR> :resize 20<CR> i
tnoremap <ESC> <C-\><C-N>
tnoremap jk <C-\><C-N>

" Git
nmap <leader>g :Git<SPACE>
" nmap <leader>gr :Gvdiffsplit!<CR>
" nmap <leader>gj :diffget //3<CR>
" nmap <leader>gf :diffget //2<CR>
" nmap <leader>gs :G<CR>

" Testing
let test#strategy = "vimux" " neovim
let g:test#javascript#runner = 'jest'
let g:test#echo_command = 0
nmap <silent> tn :TestNearest<CR>
nmap <silent> tf :TestFile<CR>
nmap <silent> ts :TestSuite<CR>
nmap <silent> tl :TestLast<CR>
nmap <silent> tg :TestVisit<CR>

" Markdown Preview
let g:mkdp_theme = 'light'
nmap <C-s> <Plug>MarkdownPreview

" Nerdcommenter
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDCustomDelimiters={
  \ 'typescriptreact': { 'left': '//', 'right': '', 'leftAlt': '{/*', 'rightAlt': '*/}' },
\}

" Use ctrl+\ to toggle comments
nmap <C-\> <Plug>NERDCommenterToggle
vmap <C-\> <Plug>NERDCommenterToggle<CR>gv

" Nerdtree
let g:NERDTreeShowHidden=1
let g:NERDTreeWinPos = "right"
nnoremap <leader>st :NERDTreeFind<CR>
nnoremap <leader>ne :NERDTreeToggle<CR>

" Prettier
command! -nargs=0 Prettier :!npx prettier --write %

" CoC FZF
let g:coc_fzf_preview = ''
let g:coc_fzf_opts = []

nnoremap <silent> <space>a       :<C-u>CocFzfList diagnostics<CR>
nnoremap <silent> <space>b       :<C-u>CocFzfList diagnostics --current-buf<CR>
nnoremap <silent> <space>c       :<C-u>CocFzfList commands<CR>
nnoremap <silent> <space>e       :<C-u>CocFzfList extensions<CR>
nnoremap <silent> <space>o       :<C-u>CocFzfList outline<CR>
nnoremap <silent> <space>s       :<C-u>CocFzfList symbols<CR>
nnoremap <silent> <space>p       :<C-u>CocFzfListResume<CR>

" CoC
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <silent><expr> <C-j>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<C-j>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <expr><C-k> coc#pum#visible() ? coc#pum#prev(1) : "\<C-k>"

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

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
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
nnoremap <silent> K :call ShowDocumentation()<CR>

" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   elseif (coc#rpc#ready())
"     call CocActionAsync('doHover')
"   else
"     execute '!' . &keywordprg . " " . expand('<cword>')
"   endif
" endfunction
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
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
" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline=""
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
