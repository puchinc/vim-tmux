"Compile
function Compile()
	if expand('%:e') ==# "java"
		:!javac % && java %<
	elseif expand('%:e') ==# "c"
		:!gcc -g % -o %<.out && ./%<.out
	elseif expand('%:e') ==# "cpp"
		:!g++ -g % -o %<.out && ./%<.out
	elseif expand('%:e') ==# "py"
		:!python %
	elseif expand('%:e') ==# "sql"
		:!mysql TEST < %
	elseif expand('%:e') ==# "php"
		:!php %
	elseif expand('%:e') ==# "js"
		:!node %
	elseif expand('%:e') ==# "sh"
		:!bash %
	elseif expand('%:e') ==# "r" || expand('%:e') ==# "R"
		:!Rscript %
	elseif expand('%:e') ==# "tex"
		:!xelatex % && rm %<.out && rm %<.log && rm %<.aux && open %<.pdf
	endif
endfunction
