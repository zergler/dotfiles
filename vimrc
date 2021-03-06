"-------------------------------------------------------------------------------
" File:		/etc/vimrc
" Authors:	Igor Janjic
" Description:	System configuration file for vim.	
" 		
" 		All system-wide defaults are set in $VIMRUNTIME/archlinux.vim
" 		(usually just /usr/share/vim/vimfiles/archlinux.vim) and sourced
" 		by the call to :runtime you can find below.  If you wish to
" 		change any of those settings, you should do it in this file
" 		(/etc/vimrc), since archlinux.vim will be overwritten everytime
" 		an upgrade of the vim packages is performed.  It is recommended
" 		to make changes after sourcing archlinux.vim since it alters the
" 		value of the 'compatible' option.
""------------------------------------------------------------------------------

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim

" If you prefer the old-style vim functionalty, add 'runtime! vimrc_example.vim'
" Or better yet, read /usr/share/vim/vim74/vimrc_example.vim or the vim manual
" and configure vim to your own liking!

"-------------------------------------------------------------------------------
" Vital options.
"
" These options and commands enable some very useful features in
" vim, that no user should have to live without.
"
" Set 'nocompatible' to ward off unexpected things that your distro might have
" made, as well as sanely reset options when re-sourcing .vimrc.
set nocompatible

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on

" Enable syntax highlighting.
syntax enable

" Enable a color column at column 80.
set colorcolumn=80

"-------------------------------------------------------------------------------
" Highly recommended options.
"
" Vim with default settings does not allow easy switching between multiple files
" in the same editor window. Users can use multiple split windows or multiple
" tab pages to edit multiple files, but it is still best to enable an option to
" allow easier switching between files. One such option is the 'hidden' option,
" which allows you to re-use the same window and switch from an unsaved buffer
" without saving it first. Also allows you to keep an undo history for multiple
" files when re-using the same window in this way. Note that using persistent
" undo also lets you undo in multiple files even in the same window, but is less
" efficient and is actually designed for keeping undo history after closing Vim
" entirely. Vim will complain if you try to quit without saving, and swap files
" will keep you safe if your computer crashes.
set hidden

" Note that not everyone likes working this way (with the hidden option).
" Alternatives include using tabs or split windows instead of re-using the same
" window as mentioned above, and/or either of the following options:
"set confirm
"set autowriteall
"
" Better command-line completion.
set wildmenu

" Show partial commands in the last line of the screen.
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below).
set hlsearch

" Modelines have historically been a source of security vulnerabilities. As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
set nomodeline

" Set 8 spaces to a tab.
setlocal tabstop=8
setlocal shiftwidth=8
setlocal softtabstop=8
setlocal textwidth=80
setlocal noexpandtab


" Set background to dark.
set background=dark

"-------------------------------------------------------------------------------
" Usability options.
"
" These are options that users frequently set in their
" .vimrc. Some of them change Vim's behaviour in ways which deviate from the
" true Vi way, but which are considered to add usability. Which, if any, of
" these options to use is very much a personal preference, but they are
" harmless.
"
" Use case insensitive search, except when using capital letters.
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action.
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window.
set ruler

" Always display the status line, even if only one window is displayed.
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong.
set visualbell

" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=

" Enable use of the mouse for all modes.
set mouse=a

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue."
set cmdheight=2

" Display line numbers on the left.
set number

" Quickly time out on keycodes, but never time out on mappings.
set notimeout ttimeout ttimeoutlen=200

"-------------------------------------------------------------------------------
" Indentation options.
"
" Indentation settings according to personal preference.
"
" Indentation settings for using 2 spaces instead of tabs. Do not change
" 'tabstop' from its default value of 8 with this setup.
"set shiftwidth=2
"set softtabstop=2
"set expandtab
"
" Indentation settings for using hard tabs for indent. Display tabs as two
" characters wide.
"set shiftwidth=2
"set tabstop=2
"
"-------------------------------------------------------------------------------
" Mappings.
"
" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default.
map Y y$

" Map <C-L> (redraw screen) to also turn off search highlighting until the next
" search.
nnoremap <C-L> :nohl<CR><C-L>

"-------------------------------------------------------------------------------
" Latex configuration.
"
" Live previewer.
let g:livepreview_previewer = 'evince' 

" Preview update time.
autocmd Filetype tex setl updatetime=1

" Win32 users will need to have 'shellslash' set so that latex can be called
" correctly.
set shellslash

" Grep will sometimes skip displaying the file name if you search in a singe
" file. This will confuse Latex-Suite. Set your grep program to always
" generate a file-name.
set grepprg=grep\ -nH\ $*

" Starting with Vim 7, the filetype of empty .tex files defaults to 'plaintex'
" instead of 'tex', which results in vim-latex not being loaded. The following
" changes the default filetype back to 'tex'.
let g:tex_flavor='latex'
