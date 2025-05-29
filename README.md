# Linux Rice

## TODO:

- WM
- [x] Basics
    - [x] Workspaces
    - [x] Wallpaper
    - [x] Compositor
    - [ ] Tiles
    - [ ] Layout hotkeys
- Input
    - Keyboard
        - [x] Layout
        - [x] Caps &#8594; ESC
    - Touchpad
        - [x] Tapping
        - [ ] Speed
        - [ ] Gestures
- Bluetooh
    - [x] Base
    - [x] Audio
- Notifications
    - [x] Standard
    - [x] Battery
    - [ ] Disks
- Launcher
    - [x] dmenu
    - [ ] Fancy alternative to dmenu
    - [ ] Application search
- Status bar
    - [x] basics
    - [ ] Adjust icon inconsistencies
    - [ ] Applet handlers
- Terminal
    - [ ] Color scheme
    - [x] Copy / Paste actions
    - [x] Spacing
    - [x] Font
    - [x] Icons
    - [x] Shell
    - [x] Prompt
    - [ ] Scroll
- Power
    - [x] Screen lock
    - [ ] Lock and suspend on lid close
    - [x] TLP
    - [x] Dim or off screen after X
    - [x] Lock after Y

---

## WM - [bspwm]

Configured with the command line utility `bspc` or at `~/.config/bspwm`, since it's a shell script **MUST** have `x` permissions.

### Window information

- `xprop`: informs you about the selected window.

## Input

### Hotkeys - [sxhkd]

Configured at `~/.config/sxhkd/sxhkdrc`. While using `bspwm` will also serve as the WM hotkey manager.

### Touchpad

Both touchpad and mouse are managed directly with `xinput`. The touch motions, such as 3 finger swap or weird lateral movements, are manages with [libinput-gestures](https://github.com/bulletmark/libinput-gestures).

Basic configuration done at:

- `/etc/X11/xorg.conf.d/30-touchpad.conf`
- [DEPRECATED] `/etc/X11/xorg.conf.d/70-synaptics.conf`

Not yet used but there is an script with a simple example of live configuration at [github/dqnid/scripts](https://github.com/dqnid/Scripts/blob/main/System/ajustaTouchpad.sh).

## Sound - [pulseaudio]

The hotkeys call `pulseaudio-ctl`.

## Screen / Display

To manage display changes I use `x-on-resize` and a simple custom script.

### Dim on battery

To dim the screen on battery mode I use `acpid` and modify the file `/etc/acpi/handler.sh`.

**NOTE:** modify the case condition to match any `AC` o `AD`: `AC|ACAD|ADP0|AC*|AD*` (the 2 last ones alone cover everything but who cares).

### Lid close

The display management when the lid is closed is on the scrip side, but detecting that lid close to run the script is managed with `acpid`.

- The script run is `auto_xrandr.sh` but is copied into `/usr/bin` to allow easy access. Tried a symlink strategy but was clumsy and did not end up working.
- To avoid the system suspend I modified `/etc/systemd/logind.conf` to ignore `HandleLidSwitch` and `HandleLidSwitchExternalPower`.
- To allow running `x` programs, such as `xrandr`, inside the script y must define `DISPLAY` environment variable: `export DISPLAY=":0"`

## Screen lock

- `xset` to configure DPMS (display power management signaling). This will set the timeout for the lock.
- `xss-lock` to configure what actions will be ran once the timers set with `xset` end.
- [NOT USED] `xautolock` to configure the actual lock time. `xautolock -time 5 -locker "script" -detectsleep` will lock the screen after 5 minutes.
- `betterlockscreen` as the lock utility. `betterlockscreen -l -u ~/.config/wp` will lock the screen with the desired wallpaper, but it is better to launch it as `betterlockscreen -l -w` to use the cached image. Configured at `~/.config/betterlockscreen/betterlockscreenrc`.

## Notifications - [wired]

The notifications are listened and displayed by `wired`.

## Bluetooth - [bluez]

I'll use the main driver and a minimal approach. `blueberry` will be the GUI to manage everything.
To make the audio management easy (or at least working) im using `pipewire`. Did not configure anything tho.

- [ ] Create a simple rofi/eww widget to manage connections.

## Terminal - [st]

Switched back to st with a custom build. Configured at source file in `~/Packages/st`.

- [DEPRECATED] `urxvt` was configured at `~/.Xresources`, must be applied manually running `xrdb ~/.Xresources`. This means the file could be located elsewhere but kept there as default.

### Extensions

Written in PERL

## Tricks

- Scratchpad utility written in bash at `~/.config/utils/scratch`

## Arch utlities

- `pacman -Ssq name` : list every element of a group of packages
