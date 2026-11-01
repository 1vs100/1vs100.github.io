# Xbox 360 setup

Play 1 vs 100 on your modded Xbox 360 against the community server. You copy
a few files to the console, then start the game — about 20 minutes if your
files are already on your PC.

!!! tip "What you need"
    - An Xbox 360 that runs unsigned code (RGH or JTAG), with
      [DashLaunch](https://consolemods.org/wiki/Xbox_360:DashLaunch)
      installed, `xhttp` and `sockpatch` turned on.
    - The Avatar data on the console — see
      [Installing the Avatar Data](https://consolemods.org/wiki/Xbox_360:Updating_your_Firmware/en#Installing_the_Avatar_Data).
    - The 1 vs 100 game package plus the show and episode packages for your
      language (see the table below).
    - The `1vs100Reborn` files: `1vs100Launcher.xex`, `1vs100Reborn.xex`,
      and `1vs100Reborn.ini` (from the release archive).
    - A way to copy files to the console (USB drive or FTP).

Tested with game build 2.0.1149.0 and kernel 2.0.17559.0.

## Steps

### 1. Make a folder for the loader

On the console hard drive, create a folder, for example:

```
Hdd:\Games\1vs100Reborn
```

### 2. Copy the loader files into it

Copy these three files into that folder:

- `1vs100Launcher.xex` → rename it to `default.xex`
- `1vs100Reborn.xex`
- `1vs100Reborn.ini`

### 3. Copy the game packages

Copy the game package and the show/episode packages to:

```
Hdd:\Content\0000000000000000\584A07D1\00000002\
```

Each file must be named with **only its content id, with no file
extension**. Example:

```
Hdd:\Content\0000000000000000\584A07D1\00000002\77205BC1241C708A8A10B7303AF90E5EDD0286B1
```

!!! warning "Windows hides file extensions"
    Renaming on Windows? Read [Game files](game-files.md#check-every-file-before-you-use-it) first — a file secretly ending in `.bin` is ignored by the console.
### 4. Check every file before you copy it

Check each file's SHA-256 checksum against the [file table](game-files.md#file-table):

- On Linux: `sha256sum <file>`
- On Windows: `certutil -hashfile <file> SHA256`

The checksum must match exactly. If it does not, find another copy of that
package — do not continue with a mismatching file.

### 5. Point the loader at the server

Open `1vs100Reborn.ini` in a text editor and set the server address:

```ini
[backend]
host=192.168.1.10
sbg_port=1000
matchmaking_port=1001
mads_port=1002
```

Replace `192.168.1.10` with your community server's address. The ports stay
as shown unless your server host tells you otherwise.

### 6. Start the game

1. Sign in with your profile on the **first controller**.
2. Start `default.xex` from your file manager or dashboard.
3. The game starts by itself.

✅ **Checkpoint:** you land in the game lobby and can join a show. If the
launcher shows an error instead, it tells you what is missing — re-check
that step and try again.

The full list — with content ids, checksums, and which packages are the
same on PC — lives on [Game files](game-files.md).
---
**Next:** playing already? See you on air. Stuck anywhere? [FAQ](faq.md).
