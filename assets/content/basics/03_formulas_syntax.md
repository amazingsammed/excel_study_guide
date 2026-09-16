# Formulas and Syntax

A **formula** is an instruction that tells Excel to calculate a result. Every
formula starts with an equals sign `=`.

## The rule

```
= something to calculate
```

If you leave out the `=`, Excel stores what you typed as plain text.

## Simple examples

| Formula | Result | Meaning |
| --- | --- | --- |
| `=2+3` | 5 | Add two numbers |
| `=A1+A2` | sum of cells | Add the values in cells |
| `=A1*2` | double | Multiply a cell by 2 |
| `=(A1+A2)/2` | average | Use parentheses to group |

## Referring to cells

Type `=` and then click a cell to insert its address automatically. This is
safer than typing addresses by hand.

```
=A1+B1
=A1*B1
=A1-B1
=A1/B1
```

## Order of operations

Excel follows standard maths order: **parentheses, exponents, multiplication and
division, then addition and subtraction**.

```
=2+3*4      -> 14   (3*4 first)
=(2+3)*4    -> 20   (parentheses first)
```

## Editing and error checking

- Double-click a cell (or press `F2`) to edit it in place.
- Press `Esc` to cancel an edit.
- Common errors:

| Error | Usually means |
| --- | --- |
| `#DIV/0!` | Dividing by zero or an empty cell |
| `#VALUE!` | Wrong type of data in a calculation |
| `#REF!` | A referenced cell was deleted |
| `#NAME?` | Excel does not recognise a name or function |
| `#####` | Column is too narrow to show the number |

## Key takeaways

- Every formula begins with `=`.
- Use cell references instead of typed numbers so results update automatically.
- Parentheses control the order of calculation.

> **Practice:** In `A1` type `5`, in `A2` type `10`. In `A3` enter `=(A1+A2)*2`.
> The result should be `30`.
