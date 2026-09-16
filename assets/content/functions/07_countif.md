# COUNTIF and COUNTIFS

`COUNTIF` counts cells that meet **one** condition. `COUNTIFS` counts cells that
meet **several** conditions.

## Syntax

```
=COUNTIF(range, criteria)
=COUNTIFS(criteria_range1, criteria1, [criteria_range2, criteria2], ...)
```

## Examples

```
=COUNTIF(B2:B100, "North")        count rows where region is North
=COUNTIF(C2:C100, ">50")          count values above 50
=COUNTIF(A2:A100, "*")            count non-empty text cells
=COUNTIFS(B2:B100,"North",C2:C100,">50")
```

## Criteria patterns

| Criteria | Matches |
| --- | --- |
| `"North"` | Exact text |
| `">50"` | Numbers above 50 |
| `"<>"` | Cells that are not blank |
| `"*a*"` | Contains the letter a |
| `"???"` | Exactly three characters |
| `A1` | Compares to cell A1 |

## Wildcards

- `*` matches any number of characters.
- `?` matches a single character.

```
=COUNTIF(A2:A100, "N*")     text starting with N
=COUNTIF(A2:A100, "*son")   text ending in son
```

## Duplicate detection

A common trick flags duplicates:

```
=COUNTIF($A$2:$A$100, A2) > 1
```

Use it in conditional formatting to highlight repeated values.

## Key takeaways

- `COUNTIF` = one condition; `COUNTIFS` = many.
- Wildcards `*` and `?` allow pattern matching.
- Count duplicates by comparing a cell against its whole range.

> **Practice:** Enter a list of names and use `COUNTIF` to count how many times one
> name appears.
