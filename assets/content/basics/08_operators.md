# Operators and Parentheses

Operators are the symbols that tell Excel what to do with values.

## Arithmetic operators

| Operator | Meaning | Example | Result |
| --- | --- | --- | --- |
| `+` | Addition | `=5+3` | 8 |
| `-` | Subtraction | `=5-3` | 2 |
| `*` | Multiplication | `=5*3` | 15 |
| `/` | Division | `=6/3` | 2 |
| `^` | Exponent (power) | `=2^3` | 8 |
| `%` | Percent | `=50%` | 0.5 |

## Comparison operators

These return `TRUE` or `FALSE` and are mostly used inside functions like `IF`.

| Operator | Meaning |
| --- | --- |
| `=` | Equal to |
| `<>` | Not equal to |
| `>` | Greater than |
| `<` | Less than |
| `>=` | Greater than or equal to |
| `<=` | Less than or equal to |

## Text operator

The `&` symbol joins text together (concatenation).

```
="Hello " & "World"    ->  Hello World
=A1 & " " & B1         ->  joins two cells with a space
```

## Order of operations

Excel calculates in this order:

1. Parentheses `( )`
2. Exponents `^`
3. Multiplication and division `*` `/`
4. Addition and subtraction `+` `-`

```
=2+3*4      -> 14
=(2+3)*4    -> 20
=10-4/2     -> 8
=(10-4)/2   -> 3
```

## Key takeaways

- Use `^` for powers and `&` to join text.
- Comparison operators return `TRUE` or `FALSE`.
- Parentheses override the default order – use them for clarity.

> **Practice:** Enter `=2+3*4` and `=(2+3)*4` in two cells and compare the results.
