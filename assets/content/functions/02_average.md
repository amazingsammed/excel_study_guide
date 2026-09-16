# AVERAGE

`AVERAGE` returns the arithmetic mean of a set of numbers.

## Syntax

```
=AVERAGE(number1, [number2], ...)
```

## Examples

| Formula | Result |
| --- | --- |
| `=AVERAGE(10,20,30)` | 20 |
| `=AVERAGE(A1:A10)` | Mean of the range |
| `=AVERAGE(A1:A5,C1:C5)` | Mean across two ranges |

## What AVERAGE ignores

`AVERAGE` counts only **numeric** cells. Blank cells, text and logical values in a
range are ignored, which can change the result.

If `A1:A4` contains `10, 20, blank, 30`, then `=AVERAGE(A1:A4)` returns `20`
because only three numbers are counted.

## Related functions

| Function | Purpose |
| --- | --- |
| `AVERAGE` | Mean, ignoring text and blanks |
| `AVERAGEA` | Includes text (as 0) and logical values |
| `AVERAGEIF` | Mean with one condition |
| `AVERAGEIFS` | Mean with several conditions |
| `MEDIAN` | Middle value |
| `MODE` | Most frequent value |

## Conditional averages

```
=AVERAGEIF(B2:B10, "North", C2:C10)          average for North
=AVERAGEIFS(C2:C10, B2:B10, "North", D2:D10, ">100")
```

## Key takeaways

- `AVERAGE` = total divided by count of numeric cells.
- Blanks and text are ignored – check for gaps in your data.
- `AVERAGEIF` / `AVERAGEIFS` add conditions.

> **Practice:** Enter five scores and compare `=AVERAGE(A1:A5)` with
> `=MEDIAN(A1:A5)`.
