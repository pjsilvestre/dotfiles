"Plugins
call plug#begin('~/.data/plugged')
Plug 'bkad/CamelCaseMotion'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ctrlpvim/ctrlp.vim'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'wesQ3/vim-windowswap'
call plug#end()

"General Settings
set nocp
syntax on
filetype plugin indent on
set autoindent
set foldmethod=syntax
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
	"persist folds
		augroup persistfolds
			autocmd!
			autocmd BufWinLeave ?* mkview 1
			autocmd BufWinEnter ?* silent! loadview 1
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
	"coc.nvim
		"navigate to next error
			nmap <leader>e <Plug>(coc-diagnostic-next)
		"get code actions for current line
			nmap <leader>a <Plug>(coc-codeaction-line)
		"go-to's
			nmap <leader>gd <Plug>(coc-definition)
			nmap <leader>gi <Plug>(coc-implementation)
			nmap <leader>gr <Plug>(coc-references)
		"format buffer
			nmap <leader>f <Plug>(coc-format)

"Plugin Settings
	"CamelCaseMotion
		map <silent>w <Plug>CamelCaseMotion_w
		map <silent>b <Plug>CamelCaseMotion_b
		map <silent>e <Plug>CamelCaseMotion_e
		sunmap w
		sunmap b
		sunmap e
	"coc.nvim
		"more space for message display
			set cmdheight=2
		"don't pass messages to ins-completion-menu
			set shortmess+=c
		"always show signcolumn
			set signcolumn=yes
		"shorten update time
			set updatetime=300
		"trigger completion
			inoremap <silent><expr><TAB>
				\ pumvisible() ? "\<C-n>" :
				\ <SID>check_back_space() ? "\<TAB>" :
				\ coc#refresh()
			inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
			function! s:check_back_space() abort
				let col = col('.') - 1
				return !col || getline('.')[col - 1]  =~# '\s'
			endfunction
		"confirm completion
			if exists('*complete_info')
				inoremap <expr><CR> complete_info()["selected"]
				\ != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
			else
				inoremap <expr><CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
			endif
		"navigate errors
			nmap <silent>[e <Plug>(coc-diagnostic-prev)
			nmap <silent>]e <Plug>(coc-diagnostic-next)
	"ctrl-p
		"set local working directory to current file unless its a subdirectory
		"of the cwd, the directory of the current file, or the nearest ancestor
		"of the file containing .git
			let g:ctrlpw_working_path_mode='acr'
		"ignore files in .gitignore
			let g:ctrlp_user_command =
				\ ['.git', 'cd %s && git ls-files -co --exclude-standard']
	"vim-airline
		let g:airline_powerline_fonts=1
		let g:airline_theme='gruvbox'
		let g:airline#extensions#coc#enabled=1
		let g:airline#extensions#tabline#enabled=1
