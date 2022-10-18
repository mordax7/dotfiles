function fish_user_key_bindings
    # fzf
    fzf_key_bindings

    # todoist
    bind -M insert \eti fzf_todoist_item
    bind -M insert \etp fzf_todoist_project
    bind -M insert \etl fzf_todoist_labels
    bind -M insert \etc fzf_todoist_close
    bind -M insert \etd fzf_todoist_delete
    bind -M insert \eto fzf_todoist_open
    bind -M insert \ett fzf_todoist_date
    bind -M insert \etq fzf_todoist_quick_add
end
