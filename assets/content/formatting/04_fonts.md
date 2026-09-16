# Fonts

Fonts control the typeface, size, and style of text and numbers.

## Font settings

| Setting | Example | Where |
| --- | --- | --- |
| Font family | Calibri, Arial | Home > Font box |
| Font size | 11, 14, 20 | Home > Font Size |
| Bold | **Bold** | `Ctrl + B` |
| Italic | *Italic* | `Ctrl + I` |
| Underline | Underline | `Ctrl + U` |
| Strikethrough | ~~Strike~~ | Font dialog |

Open the full dialog with `Ctrl + Shift + F` for extra options such as
superscript, subscript and double underline.

## Increasing and decreasing size

| Shortcut | Action |
| --- | --- |
| `Ctrl + Shift + >` | Grow font |
| `Ctrl + Shift + <` | Shrink font |

## Merging text without merging cells

Excel's `CONCAT` function joins text from several cells into one, which is often
better than merging because formulas can still read every cell.

```
=A1 & " " & B1
=CONCAT(A1, " ", B1)
```

## Best practices

- Use one or two fonts per workbook.
- Use bold for headings instead of large font sizes.
- Keep body text between 10 and 12 points for readability.

## Key takeaways

- `Ctrl + B`, `Ctrl + I`, `Ctrl + U` toggle bold, italic and underline.
- `Ctrl + Shift + F` opens the full Format Cells > Font dialog.
- Prefer `CONCAT` or `&` over merging when you still need the original cells.

> **Practice:** Format a title in 18pt bold, and apply italic to a subtitle row.
