# Screenshots for the guides

- How the screenshots in `docs/assets/` were made, so the next update takes minutes, not hours.
- Xbox One / Series: drive a console in Dev Mode from your PC and capture its screen.
- PC: run the Windows installer and the launcher on a virtual display, so nothing appears on your desktop.

Everything here runs on Linux. The scripts take `SHOT_DISPLAY` (default `:77`) and `XBOX` (default `10.0.0.77`).

## Xbox One / Xbox Series

The console must be in Dev Mode with the Device Portal on (Dev Home, **Remote Access Settings**). Everything goes through the portal at `https://<console>:11443`.

- **Screenshots:** `GET /ext/screenshot?download=true` returns the TV picture as a 1920x1080 PNG.
- **Input:** `xbox_input.js` sends key presses over the `/ext/remoteinput` WebSocket. Each message is three bytes: `0x01`, a Windows virtual key code, and `1` (down) or `0` (up).
- **Dev Home and system menus** accept the gamepad key codes (`a` = `0xC3`, `b`, `menu` = `0xCF`, `view` = `0xD0`, D-pad `0xCB` to `0xCE`). In Dev Home, enter the app list with `ddown`, open an app's menu with `view`.
- **The game ignores these keys**, because it reads the real controller. The setup screen before the game does take `enter`.
- **To press buttons inside the game**, upload a file `test-pad.txt` holding a hex button mask to the app's `LocalState` folder (`POST /api/filesystem/apps/file?knownfolderid=LocalAppData&packagefullname=<package>&path=%5CLocalState`). The game holds those buttons for 250 ms and deletes the file. Masks: A `1000`, B `2000`, X `4000`, Y `8000`, Start `10`, Back `20`, D-pad `1` to `8`. Back plus Start (`30`) opens the Avatar window.
- **Web pages on the console** (game file upload on port 8080, Avatar page on port 8081) can be driven with any browser automation, for example [Playwright](https://playwright.dev).
- **Install and uninstall** go through the portal's **Add** button or `/api/app/packagemanager/package`. The app type (Game or App) can only be changed on the console, in Dev Home under **View details**.

Example: open the app menu of the first app in Dev Home and save the screen.

```
node xbox_input.js menu.png ddown*3 ddown view
```

The exact presses depend on what Dev Home has focused. Take a screenshot after each step.

## PC

You need [Xvfb](https://www.x.org/releases/current/doc/man/man1/Xvfb.1.xhtml) (`dnf install xorg-x11-server-Xvfb`), xdotool and ImageMagick. Start a virtual display first:

```
Xvfb :77 -screen 0 1920x1080x24 -nolisten tcp &
```

### Windows installer

1. `wine_setup.sh` creates a Wine prefix with the Aero theme, smooth fonts and a user named `Player`.
2. Run the installer inside a Wine desktop, which draws the themed window frames:

    ```
    WINEPREFIX=~/.cache/1vs100-docs-wine USER=Player wine explorer /desktop=shot,1920x1080 1vs100-setup.exe &
    ```

3. Press keys with `DISPLAY=:77 xdotool key Return` and save each page with `capture.sh page.png`.

The launcher stays black under Wine, so take its screenshots from the Linux build.

### Launcher

1. Extract the Linux build and copy (or link) the game files into its `content` folder.
2. Start the launcher so it shows `/home/player/1vs100` instead of your own path:

    ```
    SHOT_LINKS_TO=/path/the/content/links/point/to run_as_player.sh ~/Downloads/1vs100 ./launcher &
    ```

3. Use `click.sh <x> <y> out.png` with coordinates inside the launcher window (tabs are at y=138: Player x=57, Avatar 131, Settings 211, Files 285).
4. Type with `DISPLAY=:77 xdotool type "QuizFan"`.

Things that do not work on the virtual display:

- **File pickers** (Open file..., Set folder...) never draw. To show a loaded Avatar, put the file at `userdata/profiles/avatar.bin` and restart the launcher.
- **Typing a long Avatar code** loses characters. Use the file instead.
- **The game** draws its first frames, then aborts. The title screen in the guides comes from the Xbox, which shows the same screen.

The launcher saves the gamertag only when you press Launch, so it is gone after a restart.

## Cropping

`capture.sh` crops to everything that differs from the background. For the Xbox screenshots, crop by hand and leave out anything personal, such as the test account email in Dev Home and the Device Portal.
