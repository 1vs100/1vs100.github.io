# Xbox 360 setup

Play 1 vs 100 on your modded Xbox 360 against the community server. You copy a few files to the console, then start the game. It takes about 20 minutes once your game files are on your computer.

!!! tip "What you need"
    - An Xbox 360 that runs unsigned code (RGH or JTAG), with [DashLaunch](https://consolemods.org/wiki/Xbox_360:DashLaunch) installed.
    - The Avatar data on the console. See [Installing the Avatar Data](https://consolemods.org/wiki/Xbox_360:Updating_your_Firmware/en#Installing_the_Avatar_Data).
    - A profile on the console.
    - Your own game files: the game, the launch package and the show and episode packages. See the [file table](game-files.md#file-table). None of this is provided here.
    - A way to copy files to the console (a USB drive or FTP) and a file manager on it to start a program, for example Aurora or FreeStyle Dash.

Tested with game build 2.0.1149.0 and console system 2.0.17559.0.

## Steps

### 1. Download the loader

Download the zip file from the [download page](https://github.com/1vs100/1vs100-reborn-x360/releases) and unzip it. It holds three files:

- `launcher.xex`: starts the game
- `1vs100Reborn.xex`: connects the game to the community server
- `1vs100Reborn.ini`: the settings. They are already set for the community server, so you don't need to change anything.

### 2. Check your game files

On your computer, check every package against the [file table](game-files.md#file-table):

- The SHA-256 checksum must match exactly ([how to check](game-files.md#check-every-file-before-you-use-it)).
- The file name must be the content id from the table, ending in `58`, with no extension. Rename files that are missing the `58`.

### 3. Copy the game packages

Copy all game packages to this folder on the console hard drive:

```
Hdd:\Content\0000000000000000\584A07D1\00000002\
```

For example, the game itself goes here:

```
Hdd:\Content\0000000000000000\584A07D1\00000002\2D23F392B51E38B1A93FA1E1B9FAE7B2C5DBBD6D58
```

### 4. Copy the loader

1. On the console hard drive, create a folder, for example `Hdd:\Games\1vs100Reborn`.
2. Copy `launcher.xex` into it and rename it to `default.xex`.
3. Copy `1vs100Reborn.xex` and `1vs100Reborn.ini` into the same folder.

### 5. Start the game

1. Sign in with your profile on the **first controller**.
2. Start `default.xex` from your file manager.
3. The game starts by itself.

✅ **Checkpoint:** you land in the game lobby and can join a show. If a message appears instead, see [If something goes wrong](#if-something-goes-wrong).

## Updating

Download the new zip, then replace `default.xex` (the renamed `launcher.xex`) and `1vs100Reborn.xex` on the console. Keep your `1vs100Reborn.ini` unless the download notes say otherwise.

## If something goes wrong

The loader shows a message at the top of the screen, then goes back to the dashboard.

| Message | What to do |
|---|---|
| sign in a profile first | Sign in on the **first controller**, then start `default.xex` again. |
| avatar data is not installed on this console | Install the Avatar data, see [Installing the Avatar Data](https://consolemods.org/wiki/Xbox_360:Updating_your_Firmware/en#Installing_the_Avatar_Data). |
| 1vs100Reborn.xex not found | Copy `1vs100Reborn.xex` into the same folder as `default.xex`. |
| the sysdll could not be loaded (DashLaunch?) | Check that DashLaunch is installed and runs when the console starts. |
| the backend host in 1vs100Reborn.ini did not resolve | The console cannot reach the internet. Check its network connection. |
| 1vs100Reborn.ini is incomplete or invalid | Replace `1vs100Reborn.ini` with the one from the download. |

**No message, but the game does not start:** the game package is missing or has the wrong name. Check that `2D23F392B51E38B1A93FA1E1B9FAE7B2C5DBBD6D58` is in the folder from [step 3](#3-copy-the-game-packages), with exactly that name.

Still stuck? Ask on [Discord](https://discord.gg/tV3ajhwFTf). To include a log, open `1vs100Reborn.ini`, change `sink=off` to `sink=file` and start the game again. The log files are in `Hdd:\1vs100Reborn\logs`.

---
**Next:** see you on air. More help: [FAQ](faq.md).
