" vim-test requires pynvim to be installed
" run pip3 install --user pynvim

" brew install the_silver_searcher

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" IDE Features
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'puremourning/vimspector'
Plug 'roxma/nvim-yarp' " dependency for vim-ultest
Plug 'roxma/vim-hug-neovim-rpc' " dependency for vim-ultest
Plug 'vim-test/vim-test' " dependency for vim-ultest
Plug 'rcarriga/vim-ultest'
Plug 'tpope/vim-dispatch'
Plug 'neomake/neomake'
Plug 'sansyrox/vim-python-virtualenv'
Plug 'lambdalisue/vim-pyenv'

" CTags
Plug 'ludovicchabant/vim-gutentags'
Plug 'preservim/tagbar'

" Theme
Plug 'NLKNguyen/papercolor-theme'
" Plug 'morhetz/gruvbox'
" Plug 'nightsense/seabird'

" Appearance
Plug 'ryanoasis/vim-devicons'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'psliwka/vim-smoothie'

" Syntax
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascriptreact'] }
Plug 'leafgarland/typescript-vim', { 'for': ['typescript', 'typescriptreact'] }
Plug 'peitalin/vim-jsx-typescript', { 'for': ['typescriptreact', 'typescript'] }
Plug 'maxmellon/vim-jsx-pretty', { 'for': ['javascriptreact', 'javascript'] }
Plug 'jpalardy/vim-slime', { 'for': 'python' }
Plug 'hanschen/vim-ipython-cell', { 'for': 'python' }
Plug 'hashivim/vim-terraform'
Plug 'tpope/vim-jdaddy' "JSON helpers

" Search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'

" Project Management
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'airblade/vim-gitgutter'     " Show git diff of lines edited
Plug 'stsewd/fzf-checkout.vim'
" Plug 'tpope/vim-rhubarb' " TODO configure

" Navigation
Plug 'preservim/nerdtree'
" Plug 'tyok/nerdtree-ack'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'easymotion/vim-easymotion'
Plug 'rhysd/accelerated-jk'
Plug 'schickling/vim-bufonly' "close all but targeted buffer
"Plug 'wellle/targets.vim' "lets learn default movements better first
"Plug 'christoomey/vim-tmux-navigator' "edited out due to issues with tmux 3.256

" Editing
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-commentary'
Plug 'ahw/vim-pbcopy' "copy to os clipboard with cy in visual mode
Plug 'Valloric/MatchTagAlways'
Plug 'matze/vim-move'
Plug 'mbbill/undotree'
Plug 'mg979/vim-visual-multi'
Plug 'tpope/vim-speeddating' "increment dates and times with ctrl-a and ctrl-x
" Plug 'coderifous/textobj-word-column.vim'
" Plug 'junegunn/vim-easy-align'

" Plug 'tpope/vim-sensible'
" Plug 'vimwiki/vimwiki'
" Plug 'honza/vim-snippets'
" Plug 'caksoylar/vim-mysticaltutor'
" Plug 'vim-scripts/ZoomWin'
" Plug 'terryma/vim-expand-region'

"dependencies
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'

" Initialize plugin system
call plug#end()

" let g:python3_host_prog = "/usr/local/bin/python3"

nnoremap <SPACE> <Nop>
let mapleader=" "

set nocompatible
filetype indent on
filetype plugin on
filetype plugin indent on

"terminal colors
set t_Co=256
set termguicolors

" Set colorscheme
" papercolor
set background=dark
colorscheme PaperColor
let g:airline_theme='papercolor'

" gruvbox
" colorscheme gruvbox
" let g:gruvbox_contrast_dark = 'hard'

" set vertical split char
" set fillchars+=vert:▏

syntax on "previously was enabled
set syn=auto

set wildmenu
set ttyfast
set lazyredraw
set updatetime=300

" Enable Mouse mode in all modes
set mouse=a

" paste mode (disabled due to debug conflict)
" nnoremap <F5> :set invpaste paste?<CR>
" set pastetoggle=<F5>
" set showmode

" Cursor Shape
let &t_SI = "\e[5 q"
let &t_EI = "\e[2 q"

" Set Line Numbers
set number
set numberwidth=4
set ruler

" Indentation
set autoindent
set cindent
set smartindent
" if indentation issue arise check below first
set preserveindent
set copyindent

" No Swap Files
set noswapfile

