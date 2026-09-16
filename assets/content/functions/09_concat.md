# CONCAT and Text Joining

`CONCAT` joins several pieces of text into one string. It replaces the older
`CONCATENATE` function.

## Syntax

```
=CONCAT(text1, [text2], ...)
```

You can also use the `&` operator, which does the same thing.

## Examples

Assume `A1` = `John`, `B1` = `Smith`.

| Formula | Result |
| --- | --- |
| `=CONCAT(A1,B1)` | JohnSmith |
| `=CONCAT(A1," ",B1)` | John Smith |
| `=A1 & " " & B1` | John Smith |
| `=CONCAT("Total: ", C1)` | Total: 250 |

## Adding spaces and punctuation

Spaces must be included as text in quotes.

```
=A1 & ", " & B1 & " (" & C1 & ")"
```

## Joining with TEXT

Numbers keep their raw value when joined. Use `TEXT` to format them.

```
=CONCAT("Total: ", TEXT(C1,"$#,##0.00"))
```

## TEXTJOIN for ranges

`TEXTJOIN` joins a whole range with a separator and can skip blanks.

```
=TEXTJOIN(", ", TRUE, A1:A10)
```

- First argument = delimiter.
- `TRUE` = ignore empty cells.

## Key takeaways

- `CONCAT` (or `&`) joins text and values.
- Include spaces explicitly inside quotes.
- `TEXTJOIN` is best for joining a range with a separator.

> **Practice:** Put a first and last name in two cells and combine them with a
> space using `&`.
