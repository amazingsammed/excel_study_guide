# LEFT, RIGHT, MID and TRIM

These text functions extract or clean up parts of a string.

## The functions

| Function | Returns |
| --- | --- |
| `LEFT(text, n)` | First `n` characters |
| `RIGHT(text, n)` | Last `n` characters |
| `MID(text, start, n)` | `n` characters from position `start` |
| `TRIM(text)` | Text with extra spaces removed |
| `LEN(text)` | Number of characters |

## Examples

Assume `A1` = `Excel-2026`.

| Formula | Result |
| --- | --- |
| `=LEFT(A1,5)` | Excel |
| `=RIGHT(A1,4)` | 2026 |
| `=MID(A1,7,4)` | 2026 |
| `=LEN(A1)` | 10 |
| `=TRIM("  hi  ")` | hi |

## Combining with FIND

`FIND` locates a character so you can extract a variable-length piece.

```
=LEFT(A1, FIND("-",A1)-1)              text before the dash
=MID(A1, FIND("-",A1)+1, 100)          text after the dash
```

## Cleaning imported data

`TRIM` removes leading, trailing and repeated internal spaces – very useful after
pasting data from other systems.

```
=TRIM(A1)
=UPPER(TRIM(A1))
=PROPER(TRIM(A1))
```

| Function | Effect |
| --- | --- |
| `UPPER` | ALL CAPITALS |
| `LOWER` | all lower case |
| `PROPER` | First Letter Of Each Word |

## Key takeaways

- `LEFT`, `RIGHT`, `MID` extract characters.
- `TRIM` cleans up spacing.
- Combine with `FIND` to split text at a character.

> **Practice:** Put `Excel-2026` in `A1` and extract `Excel` and `2026` into two
> other cells.
