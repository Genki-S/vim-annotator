if !exists('g:loaded_annotator')
	runtime! plugin/annotator.vim
endif

let s:save_cpo = &cpo
set cpo&vim

scriptencoding utf-8

" Utility Functions
function! annotator#prepare()
	if !isdirectory(g:annotator#annotation#directory)
		call annotator#create_directory()
	endif
endfunction

function! annotator#create_directory()
	call mkdir(g:annotator#annotation#directory)
endfunction

function! annotator#contents_dir()
	return g:annotator#annotation#directory . '/' . substitute(expand('%:p'), '/', '%', 'g')
endfunction

function! annotator#contents_file()
	return escape(annotator#contents_dir() . '/' . line('.'), ' #%')
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: foldmethod=marker
