# Excel Study Guide — Google Play Store submission

This file is the working checklist and copy deck for the Google Play listing.
Replace every `[PLACEHOLDER]` before publishing.

---

## 1. App identity

| Field | Value |
| --- | --- |
| App name | **Excel Study Guide** |
| Package name | `com.trustmedia.excel_study_guide` |
| Version name | `1.0.0` |
| Version code | `1` |
| Category | **Education** |
| Tags | Excel, spreadsheet, tutorial, offline learning, productivity |
| Price | **Free** |
| Contains ads | **Yes** — Google AdMob banner ads |
| In-app purchases | **No** |
| Account required | **No** |
| Target audience | **13+** (recommended; not designed for children) |
| Content rating | **Everyone / 3+** (confirm with the Play questionnaire) |
| Support email | `[YOUR SUPPORT EMAIL]` |
| Developer website | `[YOUR WEBSITE, optional]` |
| Privacy policy URL | `https://telegra.ph/Privacy-Policy--Excel-Study-Guide-10-22` |

> **Package name warning:** `com.trustmedia.excel_study_guide` is permanent once the
> first release is published. Confirm it is the final ID before uploading.

---

## 2. Store listing copy

### App name (30 characters max)

```text
Excel Study Guide
```

### Short description (80 characters max)

Recommended:

```text
Learn Excel offline with 31 clear lessons, examples and quick quizzes.
```

Alternatives:

```text
Master Excel with bite-sized offline lessons, formulas and quizzes.
```

```text
Offline Excel guide: lessons, formulas, examples, bookmarks and quizzes.
```

### Full description (4,000 characters max)

```text
Learn Microsoft Excel at your own pace — completely offline.

Excel Study Guide is a practical, bite-sized study guide for anyone who wants
to feel confident in Excel. Every lesson is stored on your device, so you can
read, revise and practise without an internet connection.

WHAT YOU GET

• 31 short lessons across 4 categories
• 28 multiple-choice quiz questions with explanations
• Clear formula syntax and real examples
• Search across every topic and function
• Bookmark lessons for quick revision
• Track your best quiz score for each level
• Light, dark and system themes
• Adjustable text size

LESSONS THAT BUILD ON EACH OTHER

Excel Basics
Cells, ranges, entering data, editing, formulas, references, operators and
autofill — the foundation you need for everything else.

Formatting
Alignment, colours, fonts, borders and number formats so your spreadsheets
look clear and professional.

Data Analysis
Sorting, filtering, tables, conditional formatting and charts for turning raw
data into something useful.

Functions
SUM, AVERAGE, COUNT, MIN/MAX, IF, SUMIF, COUNTIF, VLOOKUP, CONCAT, LEFT,
RIGHT, TRIM, AND/OR and more, with syntax and worked examples.

BUILT FOR QUICK STUDY SESSIONS

Each topic is short enough to read on a coffee break. Quiz levels let you check
what you remember, with instant feedback and a short explanation after every
answer.

WORKS OFFLINE

No sign-in. No account. No connection needed. Your bookmarks, quiz scores and
appearance settings are stored locally on your device.

ABOUT ADS

This free app is supported by banner ads provided by Google AdMob. Ads help keep
the lessons free. You can learn more about how Google uses data in the privacy
policy linked on this page.

DISCLAIMER

Microsoft and Excel are trademarks of Microsoft Corporation. This app is an
independent study guide and is not affiliated with, endorsed by, or sponsored
by Microsoft.
```

### What's new / release notes (500 characters max)

```text
First release.

• 31 offline Excel lessons across 4 categories
• 28 quiz questions with explanations and best-score tracking
• Search, bookmarks, light/dark theme and adjustable text size
```

### Developer contact details

- Developer name: `[YOUR DEVELOPER NAME]`
- Support email: `[YOUR SUPPORT EMAIL]`
- Website: `[YOUR WEBSITE, optional]`
- Phone: `[OPTIONAL, not shown publicly unless you choose]`

---

## 3. Graphics and screenshots

### Required store assets

