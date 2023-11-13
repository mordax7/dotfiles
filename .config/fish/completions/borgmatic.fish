            function __borgmatic_check_version
                set -fx this_filename (status current-filename)
                fish -c '
                    if test -f "$this_filename"
                        set this_script (cat $this_filename 2> /dev/null)
                        set installed_script (borgmatic --fish-completion 2> /dev/null)
                        if [ "$this_script" != "$installed_script" ] && [ "$installed_script" != "" ]
                            echo "
Your fish completions script is from a different version of borgmatic than is
currently installed. Please upgrade your script so your completions match the
command-line flags in your installed borgmatic! Try this to upgrade:

    borgmatic --fish-completion | sudo tee $this_filename
    source $this_filename
"
                        end
                    end
                ' &
            end
            __borgmatic_check_version

            function __borgmatic_current_arg --description 'Check if any of the given arguments are the last on the command line before the cursor'
                set -l all_args (commandline -poc)
                # premature optimization to avoid iterating all args if there aren't enough
                # to have a last arg beyond borgmatic
                if [ (count $all_args) -lt 2 ]
                    return 1
                end
                for arg in $argv
                    if [ "$arg" = "$all_args[-1]" ]
                        return 0
                    end
                end
                return 1
            end

            set --local action_parser_condition "not __fish_seen_subcommand_from rcreate init -I transfer prune -p compact create -C check -k extract -x config export-tar mount -m umount -u restore -r rlist list -l rinfo info -i break-lock key borg"
            set --local exact_option_condition "not __borgmatic_current_arg -e --encryption -e --encryption -e --encryption --source-repository -a --match-archives --glob-archives --sort-by --first --last --threshold --only --only --archive --path --restore-path --destination --strip-components --archive --path --restore-path --destination --strip-components  --archive --path --destination --strip-components --mount-point --path --first --last --mount-point --path --first --last --mount-point --mount-point --archive --archive -a --match-archives --glob-archives --sort-by --first --last --path --find -a --match-archives --glob-archives --sort-by --first --last -e --exclude --exclude-from --patterns-from --path --find -a --match-archives --glob-archives --sort-by --first --last -e --exclude --exclude-from --patterns-from -a --match-archives --glob-archives --sort-by --first --last -a --match-archives --glob-archives --sort-by --first --last  -- -c --config -v --verbosity --syslog-verbosity --log-file-verbosity --monitoring-verbosity --log-file --log-file-format"

# action_parser completions
complete -c borgmatic -f -n "$action_parser_condition" -n "$exact_option_condition" -a 'rcreate' -d 'Create a new, empty Borg repository'
complete -c borgmatic -f -n "$action_parser_condition" -n "$exact_option_condition" -a 'init' -d 'Create a new, empty Borg repository'
complete -c borgmatic -f -n "$action_parser_condition" -n "$exact_option_condition" -a '-I' -d 'Create a new, empty Borg repository'
complete -c borgmatic -f -n "$action_parser_condition" -n "$exact_option_condition" -a 'transfer' -d 'Transfer archives from one repository to another, optionally upgrading the transferred data [Borg 2.0+ only]'
complete -c borgmatic -f -n "$action_parser_condition" -n "$exact_option_condition" -a 'prune' -d 'Prune archives according to the retention policy (with Borg 1.2+, run compact afterwards to actually free space)'
complete -c borgmatic -f -n "$action_parser_condition" -n "$exact_option_condition" -a '-p' -d 'Prune archives according to the retention policy (with Borg 1.2+, run compact afterwards to actually free space)'
complete -c borgmatic -f -n "$action_parser_condition" -n "$exact_option_condition" -a 'compact' -d 'Compact segments to free space [Borg 1.2+, borgmatic 1.5.23+ only]'
complete -c borgmatic -f -n "$action_parser_condition" -n "$exact_option_condition" -a 'create' -d 'Create an archive (actually perform a backup)'
complete -c borgmatic -f -n "$action_parser_condition" -n "$exact_option_condition" -a '-C' -d 'Create an archive (actually perform a backup)'
complete -c borgmatic -f -n "$action_parser_condition" -n "$exact_option_condition" -a 'check' -d 'Check archives for consistency'
complete -c borgmatic -f -n "$action_parser_condition" -n "$exact_option_condition" -a '-k' -d 'Check archives for consistency'
complete -c borgmatic -f -n "$action_parser_condition" -n "$exact_option_condition" -a 'extract' -d 'Extract a named archive to the current directory'
complete -c borgmatic -f -n "$action_parser_condition" -n "$exact_option_condition" -a '-x' -d 'Extract a named archive to the current directory'
complete -c borgmatic -f -n "$action_parser_condition" -n "$exact_option_condition" -a 'config' -d 'Perform configuration file related operations'
complete -c borgmatic -f -n "$action_parser_condition" -n "$exact_option_condition" -a 'export-tar' -d 'Export an archive to a tar-formatted file or stream'
complete -c borgmatic -f -n "$action_parser_condition" -n "$exact_option_condition" -a 'mount' -d 'Mount a named archive as a FUSE filesystem'
complete -c borgmatic -f -n "$action_parser_condition" -n "$exact_option_condition" -a '-m' -d 'Mount a named archive as a FUSE filesystem'
complete -c borgmatic -f -n "$action_parser_condition" -n "$exact_option_condition" -a 'umount' -d 'Unmount a mounted FUSE filesystem'
complete -c borgmatic -f -n "$action_parser_condition" -n "$exact_option_condition" -a '-u' -d 'Unmount a mounted FUSE filesystem'
complete -c borgmatic -f -n "$action_parser_condition" -n "$exact_option_condition" -a 'restore' -d 'Restore data source (e.g. database) dumps from a named archive. (To extract files instead, use "borgmatic extract".)'
complete -c borgmatic -f -n "$action_parser_condition" -n "$exact_option_condition" -a '-r' -d 'Restore data source (e.g. database) dumps from a named archive. (To extract files instead, use "borgmatic extract".)'
complete -c borgmatic -f -n "$action_parser_condition" -n "$exact_option_condition" -a 'rlist' -d 'List the archives in a repository'
complete -c borgmatic -f -n "$action_parser_condition" -n "$exact_option_condition" -a 'list' -d 'List the files in an archive or search for a file across archives'
complete -c borgmatic -f -n "$action_parser_condition" -n "$exact_option_condition" -a '-l' -d 'List the files in an archive or search for a file across archives'
complete -c borgmatic -f -n "$action_parser_condition" -n "$exact_option_condition" -a 'rinfo' -d 'Show repository summary information such as disk space used'
complete -c borgmatic -f -n "$action_parser_condition" -n "$exact_option_condition" -a 'info' -d 'Show archive summary information such as disk space used'
complete -c borgmatic -f -n "$action_parser_condition" -n "$exact_option_condition" -a '-i' -d 'Show archive summary information such as disk space used'
complete -c borgmatic -f -n "$action_parser_condition" -n "$exact_option_condition" -a 'break-lock' -d 'Break Borg repository and cache locks left behind by Borg aborting'
complete -c borgmatic -f -n "$action_parser_condition" -n "$exact_option_condition" -a 'key' -d 'Perform repository key related operations'
complete -c borgmatic -f -n "$action_parser_condition" -n "$exact_option_condition" -a 'borg' -d 'Run an arbitrary Borg command based on borgmatic'"'"'s configuration'

