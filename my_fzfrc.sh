
# fd - cd to selected directory
fd() {
	local dir
	dir=$(find ${1:-.} -path '*/\.*' -prune \
		-o -type d -print 2> /dev/null | fzf +m) &&
		cd "$dir"
}

# fh - search in your command history and execute selected command
fh() {
	eval $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}

# fh - repeat history
fh() {
	print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}

# create sqllite database for chrome history
init_chrome_history_db() {
	#    ~/Library/Application Support/Google/Chrome on OS X and
	#    ~/.config/google-chrome/Default/databases on Linux
	cp -f ~/Library/Application\ Support/Google/Chrome/Default/History /tmp/h
	sqlite3 /tmp/h .tables
	sqlite3 /tmp/h '.schema urls'
	# test
	sqlite3 /tmp/h 'select title, url from urls order by last_visit_time desc'
}

# ch - browse chrome history
ch() {
	local cols sep
	cols=$(( COLUMNS / 3 ))
	sep='{::}'

	cp -f ~/Library/Application\ Support/Google/Chrome/Profile\ 1/History /tmp/h

	sqlite3 -separator $sep /tmp/h \
		"select substr(title, 1, $cols), url
	from urls order by last_visit_time desc" |
		awk -F $sep '{printf "%-'$cols's  \x1b[36m%s\x1b[m\n", $1, $2}' |
		fzf --ansi --multi | sed 's#.*\(https*://\)#\1#' | xargs open
}

# fkill - kill processes - list only the ones you can kill. Modified the earlier script.
fkill() {
	local pid
	if [ "$UID" != "0" ]; then
		pid=$(ps -f -u $UID | sed 1d | fzf -m | awk '{print $2}')
	else
		pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')
	fi

	if [ "x$pid" != "x" ]
	then
		echo $pid | xargs kill -${1:-9}
	fi
}

# autojump
j() {
	if [[ "$#" -ne 0 ]]; then
		cd $(autojump $@)
		return
	fi
	cd "$(autojump -s | sed '/_____/Q; s/^[0-9,.:]*\s*//' |  fzf --height 40% --reverse --inline-info)"
}


# fe [FUZZY PATTERN] - Open the selected file with the default editor
#   - Bypass fuzzy finder if there's only one match (--select-1)
#   - Exit if there's no match (--exit-0)
fe() {
	local files
	IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
	[[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}

# Modified version where you can press
#   - CTRL-O to open with `open` command,
#   - CTRL-E or Enter key to open with the $EDITOR
fo() {
	local out file key
	IFS=$'\n' out=($(fzf-tmux --query="$1" --exit-0 --expect=ctrl-o,ctrl-e))
	key=$(head -1 <<< "$out")
  file=$(head -2 <<< "$out" | tail -1)
	if [ -n "$file" ]; then
		[ "$key" = ctrl-o ] && open "$file" || ${EDITOR:-vim} "$file"
	fi
}
