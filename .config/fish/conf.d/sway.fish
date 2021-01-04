for line in (systemctl --user show-environment)
    set a (echo $line | sed '0,/\=/{s/\=/ /}')
    set -x $a
end

# Running from tty1 start sway
set TTY1 (tty)
if test -z "$DISPLAY"; and test $TTY1 = "/dev/tty1"
	systemd-cat -t sway sway
	systemctl --user stop sway-session.target
end