# global flags
complete -c borgmatic -f -n "$exact_option_condition" -a '-h --help' -d 'show this help message and exit'
complete -c borgmatic -f -n "$exact_option_condition" -a '-c --config' -d 'Configuration filename or directory, can specify flag multiple times, defaults to: /etc/borgmatic/config.yaml /etc/borgmatic.d /home/aljaz/.config/borgmatic/config.yaml /home/aljaz/.config/borgmatic.d'
complete -c borgmatic -Fr -n "__borgmatic_current_arg -c --config"
complete -c borgmatic -f -n "$exact_option_condition" -a '-n --dry-run' -d 'Go through the motions, but do not actually write to any repositories'
complete -c borgmatic -f -n "$exact_option_condition" -a '-nc --no-color' -d 'Disable colored output'
complete -c borgmatic -f -n "$exact_option_condition" -a '-v --verbosity' -d 'Display verbose progress to the console: -2 (disabled), -1 (errors only), 0 (responses to actions, the default), 1 (info about steps borgmatic is taking), or 2 (debug)'
complete -c borgmatic -f -a '-2 -1 0 1 2' -n "__borgmatic_current_arg -v --verbosity"
complete -c borgmatic -f -n "$exact_option_condition" -a '--syslog-verbosity' -d 'Log verbose progress to syslog: -2 (disabled, the default), -1 (errors only), 0 (responses to actions), 1 (info about steps borgmatic is taking), or 2 (debug)'
complete -c borgmatic -f -a '-2 -1 0 1 2' -n "__borgmatic_current_arg --syslog-verbosity"
complete -c borgmatic -f -n "$exact_option_condition" -a '--log-file-verbosity' -d 'When --log-file is given, log verbose progress to file: -2 (disabled), -1 (errors only), 0 (responses to actions), 1 (info about steps borgmatic is taking, the default), or 2 (debug)'
complete -c borgmatic -f -a '-2 -1 0 1 2' -n "__borgmatic_current_arg --log-file-verbosity"
complete -c borgmatic -f -n "$exact_option_condition" -a '--monitoring-verbosity' -d 'When a monitoring integration supporting logging is configured, log verbose progress to it: -2 (disabled), -1 (errors only), responses to actions (0), 1 (info about steps borgmatic is taking, the default), or 2 (debug)'
complete -c borgmatic -f -a '-2 -1 0 1 2' -n "__borgmatic_current_arg --monitoring-verbosity"
complete -c borgmatic -f -n "$exact_option_condition" -a '--log-file' -d 'Write log messages to this file instead of syslog'
complete -c borgmatic -x -n "__borgmatic_current_arg --log-file"
complete -c borgmatic -f -n "$exact_option_condition" -a '--log-file-format' -d 'Log format string used for log messages written to the log file'
complete -c borgmatic -x -n "__borgmatic_current_arg --log-file-format"
complete -c borgmatic -f -n "$exact_option_condition" -a '--log-json' -d 'Write log messages and console output as one JSON object per log line instead of formatted text'
complete -c borgmatic -f -n "$exact_option_condition" -a '--override' -d 'Configuration file option to override with specified value, can specify flag multiple times'
complete -c borgmatic -f -n "$exact_option_condition" -a '--no-environment-interpolation' -d 'Do not resolve environment variables in configuration file'
complete -c borgmatic -f -n "$exact_option_condition" -a '--bash-completion' -d 'Show bash completion script and exit'
complete -c borgmatic -f -n "$exact_option_condition" -a '--fish-completion' -d 'Show fish completion script and exit'
complete -c borgmatic -f -n "$exact_option_condition" -a '--version' -d 'Display installed version number of borgmatic and exit'