" Folding
" Enable folding
set foldmethod=syntax
set foldlevel=99

" Tab Options
set shiftwidth=4
set tabstop=4
set softtabstop=4 " Number of spaces a tab counts when editing
set expandtab

"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>

" Enable folding with the z key
nmap z za

" Source Vim configuration file and install plugins
nnoremap <silent><leader>1 :source ~/.vimrc \| :PlugInstall<CR>

" Delete empty space from the end of lines on every save
autocmd BufWritePre * :%s/\s\+$//e

set ignorecase " Ignore case when searching
set smartcase  " When searching try to be smart about cases
set nohlsearch " Don't highlight search term
set incsearch  " Jumping search

" Allow copy and paste from system clipboard
set clipboard=unnamed

" Spellcheck for markdown
au BufRead,BufNewFile *.md setlocal spell

" Delete characters outside of insert area
set backspace=indent,eol,start

"language features
hi def link jsObjectKey Label

"folding
augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END
set foldmethod=syntax
set foldcolumn=1
let javaScript_fold=1
set foldlevelstart=99

set display+=lastline

" No bells on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

set history=1000

"refresh buffer on external file write
set autoread
au CursorHold,CursorHoldI * checktime

"highlight found words when searching
set hlsearch

"incremental search
set incsearch

"show matching parenthesis
set showmatch

"relative line numbers
" set relativenumber

"highlight current line:
set cursorline

"set hidden characters
set list listchars=tab:>\ ,trail:-,eol:$
set list!

"add a colored column at 90 so our files don't get too wide
set colorcolumn=120

"disable lazy redraw
"set nolazyredraw

" Buffer Controls
"
" open a new empty buffer
" This replaces :tabnew
"nmap <Leader>T :enew<cr>
nmap <Leader>t :enew<CR>

" Move to the next buffer
nmap <Leader>l :bnext<CR>
nmap <Leader>] :bnext<CR>
nmap ˙ :bnext<CR>
inoremap ˙ :bnext<CR>
vnoremap ˙ :bnext<CR>

" Move to the previous buffer
nmap <Leader>h :bprevious<CR>
nmap <Leader>[ :bprevious<CR>
nmap ¬ :bprevious<CR>
inoremap ¬ :bprevious<CR>
vnoremap ¬ :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <Leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <Leader>bl :ls<CR>

" TSX Styles
" set filetypes as typescriptreact
autocmd BufNewFile,BufRead *.tsx set filetype=typescriptreact
autocmd BufRead,BufNewFile *.ts set filetype=typescript

" JSX Styles
autocmd BufNewFile,BufRead *.jsx set filetype=javascriptreact
autocmd BufRead,BufNewFile *.js set filetype=javascript

" dark red
hi tsxTagName guifg=#E06C75
hi tsxComponentName guifg=#E06C75
hi tsxCloseComponentName guifg=#E06C75

" orange
hi tsxCloseString guifg=#F99575
hi tsxCloseTag guifg=#F99575
hi tsxCloseTagName guifg=#F99575
hi tsxAttributeBraces guifg=#F99575
hi tsxEqual guifg=#F99575

" yellow
hi tsxAttrib guifg=#F8BD7F cterm=italic

" light-grey
hi tsxTypeBraces guifg=#999999

" dark-grey
hi tsxTypes guifg=#666666

" other highlighting for react
hi ReactState guifg=#C176A7
hi ReactProps guifg=#D19A66
hi ApolloGraphQL guifg=#CB886B
hi Events ctermfg=204 guifg=#56B6C2
hi ReduxKeywords ctermfg=204 guifg=#C678DD
hi ReduxHooksKeywords ctermfg=204 guifg=#C176A7
hi WebBrowser ctermfg=204 guifg=#56B6C2
hi ReactLifeCycleMethods ctermfg=204 guifg=#D19A66
"---end TSX styles----"

"Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" NERDtree settings
nnoremap <leader>n :NERDTreeFocus<CR>
"nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Disable jump to sibling bindings to allow better tmux integration
let g:NERDTreeMapJumpPrevSibling=""
let g:NERDTreeMapJumpNextSibling=""

" show hidden files automatically
let NERDTreeShowHidden=1

" Dont allow nerdtree to swap buffers
autocmd BufEnter * if bufname('#') =~# "^NERD_tree_" | b# | endif

" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>

"accelerated jk
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)

