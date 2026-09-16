# COUNT, COUNTA and COUNTBLANK

These functions tell you **how many** cells match a condition. Choosing the right
one matters.

## The family

| Function | Counts |
| --- | --- |
| `COUNT` | Cells containing numbers |
| `COUNTA` | Non-empty cells (numbers, text, errors) |
| `COUNTBLANK` | Empty cells |
| `COUNTIF` | Cells matching one condition |
| `COUNTIFS` | Cells matching several conditions |

## Syntax

```
=COUNT(range)
=COUNTA(range)
=COUNTBLANK(range)
=COUNTIF(range, criteria)
```

## Examples

Assume `A1:A5` = `10, "apple", blank, 20, "10"`.

| Formula | Result | Why |
| --- | --- | --- |
| `=COUNT(A1:A5)` | 2 | Only real numbers (10, 20) |
| `=COUNTA(A1:A5)` | 4 | Everything that is not blank |
| `=COUNTBLANK(A1:A5)` | 1 | The single empty cell |
| `=COUNTIF(A1:A5,"apple")` | 1 | Text match |

## Counting with conditions

```
=COUNTIF(B2:B100, "North")          count North rows
=COUNTIF(C2:C100, ">50")            count values above 50
=COUNTIFS(B2:B100,"North",C2:C100,">50")
```

> Tip: a value stored as text (for example `"10"`) is counted by `COUNTA` but not
> by `COUNT`.

## Key takeaways

- `COUNT` = numbers only; `COUNTA` = anything not empty.
- `COUNTBLANK` finds gaps in your data.
- Use `COUNTIF` / `COUNTIFS` to count with conditions.

> **Practice:** Fill `A1:A5` with a mix of numbers, text and a blank, then compare
> `COUNT`, `COUNTA` and `COUNTBLANK`.
