function todoist_quick_add
  read -P 'Name of the task: ' name
  if [ $name ]
    todoist-cli quick $name
    waybar-todoist refresh
  else
    echo '[ERROR] Task name cannot be empty'
  end
end