" Use recommended Coc.nvim settings
" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8
set termencoding=utf-8

" Give more space for displaying messages.
set cmdheight=2

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

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

" TODO remap due to conflict with tmux
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

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

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

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

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
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" CoC extensions
let g:coc_global_extensions = ['coc-diagnostic', 'coc-tsserver', 'coc-json', 'coc-pyright']

" Add CoC Prettier if prettier is installed
if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

" Add CoC ESLint if ESLint is installed
if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

" ENABLE TO HOVER ON WAIT
" function! ShowDocIfNoDiagnostic(timer_id)
"   if (coc#float#has_float() == 0 && CocHasProvider('hover') == 1)
"     silent call CocActionAsync('doHover')
"   endif
" endfunction

" function! s:show_hover_doc()
"   call timer_start(500, 'ShowDocIfNoDiagnostic')
" endfunction

" autocmd CursorHoldI * :call <SID>show_hover_doc()
" autocmd CursorHold * :call <SID>show_hover_doc()

" this would use a global prettier install
" autocmd FileType typescript setlocal formatprg=prettier\ --parser\ typescript

"Vim-move
" Visual Mode alt+j moves selected block down
vmap ∆ <Plug>MoveBlockDown
" vmap <D-j> <Plug>MoveBlockDown

" Visual Mode alt+k moves selected block up
vmap ˚ <Plug>MoveBlockUp
" vmap <D-k> <Plug>MoveBlockUp

" alt+j Move current line down
nmap ∆ <plug>MoveLineDown
" nmap <D-j> <plug>MoveLineDown

" alt+k Move current line up
nmap ˚ <Plug>MoveLineUp
" nmap <D-k> <Plug>MoveLineUp

"run command on line and paste output in buffer
nnoremap <leader>rl :r!<C-r><C-l><CR>

" vim-projectionist go to test
nnoremap <leader>af :A<CR>

" git fugitive stuff
nmap <leader>gb :G blame<CR>
nmap <leader>gs :G<CR>
nmap <leader>gd :Gvdiff<CR>
" nmap <leader>gd :G difftool<CR>
nmap <leader>gm :G mergetool<CR>
nmap <leader>gl :G log<CR>
" nmap <leader>gc :G commit<CR> Just use gs and cc to commit
nmap <leader>gp :G push<CR>
nmap <leader>gw :G write!<CR>
nnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>

" fzf checkout binds
nnoremap <leader>gc :GBranches<CR>
nnoremap <leader>gt :GTags<CR>

" Fix some weird error with Fugitive
let g:fugitive_pty = 0

"show hidden characters toggle
nmap <leader>l :set list! <CR>

" Powerline Font for MacVim
" set guifont=Menlo\ For\ Powerline

" Buffer Switching
"
" open a new empty buffer
" This replaces :tabnew
"nmap <Leader>T :enew<cr>
nmap <Leader>t :enew<CR>

" Move to the next buffer
nmap <Leader>l :bnext<CR>
nmap <Leader>] :bnext<CR>
nmap ˙ :bnext<CR>
inoremap ˙ :bnext<CR>
vnoremap ˙ :bnext<CR>

