for line in (systemctl --user show-environment)
    set -x $line | sed '0,/\=/{s/\=/ /}'
end

# Running from tty1 start sway
set TTY1 (tty)
if test -z "$DISPLAY"; and test $TTY1 = "/dev/tty1"
	systemd-cat -t sway sway
	systemctl --user stop sway-session.target
end
