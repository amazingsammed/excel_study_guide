# Number Formats

Number formatting controls how a value is displayed. The underlying value never
changes – only its appearance.

## Common formats

| Format | `1234.5` displays as |
| --- | --- |
| General | 1234.5 |
| Number (2 decimals) | 1,234.50 |
| Currency | $1,234.50 |
| Accounting | `$   1,234.50` |
| Percentage | 123450.00% |
| Date | varies by locale |
| Text | left-aligned, treated as text |

## Quick buttons on the Home tab

| Button | Result |
| --- | --- |
| `$` | Currency format |
| `%` | Percent format |
| `,` | Thousands separator |
| `.00` | Increase decimal places |
| `.0` | Decrease decimal places |

## The Format Cells dialog

Press `Ctrl + 1`, then choose the **Number** tab for full control:

- Decimal places
- Use 1000 separator
- Negative number style
- Currency symbol and position

## Percentages

A percentage is stored as a decimal. `50%` is really `0.5`. If you type `0.5` and
apply the percent format, it shows `50%`.

## Custom formats

You can build custom codes using symbols:

```
0.00        two decimals
#,##0       thousands separator, no decimals
$#,##0.00   currency with two decimals
0%          whole-number percent
```

## Key takeaways

- Formatting changes display, not the stored value.
- `Ctrl + 1` opens the full number formatting dialog.
- Percentages are decimals underneath – `50%` equals `0.5`.

> **Practice:** Enter `0.25`, apply the percent format, then reduce it to zero
> decimal places so it shows `25%`.
