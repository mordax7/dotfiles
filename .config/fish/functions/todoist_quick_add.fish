function todoist_quick_add
  read -P 'Name of the task: ' name
  if [ $name ]
    todoist quick $name
  else
    echo '[ERROR] Task name cannot be empty'
  end
end