| Asset | Requirement | File |
| --- | --- | --- |
| App icon | 512 × 512 PNG, 32-bit, up to 1 MB | `screenshots/playstore/icon-512.png` |
| Feature graphic | 1024 × 500 PNG or JPEG | `screenshots/playstore/feature-graphic-1024x500.png` |
| Phone screenshots | 2–8 images, 320–3840 px per side, max 2:1 ratio | `screenshots/playstore/phone/` |
| Promo video | Optional, YouTube URL | `[OPTIONAL]` |

The generated phone screenshots are **1080 × 1920 (9:16)**, with the full UI
centred on a matching background. They contain no test ads. The original
unprocessed captures are in `screenshots/playstore/raw/`; use the `phone/`
versions for Google Play.

### Recommended screenshot order and captions

| # | File | Caption |
| --- | --- | --- |
| 1 | `phone/01_home.png` | Learn Excel offline |
| 2 | `phone/02_category.png` | 31 bite-sized lessons across 4 categories |
| 3 | `phone/03_topic.png` | Clear syntax, real examples and tables |
| 4 | `phone/04_quiz_levels.png` | Test yourself at your own level |
| 5 | `phone/06_quiz_feedback.png` | Instant feedback and explanations |
| 6 | `phone/07_bookmarks.png` | Save any topic for quick revision |
| 7 | `phone/10_home_dark.png` | Light and dark themes |
| 8 | `phone/09_onboarding.png` | Works completely offline |

Extra screenshots are also available:

- `phone/05_quiz_question.png`
- `phone/08_settings.png`

### Screenshot notes

- Capture clean screenshots without test ads. This project supports:
  ```bash
  flutter build apk --debug --dart-define=HIDE_ADS=true
  ```
- Use a release build for final screenshots if you prefer to show real ads, but
  avoid publishing screenshots with Google test creatives.
- Tablet screenshots are optional but recommended if you distribute to tablets.
  Good sizes are 1200 × 1920 (7-inch) and 1600 × 2560 (10-inch).
- The feature graphic says “OFFLINE • FREE”. Change the text there if the app
  stops being free or stops showing ads.

---

## 4. Store settings and declarations

### App category and tags

- Category: **Education**
- Tags: **Excel, spreadsheet, tutorial, offline learning**
- Contact email: `[YOUR SUPPORT EMAIL]`

### App access

Select: **All functionality is available without special access.**

There is no login, no paid content and no restricted area. Every screen can be
opened directly by anyone who installs the app.

### Ads declaration

Select: **Yes, my app contains ads.**

- Ad provider: Google AdMob
- Format: banner ads
- Placements: bottom of the main tab shell, end of a category list, bottom of
  the topic screen
- No interstitials, rewarded ads or native ads are used

### Content rating questionnaire

Use these answers for the current feature set:

| Question | Answer |
| --- | --- |
| Violence | No |
| Blood | No |
| Sexuality | No |
| Nudity | No |
| Profanity | No |
| Controlled substances | No |
| Gambling | No |
| User-generated content | No |
| User-to-user communication | No |
| Shares user location | No |
| Allows purchases | No |
| Contains ads | **Yes** |
| Is a news app | No |
| Is a government app | No |

Expected result: **Everyone / PEGI 3 / ESRB Everyone**. The final rating is
issued by the Play Console after the questionnaire.

### Target audience

Recommended: **13 years and older.**

Reason: the app is a general spreadsheet study guide and shows advertising.
Do **not** select an audience under 13 unless you are prepared to comply with
the Google Play Families policy and AdMob families requirements.

### Data safety form

The app itself stores bookmarks, quiz scores and display preferences locally.
The AdMob SDK may collect data for advertising and analytics. Declare this
accurately and make sure the privacy policy matches.

Recommended starting point:

| Question | Answer |
| --- | --- |
| Does your app collect or share required user data types? | **Yes** |
| Is all collected data encrypted in transit? | **Yes** |
| Do you provide a way for users to request data deletion? | **Yes** — contact email in the privacy policy |
| Is data collection optional? | **No** — ads are part of the free app |

Data types to review and declare:

| Data type | Collected | Shared | Purpose |
| --- | --- | --- | --- |
| Device or other IDs (advertising ID) | Yes | Yes | Advertising/marketing, analytics |
| Approximate location | Yes, via ad SDK | Yes | Advertising/marketing |
| App interactions (ad interactions) | Yes, via ad SDK | Yes | Advertising/marketing, analytics |
| Diagnostics (crash/performance) | Review AdMob SDK disclosure | Review | Analytics |

