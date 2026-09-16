# Tables

An Excel **Table** is a specially formatted range that automatically expands and
stays in sync with its data.

## Creating a table

1. Select your data (including headers).
2. Go to **Insert > Table** (`Ctrl + T`).
3. Confirm the range and tick **My table has headers**.

## Benefits of tables

| Benefit | What it means |
| --- | --- |
| Auto-expand | New rows/columns join the table automatically |
| Structured references | Use names like `Sales[Amount]` in formulas |
| Built-in filters | Header dropdowns are always available |
| Banded rows | Readable alternating row colours |
| Total row | One-click sum, average, count |

## Structured references

Instead of `A2:A100`, a table named `Sales` lets you write:

```
=SUM(Sales[Amount])
=AVERAGE(Sales[Price])
=SUMIF(Sales[Region], "North", Sales[Amount])
```

These references adjust automatically as the table grows.

## Table Design tab

When you click inside a table, the **Table Design** tab appears:

- **Table Name** – rename it for easier references.
- **Table Styles** – choose a preset look.
- **Header Row / Total Row** – toggle these on and off.
- **Banded Rows / Columns** – alternating shading.

## Removing duplicates

**Data > Remove Duplicates** finds and removes repeated rows. Select which columns
define a duplicate, then confirm.

## Converting back to a range

**Table Design > Convert to Range** turns the table into ordinary cells. Filters
and formatting remain, but auto-expand and structured references stop working.

## Key takeaways

- `Ctrl + T` creates a table.
- Tables auto-expand and support readable structured references.
- Remove Duplicates is found on the Data tab.

> **Practice:** Turn a list into a table, add a **Total Row**, and use
> `=SUM(Table1[Amount])` in a nearby cell.
