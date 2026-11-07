# FAQ & troubleshooting

Quick answers to the problems players hit most. If yours is not here, ask on
[Discord](https://discord.gg/tV3ajhwFTf) — tell them what you were doing and
what you saw, roughly when it happened.

## The launcher shows an error (Xbox 360)

The launcher tells you what is missing — a file, a package, or a setting.
Re-check the step it names in [Xbox 360 setup](xbox-360.md), most often:

- `default.xex` (the renamed launcher), `1vs100Reborn.xex`, and
  `1vs100Reborn.ini` all in the same folder.
- Your profile signed in on the **first controller** before starting.
- The `[backend] host=` address in `1vs100Reborn.ini`.

## My checksum does not match the table

Find another copy of that package — do not continue with a mismatching file.
A wrong or half-copied package fails later in confusing ways. See
[how to check](game-files.md#check-every-file-before-you-use-it).

## The console ignores a package I copied

The file name must be **only** the content id, with no extension
(`77205BC…B1`, not `77205BC…B1.bin`). Windows hides extensions by default —
turn on *View → Show → File name extensions* and rename again.

## The game never connects to the server

- **Xbox 360:** the `host=` value in `1vs100Reborn.ini` must be the server's
  address on your network. The ports (`1000`, `1001`, `1002`) stay as shown
  unless your server host tells you otherwise.
- **PC:** in the launcher's **Settings** tab, the server must say `1vs100.fans`.
  Click **Reset** next to it to put it back.

## My PC Avatar is a default face

The game has no Avatar for you yet. Open the launcher's **Avatar** tab, bring
in your Avatar ([step 5](pc.md#5-choose-your-avatar)) and press **LAUNCH**,
which saves it.

## My Avatar's clothes look plain online

Other players see your marketplace clothes only if they own the same item —
everyone else sees a similar standard item instead. That is expected, not a
bug. If *you* see plain clothes on yourself, the game has no closet to
read them from: marketplace items only show when the same item is
installed for the catalog (`ONEVS100_AVATAR_CLOSET`).

## I played but I am not on the leaderboard

Players appear on the leaderboard only if they chose **Public** in the
game's privacy settings. The page never shows XUIDs or addresses.

## Do I need different game files for each platform?

No. The game, show, and episode packages are the same files on every
platform — one copy, checked against the
[file table](game-files.md#file-table), serves Xbox 360, PC, and
Xbox One / Series.

---
**Next:** back to [Xbox 360 setup](xbox-360.md) or [PC setup](pc.md) — or ask on [Discord](https://discord.gg/tV3ajhwFTf).