> AdMob’s exact data practices can change. Confirm the current disclosures in
> the AdMob/Google Play data safety documentation and mirror them here.
> If you do not collect crash logs yourself, do not declare a type unless the
> SDK actually collects it.

### Advertising ID

The app uses the Google Mobile Ads SDK, which uses the Android advertising ID.
Declare advertising ID usage in Play Console:

- Purpose: **Advertising or marketing**
- Also used for: **Analytics** (if you enable AdMob analytics)

### Permissions

The app’s own manifest declares:

- `android.permission.INTERNET` — required to request ads

The Google Mobile Ads SDK adds standard permissions in the merged manifest:

- `android.permission.ACCESS_NETWORK_STATE`
- `com.google.android.gms.permission.AD_ID`
- `android.permission.ACCESS_ADSERVICES_AD_ID`
- `android.permission.ACCESS_ADSERVICES_ATTRIBUTION`
- `android.permission.ACCESS_ADSERVICES_TOPICS`
- `android.permission.WAKE_LOCK`
- `android.permission.FOREGROUND_SERVICE`

No location, camera, microphone, contacts or storage permissions are
requested.

### Other declarations

- Government app: **No**
- Financial features: **No**
- Health features: **No**
- News app: **No**
- COVID-19 contact tracing: **No**
- Data deletion request URL/email: `[YOUR SUPPORT EMAIL]`

---

## 5. Privacy policy

**Live URL:** https://telegra.ph/Privacy-Policy--Excel-Study-Guide-10-22

A self-hosted copy is also in `docs/privacy-policy.html`. If you enable GitHub
Pages for this repository (Settings → Pages → Deploy from branch → `master` →
`/docs`), the permanent URL will be:

```text
https://amazingsammed.github.io/excel_study_guide/privacy-policy.html
```

The source text is below for future edits. Replace the placeholders if your
developer name or contact email changes.

```markdown
# Privacy Policy — Excel Study Guide

Effective date: [DATE]

[YOUR DEVELOPER NAME] ("we", "us") provides the Excel Study Guide mobile app
("the App"). This policy explains what information is handled when you use the
App.

## Information stored on your device

The App stores the following locally on your device:

- topics you bookmark
- your best quiz scores
- your theme and text-size preferences
- whether you have completed onboarding

This information is not sent to us and is removed when you uninstall the App
or clear the App's data.

## Advertising

The App is free and supported by banner ads provided by Google AdMob. Google
and its partners may collect and use information such as device identifiers,
advertising ID, approximate location, app interactions and diagnostics to
provide, measure and improve advertising.

Google's privacy policy: https://policies.google.com/privacy

You can manage personalised advertising in your device's Google settings:
https://adssettings.google.com

## Children's privacy

The App is not directed to children under 13. We do not knowingly collect
personal information from children under 13. If you believe a child has
provided personal information, contact us and we will take appropriate action.

## Data deletion

You can delete locally stored data by uninstalling the App or clearing its data
in Android settings. For questions or deletion requests relating to advertising
data, contact us at [YOUR SUPPORT EMAIL].

## Third-party services

- Google AdMob — https://policies.google.com/privacy
- Google Play services — https://policies.google.com/privacy

## Changes

We may update this policy from time to time. The effective date at the top will
be updated when changes are made.

## Contact

[YOUR DEVELOPER NAME]
[YOUR SUPPORT EMAIL]
[YOUR WEBSITE, optional]
```

---

## 6. Release build and signing checklist

> **Important:** the current `android/app/build.gradle.kts` still signs release
> builds with the debug key. Replace that before uploading to Play.

### 6.1 Create an upload keystore

Run once and keep the file and passwords safe:

```bash
keytool -genkey -v \
  -keystore upload-keystore.jks \
  -keyalg RSA \
  -keysize 2048 \
  -validity 10000 \
  -alias upload
```

Store `upload-keystore.jks` outside the repository or in a path ignored by Git.

### 6.2 Add signing config

