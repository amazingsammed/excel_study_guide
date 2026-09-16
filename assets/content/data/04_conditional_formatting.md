# Conditional Formatting

Conditional formatting automatically changes a cell's appearance based on its
value. It is a fast way to spot trends, outliers and problems.

## Getting started

1. Select the range.
2. Go to **Home > Conditional Formatting**.
3. Pick a rule type.

## Rule types

| Type | Use |
| --- | --- |
| Highlight Cell Rules | Greater than, less than, between, equal to |
| Top/Bottom Rules | Top 10, above/below average |
| Data Bars | In-cell bar chart |
| Color Scales | Gradient from low to high |
| Icon Sets | Arrows, traffic lights, flags |
| New Rule | Build a custom formula rule |

## Examples

**Highlight values above 100:**

- Home > Conditional Formatting > Highlight Cell Rules > Greater Than > `100`.

**Colour scale on a column of scores:**

- Home > Conditional Formatting > Color Scales > Green-Yellow-Red.

**Formula rule – highlight entire row when status is "Late":**

```
=$C2="Late"
```

Use a relative row and an absolute column so the rule checks column C for every
row in the selection.

## Managing rules

**Conditional Formatting > Manage Rules** lets you:

- Edit or delete rules
- Change the order (rules at the top take priority)
- Stop a rule from applying if a previous rule is true

## Key takeaways

- Conditional formatting reacts to values automatically.
- Data bars, colour scales and icon sets are visual summaries.
- Formula rules give you complete control, e.g. `=$C2="Late"`.

> **Practice:** Apply a colour scale to a column of numbers, then add a rule that
> turns any value below 0 red.
