# ~/.dotfiles

YADM and Ansible maintained personal dotfiles. YADM keeps the user context(~/) configuration up to date, and Ansible
retains the system configuration, packages, and other shenanigans. Since the dotfiles are highly personalized, they are
not meant to be cloned and re-used. So instead, look around and see if you can find something useful for yourself.
Enjoy.

![swappy-20220402_173713](https://user-images.githubusercontent.com/27705384/161390417-93f7a233-2dd0-4128-94a2-b8919e110470.png)

## Some tools that I use:

- [sway](https://github.com/swaywm/sway) (window manager) + [waybar](https://github.com/Alexays/Waybar) (status bar)
- [kitty](https://github.com/kovidgoyal/kitty) - fast GPU-accelerated terminal
- [fish-shell](https://fishshell.com/) + [starship](https://starship.rs/) and various other plugins.
- [yubikey-touch-detector](https://github.com/maximbaz/yubikey-touch-detector) - a tool that can detect when your YubiKey is waiting for a touch.
- [browserpass](https://github.com/browserpass/browserpass-extension) - browser extension for `pass` and `gopass`.
- [wluma](https://github.com/maximbaz/wluma) - automatic brightness adjustment based on screen contents.
- [wl-clipboard-manager](https://github.com/maximbaz/wl-clipboard-manager) - clipboard manager for Wayland.
- [ttf-joypixels](https://www.archlinux.org/packages/community/any/ttf-joypixels/) - latest JoyPixels font that provides colorful emojis for almost all apps on Linux (formerly EmojiOne).
- [yadm](https://yadm.io/) - dotfile manager.
- [ansible](https://www.ansible.com/) - as system level dotfile manager.
- [yay](https://github.com/Jguer/yay) - pacman/aur wrapper.
- [ranger](https://github.com/ranger/ranger) - file manager.

## Usage:

1. Follow
   my [Arch installation guide (Dell XPS13 9300)](https://gist.github.com/mordax7/50337dab53770893dd93b4738507b48e).
2. Bootstrap system:

```bash
# Switch to personal user
su - <username>

# With YADM download the dotfiles and bootstrap the system
yadm clone https://github.com/mordax7/dotfiles.git -f
yadm bootstrap

# Exit and reboot
exit
umount -R /mnt
reboot
```
