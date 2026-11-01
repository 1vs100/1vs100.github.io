# Game files

The game, show, and episode packages are the **same files on every
platform** — one copy, checked once, serves your Xbox 360 and your PC. This
project never ships them: they come from your own console and copy of the
game.

You only need the show and episode packages for **your** language, plus the
game and launch packages.

## Where they go

- **Xbox 360:** copy each package to
  `Hdd:\Content\0000000000000000\584A07D1\00000002\`, named with **only its
  content id, with no file extension**. See
  [Xbox 360 setup](xbox-360.md#3-copy-the-game-packages).
- **PC:** the game needs the stock retail files with their original scripts
  (see [PC setup](pc.md#1-install-your-game-files)); the show and episode
  packages are used in place through `content_install`, never extracted.

## Check every file before you use it

A wrong or half-copied package fails later in confusing ways. Compare each
file's SHA-256 checksum against the table:

- On Linux: `sha256sum <file>`
- On Windows: `certutil -hashfile <file> SHA256`

The checksum must match exactly. If it does not, find another copy — do not
continue with a mismatching file.

!!! warning "Windows hides file extensions"
    In File Explorer, turn on *View → Show → File name extensions* before
    renaming anything. A file named `77205BC…B1.bin` will be ignored by the
    console.

## File table

| Package | Language | Content id ( = file name) | SHA-256 |
|---|---|---|---|
| 1 vs 100 game | All | `2D23F392B51E38B1A93FA1E1B9FAE7B2C5DBBD6D58` | `48b869edbb84966934e3dfa350c64d2b9940f00813f3337707997f5f8cbf9180` |
| Launch package | All | `988237803712CB87513237A914D367C6AAEE2410` | `2ed2424e8890af3c6d115d351de4c6933e6bb61dfbac6418c39c0e06170e63d8` |
| Show | English | `77205BC1241C708A8A10B7303AF90E5EDD0286B1` | `a5d957cbcd75df198953a2299606eba54b37746e4ce1d877e5e1aa42848b9dcb` |
| Show | English | `7BEC809CCC282E8C9D18EFAD8F4407AA6204DFC8` | `119e053d95c30d4fa4834695df2081b6bcecc5736eb99c13f869aad51973921e` |
| Show | French | `79E60F7D68C480ABF11E8834A947B6D77E9AACD8` | `0c5354f057090745c4d1f3fd6de68e95142026c2ea0392d79ebeedd51f8d7d5b` |
| Show | German | `9AF84C64F8D3C775A4C4C35F97674500FCF507A6` | `15a35d299d6407e4e67c9044420f2070de9bda67b695c68f3f2a7c6b96bfe915` |
| Episode | English | `83136FF343124795DC1806A2DB044476589BD5C0` | `55828a8d8f1ad7fbf36299074f474bdb0c24d5ec034fae6993323d5287754e75` |
| Episode | English | `B30A40EE667432FA68559FA37B929C29E7985E56` | `025122310aa92aebf3d2b03a758f25a5ac5d2c9b40a66b8ec3e6aede9284ed63` |
| Episode | French | `C965577112F783E8E7F33E8C957263E03DEDB7F7` | `a70aeb4a214d53a69e93ca9c81046f52390d1f877359b66fc09df232d460ef94` |
| Episode | German | `FA6873618900F1613CD72C0FCA3C4B57C8BB02E8` | `d2652a491fbb4c8fe74c5c46b7fb022f6d903a6bb65172598d7ac0f582666bbf` |

---
**Next:** [Xbox 360 setup](xbox-360.md) · [PC setup](pc.md) · [FAQ](faq.md)
