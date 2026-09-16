# AND, OR and NOT

These logical functions return `TRUE` or `FALSE` and are usually combined with
`IF` to test several conditions.

## Syntax

```
=AND(condition1, condition2, ...)
=OR(condition1, condition2, ...)
=NOT(condition)
```

## How they behave

| Function | Returns TRUE when |
| --- | --- |
| `AND` | **All** conditions are true |
| `OR` | **At least one** condition is true |
| `NOT` | Its condition is false |

## Examples

| Formula | Result |
| --- | --- |
| `=AND(5>3, 2>1)` | TRUE |
| `=AND(5>3, 2>5)` | FALSE |
| `=OR(5>3, 2>5)` | TRUE |
| `=NOT(5>3)` | FALSE |

## With IF

```
=IF(AND(A1>=60,B1>=60),"Pass","Fail")
=IF(OR(A1="Yes",B1="Yes"),"Approve","Review")
=IF(NOT(A1=""),"Has value","Empty")
```

## Practical uses

- Require several conditions before approving a record.
- Flag rows where any check fails.
- Combine with `COUNTIFS` / `SUMIFS` logic for complex rules.

## Truth table

| A | B | A AND B | A OR B |
| --- | --- | --- | --- |
| TRUE | TRUE | TRUE | TRUE |
| TRUE | FALSE | FALSE | TRUE |
| FALSE | TRUE | FALSE | TRUE |
| FALSE | FALSE | FALSE | FALSE |

## Key takeaways

- `AND` needs every condition to be true.
- `OR` needs only one.
- `NOT` flips a result.

> **Practice:** In `C1` write `=IF(AND(A1>0,B1>0),"Valid","Check")` and test with
> different values.
