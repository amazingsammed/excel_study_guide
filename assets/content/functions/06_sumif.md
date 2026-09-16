# SUMIF and SUMIFS

`SUMIF` adds values that meet **one** condition. `SUMIFS` adds values that meet
**several** conditions.

## Syntax

```
=SUMIF(range, criteria, [sum_range])
=SUMIFS(sum_range, criteria_range1, criteria1, [criteria_range2, criteria2], ...)
```

Note the difference in argument order:

- `SUMIF` puts the **sum range last**.
- `SUMIFS` puts the **sum range first**.

## Examples

Data: `B` holds region, `C` holds amount.

```
=SUMIF(B2:B100, "North", C2:C100)
```

Adds every amount where the region is North.

```
=SUMIFS(C2:C100, B2:B100, "North", D2:D100, ">100")
```

Adds amounts where region is North **and** the value in D is above 100.

## Criteria patterns

| Criteria | Matches |
| --- | --- |
| `"North"` | Exactly North |
| `">100"` | Greater than 100 |
| `"<>North"` | Not North |
| `"N*"` | Starts with N |
| `">="&A1` | Compares to a cell value |

## Using a cell as criteria

```
=SUMIF(B2:B100, E1, C2:C100)          E1 holds the region to match
=SUMIF(C2:C100, ">"&E1)               E1 holds the threshold
```

## Key takeaways

- `SUMIF` = one condition; `SUMIFS` = many.
- Watch the argument order – it flips between the two.
- Use `&` to build criteria from a cell.

> **Practice:** Create a table of regions and sales, then total the sales for one
> region with `SUMIF`.
