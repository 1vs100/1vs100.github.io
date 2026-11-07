# Game files

The game needs packages from your own copy of 1 vs 100. They are the **same files on every platform**: one copy, checked once, works on Xbox 360, Xbox One / Series and PC. This project never ships them.

## What you need

- **Xbox 360:** the game, the launch package, and all show and episode packages: the first 10 rows of the table.
- **PC and Xbox One / Series:** the same 10 packages, plus the Avatar pack (either of the last two rows). The Xbox 360 has its own Avatar data instead.

The Avatar pack comes from Xbox 360 System Update 17559 ([download](https://archive.org/details/xbox-360-system-update-17559-cd-usb)).

## File table

The file name of each package is its content id, with **no extension**. It ends in `58`.

| Package | Language | File name | SHA-256 |
|---|---|---|---|
| 1 vs 100 game | All | `2D23F392B51E38B1A93FA1E1B9FAE7B2C5DBBD6D58` | `48b869edbb84966934e3dfa350c64d2b9940f00813f3337707997f5f8cbf9180` |
| Launch package | All | `988237803712CB87513237A914D367C6AAEE241058` | `2ed2424e8890af3c6d115d351de4c6933e6bb61dfbac6418c39c0e06170e63d8` |
| Show | English | `77205BC1241C708A8A10B7303AF90E5EDD0286B158` | `a5d957cbcd75df198953a2299606eba54b37746e4ce1d877e5e1aa42848b9dcb` |
| Show | English | `7BEC809CCC282E8C9D18EFAD8F4407AA6204DFC858` | `119e053d95c30d4fa4834695df2081b6bcecc5736eb99c13f869aad51973921e` |
| Show | French | `79E60F7D68C480ABF11E8834A947B6D77E9AACD858` | `0c5354f057090745c4d1f3fd6de68e95142026c2ea0392d79ebeedd51f8d7d5b` |
| Show | German | `9AF84C64F8D3C775A4C4C35F97674500FCF507A658` | `15a35d299d6407e4e67c9044420f2070de9bda67b695c68f3f2a7c6b96bfe915` |
| Episode | English | `83136FF343124795DC1806A2DB044476589BD5C058` | `55828a8d8f1ad7fbf36299074f474bdb0c24d5ec034fae6993323d5287754e75` |
| Episode | English | `B30A40EE667432FA68559FA37B929C29E7985E5658` | `025122310aa92aebf3d2b03a758f25a5ac5d2c9b40a66b8ec3e6aede9284ed63` |
| Episode | French | `C965577112F783E8E7F33E8C957263E03DEDB7F758` | `a70aeb4a214d53a69e93ca9c81046f52390d1f877359b66fc09df232d460ef94` |
| Episode | German | `FA6873618900F1613CD72C0FCA3C4B57C8BB02E858` | `d2652a491fbb4c8fe74c5c46b7fb022f6d903a6bb65172598d7ac0f582666bbf` |
| Avatar pack (PC, Xbox One / Series) | All | `FFFE07DF00000002` | `9dcef5b4cc309eafee50c8ec2b0453e2d835d776f667269ecb2c4d11d93cd8d6` |
| or: Avatar pack table | All | `AvatarAssetPack.toc` | `a8c90b3db5c6349a55fcb72eda47e08e4940f88fabda4ff73025d9728832daa8` |

Your files may be named without the trailing `58`. Add it on Xbox 360. PC and Xbox One / Series accept both.

## Check every file before you use it

A wrong or half-copied package fails later in confusing ways. Compare each file's SHA-256 checksum with the table:

- On Windows, in PowerShell: `Get-FileHash <file>`
- On Linux: `sha256sum <file>`
- On macOS, in Terminal: `shasum -a 256 <file>`

The checksum must match exactly. If it does not, find another copy of that package. Do not continue with a file that does not match.

PC and Xbox One / Series check the files for you. The Xbox 360 does not, so check them on your computer before you copy them.

!!! warning "Windows hides file extensions"
    In File Explorer, turn on **View > Show > File name extensions** before you rename anything. A file that secretly ends in `.bin` is ignored by the console.

## Where they go

- **Xbox 360:** see [Xbox 360 setup](xbox-360.md#3-copy-the-game-packages).
- **PC:** in the launcher's `content` folder, see [PC setup](pc.md#3-add-your-game-files).
- **Xbox One / Series:** you send them to the console on the first start, see [Xbox One / Xbox Series setup](xbox-one-series.md#7-send-your-game-files).

---
**Next:** [Xbox 360 setup](xbox-360.md), [PC setup](pc.md), [Xbox One / Xbox Series setup](xbox-one-series.md) or the [FAQ](faq.md).
