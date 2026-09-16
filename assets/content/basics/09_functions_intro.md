# Introduction to Functions

A **function** is a ready-made formula that performs a calculation for you.
Functions save time and reduce mistakes.

## Syntax

```
=FUNCTIONNAME(argument1, argument2, ...)
```

- The name is not case-sensitive (`SUM` and `sum` both work).
- Arguments are separated by commas (or semicolons in some regional settings).
- Arguments can be numbers, cell references, ranges, text, or other formulas.

## Common functions

| Function | What it does | Example |
| --- | --- | --- |
| `SUM` | Adds values | `=SUM(A1:A10)` |
| `AVERAGE` | Mean of values | `=AVERAGE(A1:A10)` |
| `COUNT` | Counts numbers | `=COUNT(A1:A10)` |
| `MAX` / `MIN` | Largest / smallest | `=MAX(A1:A10)` |
| `IF` | Returns one of two results | `=IF(A1>10,"High","Low")` |

## Entering a function

1. Type `=` then the first letters of the function name.
2. A dropdown appears – press `Tab` to accept, or double-click.
3. Excel shows the argument names as a hint.
4. Type or select the arguments and press Enter.

## The Function Wizard

Click **fx** next to the formula bar to open the Insert Function dialog. It lists
every function and describes each argument.

## Nesting functions

Functions can be used inside other functions.

```
=IF(AVERAGE(A1:A5)>50,"Pass","Fail")
=ROUND(SUM(A1:A5),2)
```

## Key takeaways

- Functions begin with `=` and use `NAME(arguments)`.
- Arguments are separated by commas.
- `SUM`, `AVERAGE`, `COUNT`, `MAX`, `MIN` and `IF` are the ones to learn first.

> **Practice:** Enter five numbers in `A1:A5`, then use `=SUM(A1:A5)`,
> `=AVERAGE(A1:A5)` and `=MAX(A1:A5)` in nearby cells.
