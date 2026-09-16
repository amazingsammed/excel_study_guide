# Cell References: Relative and Absolute

References tell Excel which cells a formula should use. How a reference behaves
when you copy the formula depends on the `$` signs.

## Relative references (default)

`A1` is relative. When you copy the formula, the reference shifts by the same
distance as the formula moved.

```
A1 contains: =B1*C1
Copy to A2:  =B2*C2   (row increased by 1)
```

## Absolute references

`$A$1` is absolute. The column and row are locked and never change when copied.

```
A1 contains: =B1*$C$1
Copy to A2:  =B2*$C$1   (C1 stays locked)
```

## Mixed references

You can lock just the column or just the row.

| Reference | Column | Row | Example use |
| --- | --- | --- | --- |
| `A1` | moves | moves | Normal relative |
| `$A$1` | locked | locked | Fixed constant |
| `$A1` | locked | moves | Same column, different rows |
| `A$1` | moves | locked | Same row, different columns |

## Why it matters

A common task is applying a percentage or tax rate to a whole column. Lock the
rate once and copy the formula down.

```
B2: =A2*$E$1     (E1 holds the tax rate)
B3: =A3*$E$1
B4: =A4*$E$1
```

## Cycling the `$` signs

With the cursor on a reference, press `F4` repeatedly to cycle:

```
A1  ->  $A$1  ->  A$1  ->  $A1  ->  A1
```

## Key takeaways

- No `$` = relative, it moves when copied.
- `$` locks the row and/or column.
- Press `F4` to add or remove `$` signs quickly.

> **Practice:** Put a price in `A2` and a tax rate in `$E$1`. Write `=A2*$E$1`
> and copy it down a column of prices.
