# ~/.dotfiles

Personal dotfiles that are maintained using YADM and Ansible. YADM for retaining the user context configuration and
Ansible to retain the level system configuration and all the other shenanigans. These are highly personalized dotfiles.
Therefore, I would suggest them more as an inspiration for your own rather than just re-using them.

I hope they are helpful to someone, enjoy.

![swappy-20220402_173713](https://user-images.githubusercontent.com/27705384/161390417-93f7a233-2dd0-4128-94a2-b8919e110470.png)

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