" Move to the previous buffer
nmap <Leader>h :bprevious<CR>
nmap <Leader>[ :bprevious<CR>
nmap ¬ :bprevious<CR>
inoremap ¬ :bprevious<CR>
vnoremap ¬ :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <Leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <Leader>bl :ls<CR>

" nmap <leader>d :bnext<CR>:bdelete #<CR>

" Easier movement between split windows CTRL + {h, j, k, l}
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" zoom windows
nmap <leader>zw :ZoomWin

" Vim JSX
let g:jsx_ext_required = 0

" Vimspector settings
" mnemonic 'di' = 'debug inspect' (pick your own, if you prefer!)

nmap <leader>dx :VimspectorReset<CR>
" for normal mode - the word under the cursor
nmap <Leader>di <Plug>VimspectorBalloonEval
" for visual mode, the visually selected text
xmap <Leader>di <Plug>VimspectorBalloonEval

nmap <LocalLeader><F11> <Plug>VimspectorUpFrame
nmap <LocalLeader><F12> <Plug>VimspectorDownFrame

let g:vimspector_enable_mappings = 'HUMAN'

"vim-test
let test#typescript#runner = 'jest'
let test#typescript#jest#executable = "yarn test"
let test#javascript#runner = 'jest'
let test#javascript#jest#executable = "yarn test"
" use the jest-vim-reporter to shorten the jest testoutput
" let g:test#javascript#jest#options = ''
" let g:test#typescript#jest#options = '--reporters jest-vim-reporter'
" let g:test#javascript#jest#options = '--reporters jest-vim-reporter'
" let test#strategy = "neovim"
" use neomake for async running of tests
" let test#strategy = "neomake"
" do not open the test run results, can be changed to show them
" let g:neomake_open_list = 0

" setlocal errorformat=%f:%l:%c:\ %m

function! JestStrategy(cmd)
    let testName = matchlist(a:cmd, '\v -t ''(.*)''')[1]
    call vimspector#LaunchWithSettings( #{ configuration: 'jest', TestName: testName } )
endfunction

let g:test#custom_strategies = { 'jest': function('JestStrategy')}

" nnoremap <leader>tm :exec RunTestVerbose()<CR>

" function! RunTestVerbose()
"   let g:test#javascript#jest#options = ''
"   :TestNearest -strategy=dispatch
"   let g:test#javascript#jest#options = '--reporters jest-vim-reporter'
" endfunction

" nmap <silent> <leader>tn :TestNearest<CR>
" nmap <silent> <leader>tf :TestFile<CR>
" nmap <silent> <leader>ts :TestSuite<CR>
" nmap <silent> <leader>tl :TestLast<CR>
" nmap <silent> <leader>tv :TestVisit<CR>
nmap <silent> <leader>td :TestNearest -strategy=jest<CR>

" Ultest binds, see :help ultest-commands
nmap <silent> <leader>tn :UltestNearest<CR>
nmap <silent> <leader>tf :Ultest<CR>
nmap <silent> <leader>ts :UltestStop<CR>
nmap <silent> <leader>to :UltestOutput<CR>

nmap ]t <Plug>(ultest-next-fail)
nmap [t <Plug>(ultest-prev-fail)

let g:indent_guides_enable_on_vim_startup = 1

"match tag always
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
    \ 'javascript.jsx' : 1,
    \ 'javascript' : 1,
    \}

"closetag
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js,*.jsx'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml,js,jsx'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx,js'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'

" Toggle Tag Bar
nmap <leader>tb :TagbarToggle<CR>

" vim-gutentag
let g:gutentags_add_default_project_roots = 0
let g:gutentags_project_root = ['package.json', '.git']
let g:gutentags_cache_dir = expand('~/.cache/vim/ctags/')
let g:gutentags_generate_on_new = 1
let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_write = 1
let g:gutentags_generate_on_empty_buffer = 0
let g:gutentags_modules = ['ctags']
let g:gutentags_ctags_exclude = [
      \ '*.git', '*.svg', '*.hg',
      \ '*/tests/*',
      \ 'build',
      \ 'dist',
      \ '*sites/*/files/*',
      \ 'bin',
      \ 'node_modules',
      \ 'bower_components',
      \ 'cache',
      \ 'compiled',
      \ 'docs',
      \ 'example',
      \ 'bundle',
      \ 'vendor',
      \ '*.md',
      \ '*-lock.json',
      \ '*.lock',
      \ '*bundle*.js',
      \ '*build*.js',
      \ '.*rc*',
      \ '*.json',
      \ '*.min.*',
      \ '*.map',
      \ '*.bak',
      \ '*.zip',
      \ '*.pyc',
      \ '*.class',
      \ '*.sln',
      \ '*.Master',
      \ '*.csproj',
      \ '*.tmp',
      \ '*.csproj.user',
      \ '*.cache',
      \ '*.pdb',
      \ 'tags*',
      \ 'cscope.*',
      \ '*.css',
      \ '*.less',
      \ '*.scss',
      \ '*.exe', '*.dll',
      \ '*.mp3', '*.ogg', '*.flac',
      \ '*.swp', '*.swo',
      \ '*.bmp', '*.gif', '*.ico', '*.jpg', '*.png',
      \ '*.rar', '*.zip', '*.tar', '*.tar.gz', '*.tar.xz', '*.tar.bz2',
      \ '*.pdf', '*.doc', '*.docx', '*.ppt', '*.pptx',
      \ ]

"------------------------------------------------------------------------------
" slime configuration
"------------------------------------------------------------------------------
" always use tmux
let g:slime_target = 'tmux'

