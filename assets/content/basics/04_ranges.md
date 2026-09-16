# Ranges

A **range** is a rectangular block of cells. Ranges are how you tell Excel
"work with all of these cells at once".

## Writing a range

A range is written as `TopLeft:BottomRight`.

| Range | Meaning |
| --- | --- |
| `A1` | A single cell |
| `A1:A10` | Column A, rows 1 to 10 |
| `A1:C1` | Row 1, columns A to C |
| `A1:C10` | A 3-column by 10-row block |
| `A:A` | The entire column A |
| `1:1` | The entire row 1 |

## Selecting a range

- **Drag** from the first cell to the last.
- Click the first cell, hold `Shift`, then click the last cell.
- `Ctrl + A` selects the current data block; press again for the whole sheet.

## Named ranges

You can give a range a readable name and use it in formulas.

1. Select the range.
2. Click the Name Box, type a name such as `Scores`, press Enter.
3. Use it like a cell: `=SUM(Scores)`.

Named ranges make formulas easier to read and maintain.

## Using a range in a function

```
=SUM(A1:A10)
=AVERAGE(B1:B10)
=MAX(C1:C100)
```

## Key takeaways

- A range is written `first:last`.
- Functions accept ranges so you do not list every cell.
- Named ranges turn `=SUM(A1:A10)` into something readable like `=SUM(Scores)`.

> **Practice:** Enter numbers in `A1:A5`, then in `A6` type `=SUM(A1:A5)`. Change a
> number and watch the total update.
