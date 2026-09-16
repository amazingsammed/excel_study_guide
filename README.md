# Excel Study Guide

A Flutter app that teaches Microsoft Excel through short, offline-friendly
lessons. Everything — lessons, illustrations and quizzes — is bundled with the
app, so the guide works with no internet connection.

## Overview

Excel Study Guide is organised into four categories of bite-sized topics. Each
topic is a Markdown lesson rendered in a clean, selectable reader with
previous/next navigation. Users can bookmark lessons, search across all content,
test themselves with level-based quizzes, and personalise the theme and text
size.

## Features

- **Offline content** — 31 lessons across 4 categories, shipped as bundled
  Markdown assets. No network required.
- **Topic reader** — Markdown rendering with styled headings, code blocks,
  tables and blockquotes, plus Previous/Next navigation through the full reading
  order.
- **Search** — filter topics and functions by title, summary or category.
- **Bookmarks** — save any topic to a personal list (stored in SQLite) and open
  it again in one tap; swipe to remove.
- **Quizzes** — Beginner, Intermediate and Advanced levels (28 multiple-choice
  questions) with instant feedback, explanations, progress and a saved best
  score per level.
- **Personalisation** — System/Light/Dark theme and an adjustable text size,
  persisted between launches.
- **Onboarding** — a four-slide introduction shown on first launch and
  replayable from Settings.

## Content

| Category | Topics | Focus |
| --- | --- | --- |
| Excel Basics | 9 | Cells, ranges, formulas, references, operators |
| Formatting | 6 | Alignment, colours, fonts, borders, number formats |
| Data Analysis | 5 | Sort, filter, tables, conditional formatting, charts |
| Functions | 11 | SUM, AVERAGE, IF, VLOOKUP, COUNTIF and more |

Content lives in `assets/content` and is described by `manifest.json`
(categories and topics) and `quiz.json` (questions). Adding a lesson means
dropping a Markdown file into the matching folder and registering it in the
manifest.

## Tech stack

- **Flutter** (Material 3) with Dart SDK `^3.9.2`
- **GetX** for state management, navigation and dependency injection
- **flutter_markdown_plus** for lesson rendering
- **flutter_svg** for the bundled illustrations
- **sqflite** (with `sqflite_common_ffi` on desktop) for bookmark storage
- **shared_preferences** for theme, text size, onboarding and quiz scores

## Project structure

```
lib/
  app/            Theme, navigation helpers and category icons
  controllers/    Content, bookmarks, quiz, settings and shell state
  data/           SQLite database, bookmark and content repositories
  models/         Topic, bookmark, quiz question and quiz level models
  screens/        Onboarding, shell, home, category, topic, quiz, bookmarks, settings
  widgets/        Shared topic tile and empty state widgets
assets/
  content/        Markdown lessons, manifest.json and quiz.json
  images/         Onboarding, hero and empty-state SVG illustrations
test/             Widget and controller tests
```

## Getting started

Ensure the Flutter SDK is installed, then:

```bash
flutter pub get
flutter run
```

To build a release binary for a specific platform:

```bash
flutter build apk        # Android
flutter build windows    # Windows
```

## Tests

```bash
flutter test
```

The test suite covers the bottom navigation, the quiz flow, onboarding and the
bookmark controller (using an in-memory repository so native SQLite is not
required).
