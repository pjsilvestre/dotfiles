"Plugins
call plug#begin('~/.data/plugged')
Plug 'bkad/CamelCaseMotion'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'wesQ3/vim-windowswap'
Plug 'ycm-core/YouCompleteMe'
call plug#end()

"General Settings
set nocp
syntax on
filetype plugin indent on
set autoindent
set incsearch
set list
set number relativenumber
set splitbelow
set termguicolors
set undodir=~/.local/share/nvim/undo
set undofile
set shiftwidth=2
set softtabstop=2
set tabstop=2

"Theming Settings
colorscheme gruvbox
set background=light
set colorcolumn=80,120
highlight ColorColumn ctermbg=lightyellow guibg=lightyellow

"Autocommand Settings
	"toggle between relative and normal numbering when switching focus
		augroup numbertoggle
			autocmd!
			autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
			autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
		augroup END

"Shortcuts
	"remove highlighting
		nnoremap <esc> :noh<return><esc>

"Leader Key Settings/Shortcuts
	"leader key
		let mapleader=" "
	"move up/down 1/2 screen
		nnoremap <leader>u <C-U>
		nnoremap <leader>d <C-d>
	"move to previous/next cursor position
		nnoremap <leader>o <C-O>
		nnoremap <leader>i <C-I>
	"move cursor to other window
		nnoremap <leader>h :wincmd h<CR>
		nnoremap <leader>j :wincmd j<CR>
		nnoremap <leader>k :wincmd k<CR>
		nnoremap <leader>l :wincmd l<CR>
	"move windows
		nnoremap <leader>H :wincmd H<CR>
		nnoremap <leader>J :wincmd J<CR>
		nnoremap <leader>K :wincmd K<CR>
		nnoremap <leader>L :wincmd L<CR>
	"split window horizontally/vertically
		nnoremap <leader>z :wincmd v<CR>
		nnoremap <leader>v :wincmd s<CR>
	"close/quit window
		nnoremap <leader>c :wincmd c<CR>
		nnoremap <leader>q :wincmd q<CR>

"Plugin Settings
	"CamelCaseMotion
		map <silent>w <Plug>CamelCaseMotion_w
		map <silent>b <Plug>CamelCaseMotion_b
		map <silent>e <Plug>CamelCaseMotion_e
		sunmap w
		sunmap b
		sunmap e
	"ctrl-p
		"set local working directory to current file unless its a subdirectory
		"of the cwd, the directory of the current file, or the nearest ancestor
		"of the file containing .git
			let g:ctrlpw_working_path_mode='acr'
		"ignore files in .gitignore
			let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
	"vim-airline
		let g:airline_powerline_fonts=1
		let g:airline_theme='gruvbox'
		let g:airline#extensions#tabline#enabled=1
	"YouCompleteMe
		map <leader>gd :YcmCompleter GetDoc<CR>
		map <leader>gt :YcmCompleter GoTo<CR>
		map <leader>gf :YcmCompleter FixIt<CR>
		map <leader>rr :YcmCompleter RefactorRename 