# action_parser flags
complete -c borgmatic -f -n "$exact_option_condition" -a '-e --encryption' -d 'Borg repository encryption mode' -n "__fish_seen_subcommand_from rcreate"
complete -c borgmatic -x -n "__borgmatic_current_arg -e --encryption"
complete -c borgmatic -f -n "$exact_option_condition" -a '--source-repository --other-repo' -d 'Path to an existing Borg repository whose key material should be reused [Borg 2.x+ only]' -n "__fish_seen_subcommand_from rcreate"
complete -c borgmatic -f -n "$exact_option_condition" -a '--repository' -d 'Path of the new repository to create (must be already specified in a borgmatic configuration file), defaults to the configured repository if there is only one' -n "__fish_seen_subcommand_from rcreate"
complete -c borgmatic -f -n "$exact_option_condition" -a '--copy-crypt-key' -d 'Copy the crypt key used for authenticated encryption from the source repository, defaults to a new random key [Borg 2.x+ only]' -n "__fish_seen_subcommand_from rcreate"
complete -c borgmatic -f -n "$exact_option_condition" -a '--append-only' -d 'Create an append-only repository' -n "__fish_seen_subcommand_from rcreate"
complete -c borgmatic -f -n "$exact_option_condition" -a '--storage-quota' -d 'Create a repository with a fixed storage quota' -n "__fish_seen_subcommand_from rcreate"
complete -c borgmatic -f -n "$exact_option_condition" -a '--make-parent-dirs' -d 'Create any missing parent directories of the repository directory' -n "__fish_seen_subcommand_from rcreate"
complete -c borgmatic -f -n "$exact_option_condition" -a '-h --help' -d 'Show this help message and exit' -n "__fish_seen_subcommand_from rcreate"
complete -c borgmatic -f -n "$exact_option_condition" -a '-e --encryption' -d 'Borg repository encryption mode' -n "__fish_seen_subcommand_from init"
complete -c borgmatic -x -n "__borgmatic_current_arg -e --encryption"
complete -c borgmatic -f -n "$exact_option_condition" -a '--source-repository --other-repo' -d 'Path to an existing Borg repository whose key material should be reused [Borg 2.x+ only]' -n "__fish_seen_subcommand_from init"
complete -c borgmatic -f -n "$exact_option_condition" -a '--repository' -d 'Path of the new repository to create (must be already specified in a borgmatic configuration file), defaults to the configured repository if there is only one' -n "__fish_seen_subcommand_from init"
complete -c borgmatic -f -n "$exact_option_condition" -a '--copy-crypt-key' -d 'Copy the crypt key used for authenticated encryption from the source repository, defaults to a new random key [Borg 2.x+ only]' -n "__fish_seen_subcommand_from init"
complete -c borgmatic -f -n "$exact_option_condition" -a '--append-only' -d 'Create an append-only repository' -n "__fish_seen_subcommand_from init"
complete -c borgmatic -f -n "$exact_option_condition" -a '--storage-quota' -d 'Create a repository with a fixed storage quota' -n "__fish_seen_subcommand_from init"
complete -c borgmatic -f -n "$exact_option_condition" -a '--make-parent-dirs' -d 'Create any missing parent directories of the repository directory' -n "__fish_seen_subcommand_from init"
complete -c borgmatic -f -n "$exact_option_condition" -a '-h --help' -d 'Show this help message and exit' -n "__fish_seen_subcommand_from init"
complete -c borgmatic -f -n "$exact_option_condition" -a '-e --encryption' -d 'Borg repository encryption mode' -n "__fish_seen_subcommand_from -I"
complete -c borgmatic -x -n "__borgmatic_current_arg -e --encryption"
complete -c borgmatic -f -n "$exact_option_condition" -a '--source-repository --other-repo' -d 'Path to an existing Borg repository whose key material should be reused [Borg 2.x+ only]' -n "__fish_seen_subcommand_from -I"
complete -c borgmatic -f -n "$exact_option_condition" -a '--repository' -d 'Path of the new repository to create (must be already specified in a borgmatic configuration file), defaults to the configured repository if there is only one' -n "__fish_seen_subcommand_from -I"
complete -c borgmatic -f -n "$exact_option_condition" -a '--copy-crypt-key' -d 'Copy the crypt key used for authenticated encryption from the source repository, defaults to a new random key [Borg 2.x+ only]' -n "__fish_seen_subcommand_from -I"
complete -c borgmatic -f -n "$exact_option_condition" -a '--append-only' -d 'Create an append-only repository' -n "__fish_seen_subcommand_from -I"
complete -c borgmatic -f -n "$exact_option_condition" -a '--storage-quota' -d 'Create a repository with a fixed storage quota' -n "__fish_seen_subcommand_from -I"
complete -c borgmatic -f -n "$exact_option_condition" -a '--make-parent-dirs' -d 'Create any missing parent directories of the repository directory' -n "__fish_seen_subcommand_from -I"
complete -c borgmatic -f -n "$exact_option_condition" -a '-h --help' -d 'Show this help message and exit' -n "__fish_seen_subcommand_from -I"
complete -c borgmatic -f -n "$exact_option_condition" -a '--repository' -d 'Path of existing destination repository to transfer archives to, defaults to the configured repository if there is only one' -n "__fish_seen_subcommand_from transfer"
complete -c borgmatic -f -n "$exact_option_condition" -a '--source-repository' -d 'Path of existing source repository to transfer archives from' -n "__fish_seen_subcommand_from transfer"
complete -c borgmatic -x -n "__borgmatic_current_arg --source-repository"
complete -c borgmatic -f -n "$exact_option_condition" -a '--archive' -d 'Name of single archive to transfer (or "latest"), defaults to transferring all archives' -n "__fish_seen_subcommand_from transfer"
complete -c borgmatic -f -n "$exact_option_condition" -a '--upgrader' -d 'Upgrader type used to convert the transferred data, e.g. "From12To20" to upgrade data from Borg 1.2 to 2.0 format, defaults to no conversion' -n "__fish_seen_subcommand_from transfer"
complete -c borgmatic -f -n "$exact_option_condition" -a '--progress' -d 'Display progress as each archive is transferred' -n "__fish_seen_subcommand_from transfer"
complete -c borgmatic -f -n "$exact_option_condition" -a '-a --match-archives --glob-archives' -d 'Only transfer archives with names matching this pattern' -n "__fish_seen_subcommand_from transfer"
complete -c borgmatic -x -n "__borgmatic_current_arg -a --match-archives --glob-archives"
complete -c borgmatic -f -n "$exact_option_condition" -a '--sort-by' -d 'Comma-separated list of sorting keys' -n "__fish_seen_subcommand_from transfer"
complete -c borgmatic -x -n "__borgmatic_current_arg --sort-by"
complete -c borgmatic -f -n "$exact_option_condition" -a '--first' -d 'Only transfer first N archives after other filters are applied' -n "__fish_seen_subcommand_from transfer"
complete -c borgmatic -x -n "__borgmatic_current_arg --first"
complete -c borgmatic -f -n "$exact_option_condition" -a '--last' -d 'Only transfer last N archives after other filters are applied' -n "__fish_seen_subcommand_from transfer"
complete -c borgmatic -x -n "__borgmatic_current_arg --last"
complete -c borgmatic -f -n "$exact_option_condition" -a '--oldest' -d 'Transfer archives within a specified time range starting from the timestamp of the oldest archive (e.g. 7d or 12m) [Borg 2.x+ only]' -n "__fish_seen_subcommand_from transfer"
complete -c borgmatic -f -n "$exact_option_condition" -a '--newest' -d 'Transfer archives within a time range that ends at timestamp of the newest archive and starts a specified time range ago (e.g. 7d or 12m) [Borg 2.x+ only]' -n "__fish_seen_subcommand_from transfer"
complete -c borgmatic -f -n "$exact_option_condition" -a '--older' -d 'Transfer archives that are older than the specified time range (e.g. 7d or 12m) from the current time [Borg 2.x+ only]' -n "__fish_seen_subcommand_from transfer"
complete -c borgmatic -f -n "$exact_option_condition" -a '--newer' -d 'Transfer archives that are newer than the specified time range (e.g. 7d or 12m) from the current time [Borg 2.x+ only]' -n "__fish_seen_subcommand_from transfer"
complete -c borgmatic -f -n "$exact_option_condition" -a '-h --help' -d 'Show this help message and exit' -n "__fish_seen_subcommand_from transfer"
complete -c borgmatic -f -n "$exact_option_condition" -a '--repository' -d 'Path of specific existing repository to prune (must be already specified in a borgmatic configuration file)' -n "__fish_seen_subcommand_from prune"
complete -c borgmatic -f -n "$exact_option_condition" -a '--stats' -d 'Display statistics of archive' -n "__fish_seen_subcommand_from prune"
complete -c borgmatic -f -n "$exact_option_condition" -a '--list' -d 'List archives kept/pruned' -n "__fish_seen_subcommand_from prune"
complete -c borgmatic -f -n "$exact_option_condition" -a '--oldest' -d 'Prune archives within a specified time range starting from the timestamp of the oldest archive (e.g. 7d or 12m) [Borg 2.x+ only]' -n "__fish_seen_subcommand_from prune"
complete -c borgmatic -f -n "$exact_option_condition" -a '--newest' -d 'Prune archives within a time range that ends at timestamp of the newest archive and starts a specified time range ago (e.g. 7d or 12m) [Borg 2.x+ only]' -n "__fish_seen_subcommand_from prune"
complete -c borgmatic -f -n "$exact_option_condition" -a '--older' -d 'Prune archives that are older than the specified time range (e.g. 7d or 12m) from the current time [Borg 2.x+ only]' -n "__fish_seen_subcommand_from prune"
complete -c borgmatic -f -n "$exact_option_condition" -a '--newer' -d 'Prune archives that are newer than the specified time range (e.g. 7d or 12m) from the current time [Borg 2.x+ only]' -n "__fish_seen_subcommand_from prune"
complete -c borgmatic -f -n "$exact_option_condition" -a '-h --help' -d 'Show this help message and exit' -n "__fish_seen_subcommand_from prune"
complete -c borgmatic -f -n "$exact_option_condition" -a '--repository' -d 'Path of specific existing repository to prune (must be already specified in a borgmatic configuration file)' -n "__fish_seen_subcommand_from -p"
complete -c borgmatic -f -n "$exact_option_condition" -a '--stats' -d 'Display statistics of archive' -n "__fish_seen_subcommand_from -p"
complete -c borgmatic -f -n "$exact_option_condition" -a '--list' -d 'List archives kept/pruned' -n "__fish_seen_subcommand_from -p"
complete -c borgmatic -f -n "$exact_option_condition" -a '--oldest' -d 'Prune archives within a specified time range starting from the timestamp of the oldest archive (e.g. 7d or 12m) [Borg 2.x+ only]' -n "__fish_seen_subcommand_from -p"
complete -c borgmatic -f -n "$exact_option_condition" -a '--newest' -d 'Prune archives within a time range that ends at timestamp of the newest archive and starts a specified time range ago (e.g. 7d or 12m) [Borg 2.x+ only]' -n "__fish_seen_subcommand_from -p"
complete -c borgmatic -f -n "$exact_option_condition" -a '--older' -d 'Prune archives that are older than the specified time range (e.g. 7d or 12m) from the current time [Borg 2.x+ only]' -n "__fish_seen_subcommand_from -p"
complete -c borgmatic -f -n "$exact_option_condition" -a '--newer' -d 'Prune archives that are newer than the specified time range (e.g. 7d or 12m) from the current time [Borg 2.x+ only]' -n "__fish_seen_subcommand_from -p"
complete -c borgmatic -f -n "$exact_option_condition" -a '-h --help' -d 'Show this help message and exit' -n "__fish_seen_subcommand_from -p"
complete -c borgmatic -f -n "$exact_option_condition" -a '--repository' -d 'Path of specific existing repository to compact (must be already specified in a borgmatic configuration file)' -n "__fish_seen_subcommand_from compact"
complete -c borgmatic -f -n "$exact_option_condition" -a '--progress' -d 'Display progress as each segment is compacted' -n "__fish_seen_subcommand_from compact"
complete -c borgmatic -f -n "$exact_option_condition" -a '--cleanup-commits' -d 'Cleanup commit-only 17-byte segment files left behind by Borg 1.1 [flag in Borg 1.2 only]' -n "__fish_seen_subcommand_from compact"
complete -c borgmatic -f -n "$exact_option_condition" -a '--threshold' -d 'Minimum saved space percentage threshold for compacting a segment, defaults to 10' -n "__fish_seen_subcommand_from compact"
complete -c borgmatic -x -n "__borgmatic_current_arg --threshold"
complete -c borgmatic -f -n "$exact_option_condition" -a '-h --help' -d 'Show this help message and exit' -n "__fish_seen_subcommand_from compact"
complete -c borgmatic -f -n "$exact_option_condition" -a '--repository' -d 'Path of specific existing repository to backup to (must be already specified in a borgmatic configuration file)' -n "__fish_seen_subcommand_from create"
complete -c borgmatic -f -n "$exact_option_condition" -a '--progress' -d 'Display progress for each file as it is backed up' -n "__fish_seen_subcommand_from create"
complete -c borgmatic -f -n "$exact_option_condition" -a '--stats' -d 'Display statistics of archive' -n "__fish_seen_subcommand_from create"
complete -c borgmatic -f -n "$exact_option_condition" -a '--list --files' -d 'Show per-file details' -n "__fish_seen_subcommand_from create"
complete -c borgmatic -f -n "$exact_option_condition" -a '--json' -d 'Output results as JSON' -n "__fish_seen_subcommand_from create"
complete -c borgmatic -f -n "$exact_option_condition" -a '-h --help' -d 'Show this help message and exit' -n "__fish_seen_subcommand_from create"
complete -c borgmatic -f -n "$exact_option_condition" -a '--repository' -d 'Path of specific existing repository to backup to (must be already specified in a borgmatic configuration file)' -n "__fish_seen_subcommand_from -C"
complete -c borgmatic -f -n "$exact_option_condition" -a '--progress' -d 'Display progress for each file as it is backed up' -n "__fish_seen_subcommand_from -C"
complete -c borgmatic -f -n "$exact_option_condition" -a '--stats' -d 'Display statistics of archive' -n "__fish_seen_subcommand_from -C"
complete -c borgmatic -f -n "$exact_option_condition" -a '--list --files' -d 'Show per-file details' -n "__fish_seen_subcommand_from -C"
complete -c borgmatic -f -n "$exact_option_condition" -a '--json' -d 'Output results as JSON' -n "__fish_seen_subcommand_from -C"
complete -c borgmatic -f -n "$exact_option_condition" -a '-h --help' -d 'Show this help message and exit' -n "__fish_seen_subcommand_from -C"
complete -c borgmatic -f -n "$exact_option_condition" -a '--repository' -d 'Path of specific existing repository to check (must be already specified in a borgmatic configuration file)' -n "__fish_seen_subcommand_from check"
complete -c borgmatic -f -n "$exact_option_condition" -a '--progress' -d 'Display progress for each file as it is checked' -n "__fish_seen_subcommand_from check"
complete -c borgmatic -f -n "$exact_option_condition" -a '--repair' -d 'Attempt to repair any inconsistencies found (for interactive use)' -n "__fish_seen_subcommand_from check"
complete -c borgmatic -f -n "$exact_option_condition" -a '--only' -d 'Run a particular consistency check (repository, archives, data, or extract) instead of configured checks (subject to configured frequency, can specify flag multiple times)' -n "__fish_seen_subcommand_from check"
complete -c borgmatic -f -a 'repository archives data extract' -n "__borgmatic_current_arg --only"
complete -c borgmatic -f -n "$exact_option_condition" -a '--force' -d 'Ignore configured check frequencies and run checks unconditionally' -n "__fish_seen_subcommand_from check"
complete -c borgmatic -f -n "$exact_option_condition" -a '-h --help' -d 'Show this help message and exit' -n "__fish_seen_subcommand_from check"
complete -c borgmatic -f -n "$exact_option_condition" -a '--repository' -d 'Path of specific existing repository to check (must be already specified in a borgmatic configuration file)' -n "__fish_seen_subcommand_from -k"
complete -c borgmatic -f -n "$exact_option_condition" -a '--progress' -d 'Display progress for each file as it is checked' -n "__fish_seen_subcommand_from -k"
complete -c borgmatic -f -n "$exact_option_condition" -a '--repair' -d 'Attempt to repair any inconsistencies found (for interactive use)' -n "__fish_seen_subcommand_from -k"
complete -c borgmatic -f -n "$exact_option_condition" -a '--only' -d 'Run a particular consistency check (repository, archives, data, or extract) instead of configured checks (subject to configured frequency, can specify flag multiple times)' -n "__fish_seen_subcommand_from -k"
complete -c borgmatic -f -a 'repository archives data extract' -n "__borgmatic_current_arg --only"
complete -c borgmatic -f -n "$exact_option_condition" -a '--force' -d 'Ignore configured check frequencies and run checks unconditionally' -n "__fish_seen_subcommand_from -k"
complete -c borgmatic -f -n "$exact_option_condition" -a '-h --help' -d 'Show this help message and exit' -n "__fish_seen_subcommand_from -k"
complete -c borgmatic -f -n "$exact_option_condition" -a '--repository' -d 'Path of repository to extract, defaults to the configured repository if there is only one' -n "__fish_seen_subcommand_from extract"
complete -c borgmatic -f -n "$exact_option_condition" -a '--archive' -d 'Name of archive to extract (or "latest")' -n "__fish_seen_subcommand_from extract"
complete -c borgmatic -x -n "__borgmatic_current_arg --archive"
complete -c borgmatic -f -n "$exact_option_condition" -a '--path --restore-path' -d 'Path to extract from archive, can specify flag multiple times, defaults to the entire archive' -n "__fish_seen_subcommand_from extract"
complete -c borgmatic -Fr -n "__borgmatic_current_arg --path --restore-path"
complete -c borgmatic -f -n "$exact_option_condition" -a '--destination' -d 'Directory to extract files into, defaults to the current directory' -n "__fish_seen_subcommand_from extract"
complete -c borgmatic -Fr -n "__borgmatic_current_arg --destination"
complete -c borgmatic -f -n "$exact_option_condition" -a '--strip-components' -d 'Number of leading path components to remove from each extracted path or "all" to strip all leading path components. Skip paths with fewer elements' -n "__fish_seen_subcommand_from extract"
complete -c borgmatic -x -n "__borgmatic_current_arg --strip-components"
complete -c borgmatic -f -n "$exact_option_condition" -a '--progress' -d 'Display progress for each file as it is extracted' -n "__fish_seen_subcommand_from extract"
complete -c borgmatic -f -n "$exact_option_condition" -a '-h --help' -d 'Show this help message and exit' -n "__fish_seen_subcommand_from extract"
complete -c borgmatic -f -n "$exact_option_condition" -a '--repository' -d 'Path of repository to extract, defaults to the configured repository if there is only one' -n "__fish_seen_subcommand_from -x"
complete -c borgmatic -f -n "$exact_option_condition" -a '--archive' -d 'Name of archive to extract (or "latest")' -n "__fish_seen_subcommand_from -x"
complete -c borgmatic -x -n "__borgmatic_current_arg --archive"
complete -c borgmatic -f -n "$exact_option_condition" -a '--path --restore-path' -d 'Path to extract from archive, can specify flag multiple times, defaults to the entire archive' -n "__fish_seen_subcommand_from -x"
complete -c borgmatic -Fr -n "__borgmatic_current_arg --path --restore-path"
complete -c borgmatic -f -n "$exact_option_condition" -a '--destination' -d 'Directory to extract files into, defaults to the current directory' -n "__fish_seen_subcommand_from -x"
complete -c borgmatic -Fr -n "__borgmatic_current_arg --destination"
complete -c borgmatic -f -n "$exact_option_condition" -a '--strip-components' -d 'Number of leading path components to remove from each extracted path or "all" to strip all leading path components. Skip paths with fewer elements' -n "__fish_seen_subcommand_from -x"
complete -c borgmatic -x -n "__borgmatic_current_arg --strip-components"
complete -c borgmatic -f -n "$exact_option_condition" -a '--progress' -d 'Display progress for each file as it is extracted' -n "__fish_seen_subcommand_from -x"
complete -c borgmatic -f -n "$exact_option_condition" -a '-h --help' -d 'Show this help message and exit' -n "__fish_seen_subcommand_from -x"
complete -c borgmatic -f -n "$exact_option_condition" -a '-h --help' -d 'Show this help message and exit' -n "__fish_seen_subcommand_from config"
complete -c borgmatic -f -n "$exact_option_condition" -a '' -d '' -n "__fish_seen_subcommand_from config"
complete -c borgmatic -f -a 'bootstrap generate validate' -n "__borgmatic_current_arg "
complete -c borgmatic -f -n "$exact_option_condition" -a '--repository' -d 'Path of repository to export from, defaults to the configured repository if there is only one' -n "__fish_seen_subcommand_from export-tar"
complete -c borgmatic -f -n "$exact_option_condition" -a '--archive' -d 'Name of archive to export (or "latest")' -n "__fish_seen_subcommand_from export-tar"
complete -c borgmatic -x -n "__borgmatic_current_arg --archive"
complete -c borgmatic -f -n "$exact_option_condition" -a '--path' -d 'Path to export from archive, can specify flag multiple times, defaults to the entire archive' -n "__fish_seen_subcommand_from export-tar"
complete -c borgmatic -Fr -n "__borgmatic_current_arg --path"
complete -c borgmatic -f -n "$exact_option_condition" -a '--destination' -d 'Path to destination export tar file, or "-" for stdout (but be careful about dirtying output with --verbosity or --list)' -n "__fish_seen_subcommand_from export-tar"
complete -c borgmatic -Fr -n "__borgmatic_current_arg --destination"
complete -c borgmatic -f -n "$exact_option_condition" -a '--tar-filter' -d 'Name of filter program to pipe data through' -n "__fish_seen_subcommand_from export-tar"
complete -c borgmatic -f -n "$exact_option_condition" -a '--list --files' -d 'Show per-file details' -n "__fish_seen_subcommand_from export-tar"
complete -c borgmatic -f -n "$exact_option_condition" -a '--strip-components' -d 'Number of leading path components to remove from each exported path. Skip paths with fewer elements' -n "__fish_seen_subcommand_from export-tar"
complete -c borgmatic -x -n "__borgmatic_current_arg --strip-components"
complete -c borgmatic -f -n "$exact_option_condition" -a '-h --help' -d 'Show this help message and exit' -n "__fish_seen_subcommand_from export-tar"
complete -c borgmatic -f -n "$exact_option_condition" -a '--repository' -d 'Path of repository to use, defaults to the configured repository if there is only one' -n "__fish_seen_subcommand_from mount"
complete -c borgmatic -f -n "$exact_option_condition" -a '--archive' -d 'Name of archive to mount (or "latest")' -n "__fish_seen_subcommand_from mount"
complete -c borgmatic -f -n "$exact_option_condition" -a '--mount-point' -d 'Path where filesystem is to be mounted' -n "__fish_seen_subcommand_from mount"
complete -c borgmatic -Fr -n "__borgmatic_current_arg --mount-point"
complete -c borgmatic -f -n "$exact_option_condition" -a '--path' -d 'Path to mount from archive, can specify multiple times, defaults to the entire archive' -n "__fish_seen_subcommand_from mount"
complete -c borgmatic -Fr -n "__borgmatic_current_arg --path"
complete -c borgmatic -f -n "$exact_option_condition" -a '--foreground' -d 'Stay in foreground until ctrl-C is pressed' -n "__fish_seen_subcommand_from mount"
complete -c borgmatic -f -n "$exact_option_condition" -a '--first' -d 'Mount first N archives after other filters are applied' -n "__fish_seen_subcommand_from mount"
complete -c borgmatic -x -n "__borgmatic_current_arg --first"
complete -c borgmatic -f -n "$exact_option_condition" -a '--last' -d 'Mount last N archives after other filters are applied' -n "__fish_seen_subcommand_from mount"
complete -c borgmatic -x -n "__borgmatic_current_arg --last"
complete -c borgmatic -f -n "$exact_option_condition" -a '--oldest' -d 'Mount archives within a specified time range starting from the timestamp of the oldest archive (e.g. 7d or 12m) [Borg 2.x+ only]' -n "__fish_seen_subcommand_from mount"
complete -c borgmatic -f -n "$exact_option_condition" -a '--newest' -d 'Mount archives within a time range that ends at timestamp of the newest archive and starts a specified time range ago (e.g. 7d or 12m) [Borg 2.x+ only]' -n "__fish_seen_subcommand_from mount"
complete -c borgmatic -f -n "$exact_option_condition" -a '--older' -d 'Mount archives that are older than the specified time range (e.g. 7d or 12m) from the current time [Borg 2.x+ only]' -n "__fish_seen_subcommand_from mount"
complete -c borgmatic -f -n "$exact_option_condition" -a '--newer' -d 'Mount archives that are newer than the specified time range (e.g. 7d or 12m) from the current time [Borg 2.x+ only]' -n "__fish_seen_subcommand_from mount"
complete -c borgmatic -f -n "$exact_option_condition" -a '--options' -d 'Extra Borg mount options' -n "__fish_seen_subcommand_from mount"
complete -c borgmatic -f -n "$exact_option_condition" -a '-h --help' -d 'Show this help message and exit' -n "__fish_seen_subcommand_from mount"
complete -c borgmatic -f -n "$exact_option_condition" -a '--repository' -d 'Path of repository to use, defaults to the configured repository if there is only one' -n "__fish_seen_subcommand_from -m"
complete -c borgmatic -f -n "$exact_option_condition" -a '--archive' -d 'Name of archive to mount (or "latest")' -n "__fish_seen_subcommand_from -m"
complete -c borgmatic -f -n "$exact_option_condition" -a '--mount-point' -d 'Path where filesystem is to be mounted' -n "__fish_seen_subcommand_from -m"
complete -c borgmatic -Fr -n "__borgmatic_current_arg --mount-point"
complete -c borgmatic -f -n "$exact_option_condition" -a '--path' -d 'Path to mount from archive, can specify multiple times, defaults to the entire archive' -n "__fish_seen_subcommand_from -m"
complete -c borgmatic -Fr -n "__borgmatic_current_arg --path"
complete -c borgmatic -f -n "$exact_option_condition" -a '--foreground' -d 'Stay in foreground until ctrl-C is pressed' -n "__fish_seen_subcommand_from -m"
complete -c borgmatic -f -n "$exact_option_condition" -a '--first' -d 'Mount first N archives after other filters are applied' -n "__fish_seen_subcommand_from -m"
complete -c borgmatic -x -n "__borgmatic_current_arg --first"
complete -c borgmatic -f -n "$exact_option_condition" -a '--last' -d 'Mount last N archives after other filters are applied' -n "__fish_seen_subcommand_from -m"
complete -c borgmatic -x -n "__borgmatic_current_arg --last"
complete -c borgmatic -f -n "$exact_option_condition" -a '--oldest' -d 'Mount archives within a specified time range starting from the timestamp of the oldest archive (e.g. 7d or 12m) [Borg 2.x+ only]' -n "__fish_seen_subcommand_from -m"
complete -c borgmatic -f -n "$exact_option_condition" -a '--newest' -d 'Mount archives within a time range that ends at timestamp of the newest archive and starts a specified time range ago (e.g. 7d or 12m) [Borg 2.x+ only]' -n "__fish_seen_subcommand_from -m"
complete -c borgmatic -f -n "$exact_option_condition" -a '--older' -d 'Mount archives that are older than the specified time range (e.g. 7d or 12m) from the current time [Borg 2.x+ only]' -n "__fish_seen_subcommand_from -m"
complete -c borgmatic -f -n "$exact_option_condition" -a '--newer' -d 'Mount archives that are newer than the specified time range (e.g. 7d or 12m) from the current time [Borg 2.x+ only]' -n "__fish_seen_subcommand_from -m"
complete -c borgmatic -f -n "$exact_option_condition" -a '--options' -d 'Extra Borg mount options' -n "__fish_seen_subcommand_from -m"
complete -c borgmatic -f -n "$exact_option_condition" -a '-h --help' -d 'Show this help message and exit' -n "__fish_seen_subcommand_from -m"
complete -c borgmatic -f -n "$exact_option_condition" -a '--mount-point' -d 'Path of filesystem to unmount' -n "__fish_seen_subcommand_from umount"
complete -c borgmatic -Fr -n "__borgmatic_current_arg --mount-point"
complete -c borgmatic -f -n "$exact_option_condition" -a '-h --help' -d 'Show this help message and exit' -n "__fish_seen_subcommand_from umount"
complete -c borgmatic -f -n "$exact_option_condition" -a '--mount-point' -d 'Path of filesystem to unmount' -n "__fish_seen_subcommand_from -u"
complete -c borgmatic -Fr -n "__borgmatic_current_arg --mount-point"
complete -c borgmatic -f -n "$exact_option_condition" -a '-h --help' -d 'Show this help message and exit' -n "__fish_seen_subcommand_from -u"
complete -c borgmatic -f -n "$exact_option_condition" -a '--repository' -d 'Path of repository to restore from, defaults to the configured repository if there is only one' -n "__fish_seen_subcommand_from restore"
complete -c borgmatic -f -n "$exact_option_condition" -a '--archive' -d 'Name of archive to restore from (or "latest")' -n "__fish_seen_subcommand_from restore"
complete -c borgmatic -x -n "__borgmatic_current_arg --archive"
complete -c borgmatic -f -n "$exact_option_condition" -a '--data-source --database' -d 'Name of data source (e.g. database) to restore from archive, must be defined in borgmatic'"'"'s configuration, can specify flag multiple times, defaults to all data sources in the archive' -n "__fish_seen_subcommand_from restore"
complete -c borgmatic -f -n "$exact_option_condition" -a '--schema' -d 'Name of schema to restore from the data source, can specify flag multiple times, defaults to all schemas. Schemas are only supported for PostgreSQL and MongoDB databases' -n "__fish_seen_subcommand_from restore"
complete -c borgmatic -f -n "$exact_option_condition" -a '--hostname' -d 'Database hostname to restore to. Defaults to the "restore_hostname" option in borgmatic'"'"'s configuration' -n "__fish_seen_subcommand_from restore"
complete -c borgmatic -f -n "$exact_option_condition" -a '--port' -d 'Database port to restore to. Defaults to the "restore_port" option in borgmatic'"'"'s configuration' -n "__fish_seen_subcommand_from restore"
complete -c borgmatic -f -n "$exact_option_condition" -a '--username' -d 'Username with which to connect to the database. Defaults to the "restore_username" option in borgmatic'"'"'s configuration' -n "__fish_seen_subcommand_from restore"
complete -c borgmatic -f -n "$exact_option_condition" -a '--password' -d 'Password with which to connect to the restore database. Defaults to the "restore_password" option in borgmatic'"'"'s configuration' -n "__fish_seen_subcommand_from restore"
complete -c borgmatic -f -n "$exact_option_condition" -a '--restore-path' -d 'Path to restore SQLite database dumps to. Defaults to the "restore_path" option in borgmatic'"'"'s configuration' -n "__fish_seen_subcommand_from restore"
complete -c borgmatic -f -n "$exact_option_condition" -a '-h --help' -d 'Show this help message and exit' -n "__fish_seen_subcommand_from restore"
complete -c borgmatic -f -n "$exact_option_condition" -a '--repository' -d 'Path of repository to restore from, defaults to the configured repository if there is only one' -n "__fish_seen_subcommand_from -r"
complete -c borgmatic -f -n "$exact_option_condition" -a '--archive' -d 'Name of archive to restore from (or "latest")' -n "__fish_seen_subcommand_from -r"
complete -c borgmatic -x -n "__borgmatic_current_arg --archive"
complete -c borgmatic -f -n "$exact_option_condition" -a '--data-source --database' -d 'Name of data source (e.g. database) to restore from archive, must be defined in borgmatic'"'"'s configuration, can specify flag multiple times, defaults to all data sources in the archive' -n "__fish_seen_subcommand_from -r"
complete -c borgmatic -f -n "$exact_option_condition" -a '--schema' -d 'Name of schema to restore from the data source, can specify flag multiple times, defaults to all schemas. Schemas are only supported for PostgreSQL and MongoDB databases' -n "__fish_seen_subcommand_from -r"
complete -c borgmatic -f -n "$exact_option_condition" -a '--hostname' -d 'Database hostname to restore to. Defaults to the "restore_hostname" option in borgmatic'"'"'s configuration' -n "__fish_seen_subcommand_from -r"
complete -c borgmatic -f -n "$exact_option_condition" -a '--port' -d 'Database port to restore to. Defaults to the "restore_port" option in borgmatic'"'"'s configuration' -n "__fish_seen_subcommand_from -r"
complete -c borgmatic -f -n "$exact_option_condition" -a '--username' -d 'Username with which to connect to the database. Defaults to the "restore_username" option in borgmatic'"'"'s configuration' -n "__fish_seen_subcommand_from -r"
complete -c borgmatic -f -n "$exact_option_condition" -a '--password' -d 'Password with which to connect to the restore database. Defaults to the "restore_password" option in borgmatic'"'"'s configuration' -n "__fish_seen_subcommand_from -r"
complete -c borgmatic -f -n "$exact_option_condition" -a '--restore-path' -d 'Path to restore SQLite database dumps to. Defaults to the "restore_path" option in borgmatic'"'"'s configuration' -n "__fish_seen_subcommand_from -r"
complete -c borgmatic -f -n "$exact_option_condition" -a '-h --help' -d 'Show this help message and exit' -n "__fish_seen_subcommand_from -r"
complete -c borgmatic -f -n "$exact_option_condition" -a '--repository' -d 'Path of repository to list, defaults to the configured repositories' -n "__fish_seen_subcommand_from rlist"
complete -c borgmatic -f -n "$exact_option_condition" -a '--short' -d 'Output only archive names' -n "__fish_seen_subcommand_from rlist"
complete -c borgmatic -f -n "$exact_option_condition" -a '--format' -d 'Format for archive listing' -n "__fish_seen_subcommand_from rlist"
complete -c borgmatic -f -n "$exact_option_condition" -a '--json' -d 'Output results as JSON' -n "__fish_seen_subcommand_from rlist"
complete -c borgmatic -f -n "$exact_option_condition" -a '-a --match-archives --glob-archives' -d 'Only list archive names matching this pattern' -n "__fish_seen_subcommand_from rlist"
complete -c borgmatic -x -n "__borgmatic_current_arg -a --match-archives --glob-archives"
complete -c borgmatic -f -n "$exact_option_condition" -a '--sort-by' -d 'Comma-separated list of sorting keys' -n "__fish_seen_subcommand_from rlist"
complete -c borgmatic -x -n "__borgmatic_current_arg --sort-by"
complete -c borgmatic -f -n "$exact_option_condition" -a '--first' -d 'List first N archives after other filters are applied' -n "__fish_seen_subcommand_from rlist"
complete -c borgmatic -x -n "__borgmatic_current_arg --first"
complete -c borgmatic -f -n "$exact_option_condition" -a '--last' -d 'List last N archives after other filters are applied' -n "__fish_seen_subcommand_from rlist"
complete -c borgmatic -x -n "__borgmatic_current_arg --last"
complete -c borgmatic -f -n "$exact_option_condition" -a '--oldest' -d 'List archives within a specified time range starting from the timestamp of the oldest archive (e.g. 7d or 12m) [Borg 2.x+ only]' -n "__fish_seen_subcommand_from rlist"
complete -c borgmatic -f -n "$exact_option_condition" -a '--newest' -d 'List archives within a time range that ends at timestamp of the newest archive and starts a specified time range ago (e.g. 7d or 12m) [Borg 2.x+ only]' -n "__fish_seen_subcommand_from rlist"
complete -c borgmatic -f -n "$exact_option_condition" -a '--older' -d 'List archives that are older than the specified time range (e.g. 7d or 12m) from the current time [Borg 2.x+ only]' -n "__fish_seen_subcommand_from rlist"
complete -c borgmatic -f -n "$exact_option_condition" -a '--newer' -d 'List archives that are newer than the specified time range (e.g. 7d or 12m) from the current time [Borg 2.x+ only]' -n "__fish_seen_subcommand_from rlist"
complete -c borgmatic -f -n "$exact_option_condition" -a '-h --help' -d 'Show this help message and exit' -n "__fish_seen_subcommand_from rlist"
complete -c borgmatic -f -n "$exact_option_condition" -a '--repository' -d 'Path of repository containing archive to list, defaults to the configured repositories' -n "__fish_seen_subcommand_from list"
complete -c borgmatic -f -n "$exact_option_condition" -a '--archive' -d 'Name of the archive to list (or "latest")' -n "__fish_seen_subcommand_from list"
complete -c borgmatic -f -n "$exact_option_condition" -a '--path' -d 'Path or pattern to list from a single selected archive (via "--archive"), can specify flag multiple times, defaults to listing the entire archive' -n "__fish_seen_subcommand_from list"
complete -c borgmatic -Fr -n "__borgmatic_current_arg --path"
complete -c borgmatic -f -n "$exact_option_condition" -a '--find' -d 'Partial path or pattern to search for and list across multiple archives, can specify flag multiple times' -n "__fish_seen_subcommand_from list"
complete -c borgmatic -Fr -n "__borgmatic_current_arg --find"
complete -c borgmatic -f -n "$exact_option_condition" -a '--short' -d 'Output only path names' -n "__fish_seen_subcommand_from list"
complete -c borgmatic -f -n "$exact_option_condition" -a '--format' -d 'Format for file listing' -n "__fish_seen_subcommand_from list"
complete -c borgmatic -f -n "$exact_option_condition" -a '--json' -d 'Output results as JSON' -n "__fish_seen_subcommand_from list"
complete -c borgmatic -f -n "$exact_option_condition" -a '-a --match-archives --glob-archives' -d 'Only list archive names matching this pattern' -n "__fish_seen_subcommand_from list"
complete -c borgmatic -x -n "__borgmatic_current_arg -a --match-archives --glob-archives"
complete -c borgmatic -f -n "$exact_option_condition" -a '--sort-by' -d 'Comma-separated list of sorting keys' -n "__fish_seen_subcommand_from list"
complete -c borgmatic -x -n "__borgmatic_current_arg --sort-by"
complete -c borgmatic -f -n "$exact_option_condition" -a '--first' -d 'List first N archives after other filters are applied' -n "__fish_seen_subcommand_from list"
complete -c borgmatic -x -n "__borgmatic_current_arg --first"
complete -c borgmatic -f -n "$exact_option_condition" -a '--last' -d 'List last N archives after other filters are applied' -n "__fish_seen_subcommand_from list"
complete -c borgmatic -x -n "__borgmatic_current_arg --last"
complete -c borgmatic -f -n "$exact_option_condition" -a '-e --exclude' -d 'Exclude paths matching the pattern' -n "__fish_seen_subcommand_from list"
complete -c borgmatic -x -n "__borgmatic_current_arg -e --exclude"
complete -c borgmatic -f -n "$exact_option_condition" -a '--exclude-from' -d 'Exclude paths from exclude file, one per line' -n "__fish_seen_subcommand_from list"
complete -c borgmatic -Fr -n "__borgmatic_current_arg --exclude-from"
complete -c borgmatic -f -n "$exact_option_condition" -a '--pattern' -d 'Include or exclude paths matching a pattern' -n "__fish_seen_subcommand_from list"
complete -c borgmatic -f -n "$exact_option_condition" -a '--patterns-from' -d 'Include or exclude paths matching patterns from pattern file, one per line' -n "__fish_seen_subcommand_from list"
complete -c borgmatic -Fr -n "__borgmatic_current_arg --patterns-from"
complete -c borgmatic -f -n "$exact_option_condition" -a '-h --help' -d 'Show this help message and exit' -n "__fish_seen_subcommand_from list"
complete -c borgmatic -f -n "$exact_option_condition" -a '--repository' -d 'Path of repository containing archive to list, defaults to the configured repositories' -n "__fish_seen_subcommand_from -l"
complete -c borgmatic -f -n "$exact_option_condition" -a '--archive' -d 'Name of the archive to list (or "latest")' -n "__fish_seen_subcommand_from -l"
complete -c borgmatic -f -n "$exact_option_condition" -a '--path' -d 'Path or pattern to list from a single selected archive (via "--archive"), can specify flag multiple times, defaults to listing the entire archive' -n "__fish_seen_subcommand_from -l"
complete -c borgmatic -Fr -n "__borgmatic_current_arg --path"
complete -c borgmatic -f -n "$exact_option_condition" -a '--find' -d 'Partial path or pattern to search for and list across multiple archives, can specify flag multiple times' -n "__fish_seen_subcommand_from -l"
complete -c borgmatic -Fr -n "__borgmatic_current_arg --find"
complete -c borgmatic -f -n "$exact_option_condition" -a '--short' -d 'Output only path names' -n "__fish_seen_subcommand_from -l"
complete -c borgmatic -f -n "$exact_option_condition" -a '--format' -d 'Format for file listing' -n "__fish_seen_subcommand_from -l"
complete -c borgmatic -f -n "$exact_option_condition" -a '--json' -d 'Output results as JSON' -n "__fish_seen_subcommand_from -l"
complete -c borgmatic -f -n "$exact_option_condition" -a '-a --match-archives --glob-archives' -d 'Only list archive names matching this pattern' -n "__fish_seen_subcommand_from -l"
complete -c borgmatic -x -n "__borgmatic_current_arg -a --match-archives --glob-archives"
complete -c borgmatic -f -n "$exact_option_condition" -a '--sort-by' -d 'Comma-separated list of sorting keys' -n "__fish_seen_subcommand_from -l"
complete -c borgmatic -x -n "__borgmatic_current_arg --sort-by"
complete -c borgmatic -f -n "$exact_option_condition" -a '--first' -d 'List first N archives after other filters are applied' -n "__fish_seen_subcommand_from -l"
complete -c borgmatic -x -n "__borgmatic_current_arg --first"
complete -c borgmatic -f -n "$exact_option_condition" -a '--last' -d 'List last N archives after other filters are applied' -n "__fish_seen_subcommand_from -l"
complete -c borgmatic -x -n "__borgmatic_current_arg --last"
complete -c borgmatic -f -n "$exact_option_condition" -a '-e --exclude' -d 'Exclude paths matching the pattern' -n "__fish_seen_subcommand_from -l"
complete -c borgmatic -x -n "__borgmatic_current_arg -e --exclude"
complete -c borgmatic -f -n "$exact_option_condition" -a '--exclude-from' -d 'Exclude paths from exclude file, one per line' -n "__fish_seen_subcommand_from -l"
complete -c borgmatic -Fr -n "__borgmatic_current_arg --exclude-from"
complete -c borgmatic -f -n "$exact_option_condition" -a '--pattern' -d 'Include or exclude paths matching a pattern' -n "__fish_seen_subcommand_from -l"
complete -c borgmatic -f -n "$exact_option_condition" -a '--patterns-from' -d 'Include or exclude paths matching patterns from pattern file, one per line' -n "__fish_seen_subcommand_from -l"
complete -c borgmatic -Fr -n "__borgmatic_current_arg --patterns-from"
complete -c borgmatic -f -n "$exact_option_condition" -a '-h --help' -d 'Show this help message and exit' -n "__fish_seen_subcommand_from -l"
complete -c borgmatic -f -n "$exact_option_condition" -a '--repository' -d 'Path of repository to show info for, defaults to the configured repository if there is only one' -n "__fish_seen_subcommand_from rinfo"
complete -c borgmatic -f -n "$exact_option_condition" -a '--json' -d 'Output results as JSON' -n "__fish_seen_subcommand_from rinfo"
complete -c borgmatic -f -n "$exact_option_condition" -a '-h --help' -d 'Show this help message and exit' -n "__fish_seen_subcommand_from rinfo"
complete -c borgmatic -f -n "$exact_option_condition" -a '--repository' -d 'Path of repository containing archive to show info for, defaults to the configured repository if there is only one' -n "__fish_seen_subcommand_from info"
complete -c borgmatic -f -n "$exact_option_condition" -a '--archive' -d 'Name of archive to show info for (or "latest")' -n "__fish_seen_subcommand_from info"
complete -c borgmatic -f -n "$exact_option_condition" -a '--json' -d 'Output results as JSON' -n "__fish_seen_subcommand_from info"
complete -c borgmatic -f -n "$exact_option_condition" -a '-a --match-archives --glob-archives' -d 'Only show info for archive names matching this pattern' -n "__fish_seen_subcommand_from info"
complete -c borgmatic -x -n "__borgmatic_current_arg -a --match-archives --glob-archives"
complete -c borgmatic -f -n "$exact_option_condition" -a '--sort-by' -d 'Comma-separated list of sorting keys' -n "__fish_seen_subcommand_from info"
complete -c borgmatic -x -n "__borgmatic_current_arg --sort-by"
complete -c borgmatic -f -n "$exact_option_condition" -a '--first' -d 'Show info for first N archives after other filters are applied' -n "__fish_seen_subcommand_from info"
complete -c borgmatic -x -n "__borgmatic_current_arg --first"
complete -c borgmatic -f -n "$exact_option_condition" -a '--last' -d 'Show info for last N archives after other filters are applied' -n "__fish_seen_subcommand_from info"
complete -c borgmatic -x -n "__borgmatic_current_arg --last"
complete -c borgmatic -f -n "$exact_option_condition" -a '--oldest' -d 'Show info for archives within a specified time range starting from the timestamp of the oldest archive (e.g. 7d or 12m) [Borg 2.x+ only]' -n "__fish_seen_subcommand_from info"
complete -c borgmatic -f -n "$exact_option_condition" -a '--newest' -d 'Show info for archives within a time range that ends at timestamp of the newest archive and starts a specified time range ago (e.g. 7d or 12m) [Borg 2.x+ only]' -n "__fish_seen_subcommand_from info"
complete -c borgmatic -f -n "$exact_option_condition" -a '--older' -d 'Show info for archives that are older than the specified time range (e.g. 7d or 12m) from the current time [Borg 2.x+ only]' -n "__fish_seen_subcommand_from info"
complete -c borgmatic -f -n "$exact_option_condition" -a '--newer' -d 'Show info for archives that are newer than the specified time range (e.g. 7d or 12m) from the current time [Borg 2.x+ only]' -n "__fish_seen_subcommand_from info"
complete -c borgmatic -f -n "$exact_option_condition" -a '-h --help' -d 'Show this help message and exit' -n "__fish_seen_subcommand_from info"
complete -c borgmatic -f -n "$exact_option_condition" -a '--repository' -d 'Path of repository containing archive to show info for, defaults to the configured repository if there is only one' -n "__fish_seen_subcommand_from -i"
complete -c borgmatic -f -n "$exact_option_condition" -a '--archive' -d 'Name of archive to show info for (or "latest")' -n "__fish_seen_subcommand_from -i"
complete -c borgmatic -f -n "$exact_option_condition" -a '--json' -d 'Output results as JSON' -n "__fish_seen_subcommand_from -i"
complete -c borgmatic -f -n "$exact_option_condition" -a '-a --match-archives --glob-archives' -d 'Only show info for archive names matching this pattern' -n "__fish_seen_subcommand_from -i"
complete -c borgmatic -x -n "__borgmatic_current_arg -a --match-archives --glob-archives"
complete -c borgmatic -f -n "$exact_option_condition" -a '--sort-by' -d 'Comma-separated list of sorting keys' -n "__fish_seen_subcommand_from -i"
complete -c borgmatic -x -n "__borgmatic_current_arg --sort-by"
complete -c borgmatic -f -n "$exact_option_condition" -a '--first' -d 'Show info for first N archives after other filters are applied' -n "__fish_seen_subcommand_from -i"
complete -c borgmatic -x -n "__borgmatic_current_arg --first"
complete -c borgmatic -f -n "$exact_option_condition" -a '--last' -d 'Show info for last N archives after other filters are applied' -n "__fish_seen_subcommand_from -i"
complete -c borgmatic -x -n "__borgmatic_current_arg --last"
complete -c borgmatic -f -n "$exact_option_condition" -a '--oldest' -d 'Show info for archives within a specified time range starting from the timestamp of the oldest archive (e.g. 7d or 12m) [Borg 2.x+ only]' -n "__fish_seen_subcommand_from -i"
complete -c borgmatic -f -n "$exact_option_condition" -a '--newest' -d 'Show info for archives within a time range that ends at timestamp of the newest archive and starts a specified time range ago (e.g. 7d or 12m) [Borg 2.x+ only]' -n "__fish_seen_subcommand_from -i"
complete -c borgmatic -f -n "$exact_option_condition" -a '--older' -d 'Show info for archives that are older than the specified time range (e.g. 7d or 12m) from the current time [Borg 2.x+ only]' -n "__fish_seen_subcommand_from -i"
complete -c borgmatic -f -n "$exact_option_condition" -a '--newer' -d 'Show info for archives that are newer than the specified time range (e.g. 7d or 12m) from the current time [Borg 2.x+ only]' -n "__fish_seen_subcommand_from -i"
complete -c borgmatic -f -n "$exact_option_condition" -a '-h --help' -d 'Show this help message and exit' -n "__fish_seen_subcommand_from -i"
complete -c borgmatic -f -n "$exact_option_condition" -a '--repository' -d 'Path of repository to break the lock for, defaults to the configured repository if there is only one' -n "__fish_seen_subcommand_from break-lock"
complete -c borgmatic -f -n "$exact_option_condition" -a '-h --help' -d 'Show this help message and exit' -n "__fish_seen_subcommand_from break-lock"
complete -c borgmatic -f -n "$exact_option_condition" -a '-h --help' -d 'Show this help message and exit' -n "__fish_seen_subcommand_from key"
complete -c borgmatic -f -n "$exact_option_condition" -a '' -d '' -n "__fish_seen_subcommand_from key"
complete -c borgmatic -f -a 'export' -n "__borgmatic_current_arg "
complete -c borgmatic -f -n "$exact_option_condition" -a '--repository' -d 'Path of repository to pass to Borg, defaults to the configured repositories' -n "__fish_seen_subcommand_from borg"
complete -c borgmatic -f -n "$exact_option_condition" -a '--archive' -d 'Name of archive to pass to Borg (or "latest")' -n "__fish_seen_subcommand_from borg"
complete -c borgmatic -f -n "$exact_option_condition" -a '--' -d 'Options to pass to Borg, command first ("create", "list", etc). "--" is optional. To specify the repository or the archive, you must use --repository or --archive instead of providing them here.' -n "__fish_seen_subcommand_from borg"
complete -c borgmatic -x -n "__borgmatic_current_arg --"
complete -c borgmatic -f -n "$exact_option_condition" -a '-h --help' -d 'Show this help message and exit' -n "__fish_seen_subcommand_from borg"
