# MIN, MAX, MEDIAN and MODE

These functions summarise a set of numbers by picking a representative value.

## The functions

| Function | Returns |
| --- | --- |
| `MIN` | Smallest number |
| `MAX` | Largest number |
| `MEDIAN` | Middle value when sorted |
| `MODE` | Most frequently occurring value |

## Syntax

```
=MIN(range)
=MAX(range)
=MEDIAN(range)
=MODE(range)      or MODE.SNGL in newer Excel
```

## Examples

For `A1:A7` = `4, 8, 15, 16, 23, 42, 8`:

| Formula | Result |
| --- | --- |
| `=MIN(A1:A7)` | 4 |
| `=MAX(A1:A7)` | 42 |
| `=MEDIAN(A1:A7)` | 15 |
| `=MODE(A1:A7)` | 8 |

## When to use each

- **MIN / MAX** – find the range and spot outliers.
- **MEDIAN** – a typical value that is not skewed by extremes (good for incomes
  or house prices).
- **MODE** – find the most common value (good for shoe sizes or survey answers).

## Combining with other functions

```
=MAX(A1:A10)-MIN(A1:A10)              range of values
=IF(A1=MAX(A1:A10),"Highest","")      flag the largest
=(A1-MIN(A1:A10))/(MAX(A1:A10)-MIN(A1:A10))   normalise to 0-1
```

## Key takeaways

- `MIN` and `MAX` give the extremes.
- `MEDIAN` is more robust than `AVERAGE` when there are outliers.
- `MODE` reports the most common value.

> **Practice:** Enter `4, 8, 15, 16, 23, 42, 8` in `A1:A7` and calculate `MIN`,
> `MAX`, `MEDIAN` and `MODE`.
