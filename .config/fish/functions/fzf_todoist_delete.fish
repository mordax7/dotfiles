function fzf_todoist_delete
  todoist-cli list | fzf | cut -d ' ' -f 1 | tr '\n' ' ' | sed -e 's/[ \t]*$//' | read ret
  if [ $ret ]
    todoist-cli delete $ret
    commandline -f repaint
  end
end
