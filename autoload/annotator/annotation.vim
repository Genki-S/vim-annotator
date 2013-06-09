let s:save_cpo = &cpo
set cpo&vim

function! annotator#annotation#annotate()
	call annotator#prepare()
	if !isdirectory(s:annotation_contents_dir())
		call mkdir(s:annotation_contents_dir())
	endif
	execute 'split' s:annotation_contents_file()
	execute 'setfiletype' g:annotator#annotation#filetype
endfunction

function! s:annotation_contents_dir()
	return g:annotator#annotation#directory . '/' . substitute(expand('%:p'), '/', '%', 'g')
endfunction

function! s:annotation_contents_file()
	return escape(s:annotation_contents_dir() . '/' . line('.'), ' #%')
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
