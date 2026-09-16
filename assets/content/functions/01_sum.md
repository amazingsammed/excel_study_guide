# SUM

`SUM` adds numbers together. It is the most used function in Excel.

## Syntax

```
=SUM(number1, [number2], ...)
```

Arguments can be numbers, cell references, ranges, or a mix.

## Examples

| Formula | Result |
| --- | --- |
| `=SUM(1,2,3)` | 6 |
| `=SUM(A1:A10)` | Adds the column |
| `=SUM(A1,B1,C1)` | Adds three separate cells |
| `=SUM(A1:A5,C1:C5)` | Adds two ranges |

## Adding quickly without a formula

Select the numbers and look at the **status bar** – Excel shows the sum, average
and count automatically. Or press `Alt + =` to insert `=SUM(...)` for the cells
above or to the left.

## SUM with a condition

`SUM` itself cannot filter, but `SUMIF` and `SUMIFS` can:

```
=SUMIF(B2:B10, "North", C2:C10)          sum where region is North
=SUMIFS(C2:C10, B2:B10, "North", D2:D10, ">100")
```

## Common errors

- Text that looks like a number is ignored (it must be a real number).
- `#VALUE!` means a referenced cell contains text that cannot be added.
- `SUM` ignores blank cells and logical values in ranges.

## Key takeaways

- `=SUM(range)` is the fastest way to total a column.
- `Alt + =` inserts an AutoSum formula.
- Use `SUMIF` / `SUMIFS` when you need conditions.

> **Practice:** Enter 10 numbers in `A1:A10` and total them with `=SUM(A1:A10)`.
