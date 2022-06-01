set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set guicursor=
set nu
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set ignorecase
set smartcase

set scrolloff=8
set termguicolors

" Give mor space for displaying messages
set cmdheight=2

set updatetime=50

set clipboard=unnamedplus " yank from vim to Ubuntu clipboard
set autoread "Reload files changed outside vim

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set linebreak    "Wrap lines at convenient points

" fold text
set foldenable          " enable folding
set foldmethod=indent
set foldlevelstart=10   " opens most folds by default
set foldnestmax=10      " 10 nested folds maximum
" space opens/closes folds
noremap <S-space> za


call plug#begin('~/.vim/plugged')

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'OmniSharp/omnisharp-vim'
Plug 'dense-analysis/ale'

Plug 'autozimu/LanguageClient-neovim', {
      \ 'branch': 'next',
      \ 'do': 'bash install.sh',
      \ }

" (Optional) Multi-entry selection UI.
Plug 'junegunn/fzf'

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

Plug 'gruvbox-community/gruvbox'
Plug 'tpope/vim-endwise'
Plug 'mbbill/undotree'

" Git
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'

Plug 'vimwiki/vimwiki'

Plug 'vim-test/vim-test'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

"C++ compliler
Plug 'cdelledonne/vim-cmake'
if has('nvim')
  Plug 'antoinemadec/FixCursorHold.nvim'
endif

Plug 'ThePrimeagen/harpoon'

Plug 'tpope/vim-obsession' "Save vim sessions, for tmux to pick up where you left off

call plug#end()


" Vim Wiki settings
let g:vimwiki_list = [{'path': '~/vimwiki/',
      \ 'syntax': 'markdown', 'ext': '.md'}]
" Setup gruvbox
colorscheme gruvbox
highlight Normal guibg=none

" Remap
let mapleader=" "
" Netrw - file tree
let g:netrw_browse_split = 4
let g:netrw_banner = 0
let g:netrw_preview = 1
let g:netrw_liststyle = 3
let g:netrw_altv = 1

" Quality of life remaps
" Behave vim
nnoremap Y y$
" Keeping it center
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ'z
" Unde breakpoints
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap { {<c-g>u
inoremap [ [<c-g>u
" Jumplist mutations
nnoremap <expr> k (v:count > 5 ? "m'" . v:count: "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count: "") . 'j'
" Moving text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <C-j> <esc>:m .+1<CR>==
inoremap <C-k> <esc>:m .-2<CR>==
nnoremap <leader>k :m .-2<CR>==
nnoremap <leader>j :m .+1<CR>==


" Configure fzf
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'
nnoremap <leader>gc :GBranches<CR>

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

nnoremap <Leader>= :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <Leader>rp :resize 100<CR>

nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :Sex!<CR>

" Terminal Remap
tnoremap <Esc> <C-\><C-n>

" vim-test
nmap <silent> <leader>tn :w<CR>:TestNearest<CR>
nmap <silent> <leader>tf :w<CR>:TestFile<CR>
nmap <silent> <leader>ts :w<CR>:TestSuite<CR>
nmap <silent> <leader>tsf :w<CR>:TestSuite --fail-fast<CR>
nmap <silent> <leader>tl :w<CR>:TestLast<CR>
nmap <silent> <leader>tv :w<CR>:TestVisit<CR>
if has('nvim')
  let test#strategy = "neovim"
  let test#neovim#term_position = "belowright vertical"
else
  let test#strategy = "vimterminal"
endif
let test#ruby#runner = 'rspec'

" Telescope
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>
nnoremap <leader>bf <cmd>lua require('telescope.builtin').buffers()<cr>

" Window pane resizing
nnoremap <silent> <Leader>[ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>] :exe "resize " . (winheight(0) * 2/3)<CR>
"
" Telescope lua functions
lua << EOF
require('telescope').setup {
  }
require('telescope').load_extension('fzf')
EOF


" vim-fugitive maping
nmap <leader>gs :G<CR>
nmap <leader>gj :diffget //3<CR>
nmap <leader>gd :diffget //2<CR>

nmap <leader>gt :G stash<CR>
nmap <leader>gt1 :G stash apply 1<CR>
nmap <leader>gt2 :G stash apply 2<CR>
nmap <leader>gt3 :G stash apply 3<CR>
nmap <leader>gt4 :G stash apply 4<CR>
nmap <leader>gt5 :G stash apply 5<CR>

"C++ compiler
let g:cmake_link_compile_commands = 1

nmap <leader>cg :CMakeGenerate<CR>
nmap <leader>cb :CMakeBuild<CR>

"Collapse text
set foldmethod=indent
set foldlevelstart=10   " opens most folds by default
set foldnestmax=10      " 10 nested folds maximum
" end opens/closes folds
noremap <end> za

" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
    \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio']
    \ }

let g:ale_linters = {
\ 'cs': ['OmniSharp']
\}

nmap <silent>K <Plug>(lcn-hover)
nmap <silent> gd <Plug>(lcn-definition)
nmap <silent> gc <Plug>(lcn-references)

autocmd FileType cs nmap <silent> <buffer> gd <Plug>(omnisharp_go_to_definition)

" Harpoon maps
nnoremap <leader>a :lua require("harpoon.mark").add_file()<CR>
nnoremap <C-e> :lua require("harpoon.ui").toggle_quick_menu()<CR>

nnoremap <leader>1 :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <leader>2 :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <leader>3 :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <leader>4 :lua require("harpoon.ui").nav_file(4)<CR>
nnoremap <leader>5 :lua require("harpoon.ui").nav_file(5)<CR>
nnoremap <leader>6 :lua require("harpoon.ui").nav_file(6)<CR>
nnoremap <leader>7 :lua require("harpoon.ui").nav_file(7)<CR>
nnoremap <leader>8 :lua require("harpoon.ui").nav_file(8)<CR>
nnoremap <leader>9 :lua require("harpoon.ui").nav_file(9)<CR>
