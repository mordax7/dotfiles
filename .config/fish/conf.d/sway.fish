# Hacky workaround, probably have to change this in the future
for line in (systemctl --user show-environment)
    set command (echo $line | sed '0,/\=/{s/\=/ /}')
    set key (echo "$command" | awk '{print $1}')
    set value (echo "$command" | awk '{print $2}')
    set -x "$key" "$value"
end

set GPG_TTY "$TTY"
set SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/gnupg/S.gpg-agent.ssh"
systemctl --user import-environment GPG_TTY SSH_AUTH_SOCK

# Running from tty1 start sway
set TTY1 (tty)
if test -z "$DISPLAY"; and test $TTY1 = "/dev/tty1"
	systemd-cat -t sway sway
	systemctl --user stop sway-session.target
end
