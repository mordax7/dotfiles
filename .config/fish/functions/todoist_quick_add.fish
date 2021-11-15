function todoist_quick_add
  if [ $argv ]
    todoist quick '$argv'
  else
    echo 'Missing argument'
  end
end
