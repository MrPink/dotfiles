" --- GENERAL SETTINGS ---
set number              " Show line numbers (essential for finding errors)
set relativenumber      " Helps with jumping lines (e.g., 5j to move down 5 lines)
syntax on               " Enable syntax highlighting
set cursorline          " Highlights the current line
set showmatch           " Highlight matching brackets
set incsearch           " Search as you type
set hlsearch            " Highlight all search matches
set ignorecase          " Ignore case when searching...
set smartcase           " ...unless you use a capital letter

" --- THE YAML & K8S SPECIALS ---
filetype indent plugin on
set expandtab           " Use spaces instead of tabs (YAML requirement)
set shiftwidth=2        " 1 tab = 2 spaces
set softtabstop=2       " Number of spaces a tab counts for
set tabstop=2           " Actual tab width
set autoindent          " Copy indent from current line when starting a new one
set smartindent         " Be smart about indentation

" --- PERFORMANCE ---
set noswapfile          " Don't create those annoying .swp files
set undofile            " Maintain undo history between sessions
set undodir=~/.vim/undodir

" --- KEY MAPS FOR SPEED ---
" Clear search highlighting with <Esc>
nnoremap <esc> :noh<return><esc>

" Shortcut to toggle line wrapping (useful for long logs)
nmap <leader>w :set wrap!<CR>set ts=2 sw=2 et
set hlsearch
