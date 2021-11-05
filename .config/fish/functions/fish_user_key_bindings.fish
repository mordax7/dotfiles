function fish_user_key_bindings
	# fzf
	fzf_key_bindings

    # todoist
    bind -M insert \ctt fzf_todoist_item
    bind -M insert \ctp fzf_todoist_project
    bind -M insert \ctl fzf_todoist_labels
    bind -M insert \ctc fzf_todoist_close
    bind -M insert \ctd fzf_todoist_delete
end
