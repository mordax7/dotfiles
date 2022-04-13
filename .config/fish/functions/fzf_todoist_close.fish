function fzf_todoist_close
  todoist-cli list | fzf -q (LC_TIME=en_US.utf8 date '+%y/%m/%d(%a)') | cut -d ' ' -f 1 | tr '\n' ' ' | sed -e 's/[ \t]*$//' | read ret
  if [ $ret ]
    todoist-cli close $ret
    commandline -f repaint
  end
end
