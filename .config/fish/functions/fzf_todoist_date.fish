function fzf_todoist_date
    date -v 1d &>/dev/null
    if [ $status -eq 0 ]
        # BSD date option
        set OPTION "-v+#d"
    else
        # GNU date option
        set OPTION "-d # day"
    end

    seq 0 30 | xargs -I# date $OPTION '+%d/%m/%Y %a' | fzf | cut -d ' ' -f 1 | read ret
    if [ $ret ]
        set buf (commandline | sed -e 's/[ \t]*$//')
        commandline "$buf -d $ret"
    end
end