" fix paste issues in ipython
let g:slime_python_ipython = 1

" always send text to the top-right pane in the current tmux tab without asking
let g:slime_default_config = {
            \ 'socket_name': get(split($TMUX, ','), 0),
            \ 'target_pane': '{top-right}' }
let g:slime_dont_ask_default = 1

"------------------------------------------------------------------------------
" ipython-cell configuration
"------------------------------------------------------------------------------
" Keyboard mappings. <Leader> is \ (backslash) by default

" map <Leader>s to start IPython
nnoremap <Leader>s :SlimeSend1 ipython --matplotlib<CR>

" map <Leader>r to run script
nnoremap <Leader>r :IPythonCellRun<CR>

" map <Leader>R to run script and time the execution
nnoremap <Leader>R :IPythonCellRunTime<CR>

" map <Leader>c to execute the current cell
nnoremap <Leader>c :IPythonCellExecuteCell<CR>

" map <Leader>C to execute the current cell and jump to the next cell
nnoremap <Leader>C :IPythonCellExecuteCellJump<CR>

" map <Leader>l to clear IPython screen
nnoremap <Leader>l :IPythonCellClear<CR>

" map <Leader>x to close all Matplotlib figure windows
nnoremap <Leader>x :IPythonCellClose<CR>

" map [c and ]c to jump to the previous and next cell header
" nnoremap [c :IPythonCellPrevCell<CR>
" nnoremap ]c :IPythonCellNextCell<CR>

" map <Leader>h to send the current line or current selection to IPython
nmap <Leader>h <Plug>SlimeLineSend
xmap <Leader>h <Plug>SlimeRegionSend

" map <Leader>p to run the previous command
nnoremap <Leader>p :IPythonCellPrevCommand<CR>

" map <Leader>Q to restart ipython
nnoremap <Leader>Q :IPythonCellRestart<CR>

" map <Leader>d to start debug mode
nnoremap <Leader>d :SlimeSend1 %debug<CR>

" map <Leader>q to exit debug mode or IPython
nnoremap <Leader>q :SlimeSend1 exit<CR>

" TODO remap to something that doesn't conflict with debug commands
" map <F9> and <F10> to insert a cell header tag above/below and enter insert mode
" nmap <F9> :IPythonCellInsertAbove<CR>a
" nmap <F10> :IPythonCellInsertBelow<CR>a

" also make <F9> and <F10> work in insert mode
" imap <F9> <C-o>:IPythonCellInsertAbove<CR>
" imap <F10> <C-o>:IPythonCellInsertBelow<CR>


" fzf
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

let g:fzf_layout = { 'window' : { 'width' : 0.8, 'height' : 0.8  } }
let $FZF_DEFAULT_OPTS = '--reverse'

" fzf checkout
nnoremap <leader>gc: GCheckout<CR>
" Press alt-enter to track a remote branch locally (origin/foo becomes foo)
" Press ctrl-b to create a branch or tag with the current query as name
" Press ctrl-d to delete a branch or tag
" Press ctrl-e to merge a branch
" Press ctrl-r to rebase a branch

" use ag
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" fzf ag
nnoremap <leader>ag :Ag<CR>

" TMUX integration
if exists('$TMUX')
  function! TmuxOrSplitSwitch(wincmd, tmuxdir)
    let previous_winnr = winnr()
    silent! execute "wincmd " . a:wincmd
    if previous_winnr == winnr()
      call system("tmux select-pane -" . a:tmuxdir)
      redraw!
    endif
  endfunction

  let previous_title = substitute(system("tmux display-message -p '#{pane_title}'"), '\n', '', '')
  let &t_ti = "\<Esc>]2;vim\<Esc>\\" . &t_ti
  let &t_te = "\<Esc>]2;". previous_title . "\<Esc>\\" . &t_te

  nnoremap <silent> <C-h> :call TmuxOrSplitSwitch('h', 'L')<cr>
  nnoremap <silent> <C-j> :call TmuxOrSplitSwitch('j', 'D')<cr>
  nnoremap <silent> <C-k> :call TmuxOrSplitSwitch('k', 'U')<cr>
  nnoremap <silent> <C-l> :call TmuxOrSplitSwitch('l', 'R')<cr>
else
  map <C-h> <C-w>h
  map <C-j> <C-w>j
  map <C-k> <C-w>k
  map <C-l> <C-w>l
endif
