# VLOOKUP

`VLOOKUP` searches for a value in the **first column** of a range and returns a
value from another column in the same row.

## Syntax

```
=VLOOKUP(lookup_value, table_array, col_index_num, [range_lookup])
```

| Argument | Meaning |
| --- | --- |
| lookup_value | What you are searching for |
| table_array | The range to search |
| col_index_num | Which column to return (1 = first column) |
| range_lookup | `FALSE` = exact match, `TRUE` = approximate |

## Exact match example

A price list in `A2:C100` with codes in column A and prices in column C:

```
=VLOOKUP("P100", A2:C100, 3, FALSE)
```

Returns the price for code `P100`. **Always use `FALSE` for exact matches.**

## Approximate match

With `TRUE`, the first column must be sorted ascending. Excel finds the largest
value that is less than or equal to the lookup value. This suits grade or tax
brackets.

```
=VLOOKUP(A2, Bands, 2, TRUE)
```

## Important rules

- The lookup value must be in the **leftmost** column of the table.
- `col_index_num` counts from the left of the table, starting at 1.
- Use `FALSE` unless you specifically need a bracket lookup.

## Handling missing values

```
=IFERROR(VLOOKUP(A2,B2:D100,3,FALSE),"Not found")
```

## Limitations

- Cannot look to the left. Use `XLOOKUP` or `INDEX` + `MATCH` for that.
- Inserting a column inside the table changes the column number.

## Key takeaways

- `VLOOKUP` = vertical lookup, searches the first column.
- Use `FALSE` for an exact match.
- Wrap in `IFERROR` to replace `#N/A` with a friendly message.

> **Practice:** Build a small product list and use `VLOOKUP` to pull the price for
> a product code typed in another cell.
