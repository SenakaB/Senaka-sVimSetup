set tabline=%!SenakaTabLine()  " custom tab pages line
function SenakaTabLine()
	let s = ' ' " complete tabline goes here
	" loop through each tab page
	for t in range(tabpagenr('$'))
		" set highlight for tab number and &modified
		let s .= '%#TabLineSel#' . ' '
		" set the tab page number (for mouse clicks)
		let s .= '%' . (t + 1) . 'T'
		" set page number string
		let s .= t + 1 . ':'
		" get buffer names and statuses
		let n = ''  "temp string for buffer names while we loop and check buftype
		let m = 0  " &modified counter
		" loop through each buffer in a tab
		for b in tabpagebuflist(t + 1)
			" buffer types: quickfix gets a [Q], help gets [H]{base fname}
			" others get 1dir/2dir/3dir/fname shortened to 1/2/3/fname
			if getbufvar( b, "&buftype" ) == 'help'
				let n .= '[H]' " . fnamemodify( bufname(b), ':t:s/.txt$//' )
			elseif getbufvar( b, "&buftype" ) == 'quickfix'
				let n .= '[Q]'
			endif
			" check and ++ tab's &modified count
			if getbufvar( b, "&modified" )
				let m += 1
			endif
		endfor
		let bufnrlist = tabpagebuflist(t+1)
		let name = bufname(bufnrlist[tabpagewinnr(t+1) - 1])
		if name == ''
	        	" give a name to no-name documents
			if &buftype=='quickfix'
				let name = '[Quickfix List]'
			else
				let name = '[No Name]'
			endif
		else
			" get only the file name
			let name = fnamemodify(name,":t")
		endif
		let n .= name 
		" add modified label [n+] where n pages in tab are modified
		if m > 0
			let s .= '[' . m . '+]'
		endif
		" select the highlighting for the buffer names
		" my default highlighting only underlines the active tab buffer names.
		if t + 1 == tabpagenr()
			let s .= '%#TabLine#'
		else
			let s .= '%#TabLineSel#'
		endif
		" add buffer names
		let s .= n
		" switch to no underlining and add final space to buffer list
		let s .= '%#TabLineSel#' . ' '
		let s .= '%#TabLineFill#%T' . ' '
	endfor
	" after the last tab fill with TabLineFill and reset tab page nr
	let s .= '%#TabLineFill#%T'
	" right-align the label to close the current tab page
	if tabpagenr('$') > 1
		let s .= '%=%#TabLineFill#%999Xclose'
	endif
	return s
endfunction

