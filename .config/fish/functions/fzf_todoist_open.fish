function fzf_todoist_open
  todoist list | fzf | cut -d ' ' -f 1 | tr '\n' ' ' | sed -e 's/[ \t]*$//' | read ret
  if [ $ret ]
    todoist show --browse $ret
    commandline -f repaint
  end
end
