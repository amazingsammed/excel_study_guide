import 'package:flutter/foundation.dart';

/// A pair of banner ad unit IDs, one per mobile platform.
class AdUnitIds {
  const AdUnitIds({required this.android, required this.ios});

  final String android;
  final String ios;

  bool get isConfigured => android.isNotEmpty && ios.isNotEmpty;

  /// The unit ID for the platform the app is currently running on.
  String get current {
    if (kIsWeb) {
      return android;
    }
    return defaultTargetPlatform == TargetPlatform.iOS ? ios : android;
  }
}

/// Every AdMob identifier used by the app lives here.
///
/// The values below are Google's official **test** IDs, so banners work out of
/// the box. When you have created the real units in the AdMob console:
///
/// 1. Paste the real unit IDs into the matching [AdUnitIds] fields.
/// 2. Set [useTestAds] to `false`.
/// 3. Update the app IDs in:
///    - `android/app/src/main/AndroidManifest.xml`
///    - `ios/Runner/Info.plist`
///
/// Keep the Dart app IDs below in sync with the native files for reference.
class AdIds {
  AdIds._();

  // ---------------------------------------------------------------------------
  // AdMob application IDs (also required in the native manifests).
  // ---------------------------------------------------------------------------

  /// Used in `android/app/src/main/AndroidManifest.xml`.
  static const String androidAppId = 'ca-app-pub-3940256099942544~3347511713';

  /// Used in `ios/Runner/Info.plist`.
  static const String iosAppId = 'ca-app-pub-3940256099942544~1458002511';

  /// While true every placement uses Google's test banner, regardless of the
  /// production values below. Set this to `false` before shipping.
  static const bool useTestAds = true;

  // ---------------------------------------------------------------------------
  // Production banner units - replace the empty strings with your own IDs.
  // ---------------------------------------------------------------------------

  static const AdUnitIds homeBanner = AdUnitIds(android: '', ios: '');

  static const AdUnitIds categoryBanner = AdUnitIds(android: '', ios: '');

  static const AdUnitIds topicBanner = AdUnitIds(android: '', ios: '');

  static const AdUnitIds quizBanner = AdUnitIds(android: '', ios: '');

  static const AdUnitIds bookmarksBanner = AdUnitIds(android: '', ios: '');

  static const AdUnitIds settingsBanner = AdUnitIds(android: '', ios: '');

  // ---------------------------------------------------------------------------
  // Google test banners.
  // ---------------------------------------------------------------------------

  static const AdUnitIds testBanner = AdUnitIds(
    android: 'ca-app-pub-3940256099942544/6300978111',
    ios: 'ca-app-pub-3940256099942544/2934735716',
  );

  /// Returns the unit ID a banner slot should request.
  ///
  /// Returns an empty string when production ads are enabled but the placement
  /// has not been configured yet; the banner widget hides itself in that case.
  static String resolve(AdUnitIds productionIds) {
    if (useTestAds) {
      return testBanner.current;
    }
    return productionIds.isConfigured ? productionIds.current : '';
  }
}