Create `android/key.properties` (never commit it):

```properties
storePassword=[KEYSTORE PASSWORD]
keyPassword=[KEY PASSWORD]
keyAlias=upload
storeFile=../upload-keystore.jks
```

Load it in `android/app/build.gradle.kts`, create a `release` signing config,
and use it for the release build type. Enrol in **Play App Signing** when
uploading so Google manages the final app-signing key.

### 6.3 Build the App Bundle

```bash
flutter build appbundle --release
```

Upload `build/app/outputs/bundle/release/app-release.aab`.

### 6.4 Verify before upload

- [ ] Version name/code updated in `pubspec.yaml`
- [ ] Release signed with the upload key, not the debug key
- [ ] `targetSdk` meets the current Play requirement
- [ ] 64-bit ARM build included (Flutter does this by default)
- [ ] Real AdMob Android app ID in `AndroidManifest.xml`
- [ ] Real Android ad unit IDs in `lib/ads/ad_ids.dart`
- [ ] Debug builds use test ads; release builds use production ads
- [ ] Test ads are not visible in screenshots
- [x] Privacy policy published and linked
      (`https://telegra.ph/Privacy-Policy--Excel-Study-Guide-10-22`)
- [ ] Data safety form completed
- [ ] Content rating completed
- [ ] Ads declaration completed
- [ ] App access completed
- [ ] Support email verified
- [ ] App name does not imply Microsoft endorsement

### 6.5 Testing tracks

1. **Internal testing** — upload the AAB and test with your own account.
2. **Closed testing** — new personal developer accounts must run a closed test
   with at least 12 testers for 14 days before production access.
3. **Production** — complete the rollout after the tracks above are approved.

---

## 7. AdMob checklist

- [ ] AdMob account created and payment details added
- [ ] Android app added with package `com.trustmedia.excel_study_guide`
- [ ] App ID `ca-app-pub-5034627120549852~3841427606` matches the manifest
- [ ] Banner units created for home, category, topic, quiz, bookmarks, settings
- [ ] Android unit IDs pasted into `lib/ads/ad_ids.dart`
- [ ] iOS app and unit IDs added before an iOS release
- [ ] Privacy policy URL added in AdMob
- [ ] Ads.txt setup reviewed if you use a custom domain
- [ ] No invalid traffic / no clicking your own live ads

---

## 8. Suggested internal naming

| Item | Suggestion |
| --- | --- |
| Release name | `1.0.0 — Initial release` |
| Release notes | See “What’s new” above |
| Track | Internal testing → Closed testing → Production |
| Rollout | 100% after testing |
| Countries | All countries, or choose your target markets |

---

## 9. Final submission checklist

### Store listing

- [ ] App name
- [ ] Short description
- [ ] Full description
- [ ] App icon 512 × 512
- [ ] Feature graphic 1024 × 500
- [ ] 2–8 phone screenshots
- [ ] Optional tablet screenshots
- [ ] Optional promo video
- [ ] Support email
- [ ] Privacy policy URL

### Policy and declarations

- [ ] Content rating
- [ ] Target audience
- [ ] Ads declaration
- [ ] Data safety
- [ ] App access
- [ ] Advertising ID declaration
- [ ] Government/financial/health/news declarations
- [ ] Families policy review (only if targeting children)

### Technical

- [ ] Release keystore and signing config
- [ ] `flutter build appbundle --release` succeeds
- [ ] Tested on a clean install
- [ ] Offline mode tested with airplane mode
- [ ] Ads load in release without test creatives
- [ ] No debug banners or test identifiers in release
- [ ] Crash-free smoke test on Android 13/14+

---

## 10. Trademark and disclaimer

“Microsoft” and “Excel” are trademarks of Microsoft Corporation. The store
listing must not imply that the app is an official Microsoft product.

Include this line in the full description and privacy policy:

```text
Microsoft and Excel are trademarks of Microsoft Corporation. This app is an
independent study guide and is not affiliated with, endorsed by, or sponsored
by Microsoft.
```

If Microsoft or Google flags the app name, a safer alternative is
**Spreadsheet Study Guide** or **Excel Skills Guide**. The package name cannot
be changed after publishing, so decide on the final name before the first
upload.
