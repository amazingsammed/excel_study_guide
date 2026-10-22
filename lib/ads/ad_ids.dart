import 'package:flutter/foundation.dart';

/// A pair of banner ad unit IDs, one per mobile platform.
class AdUnitIds {
  const AdUnitIds({required this.android, required this.ios});

  final String android;
  final String ios;

  /// Whether this placement has a unit ID for the current platform.
  bool get isConfigured => current.isNotEmpty;

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
/// Paste the real unit IDs into the matching [AdUnitIds] fields, one per
/// platform. App IDs live in:
/// - `android/app/src/main/AndroidManifest.xml`
/// - `ios/Runner/Info.plist`
///
/// Debug builds automatically use Google's test ads; profile and release
/// builds automatically use the production IDs below. No manual switch needed.
/// Keep the Dart app IDs below in sync with the native files for reference.
class AdIds {
  AdIds._();

  // ---------------------------------------------------------------------------
  // AdMob application IDs (also required in the native manifests).
  // ---------------------------------------------------------------------------

  /// Used in `android/app/src/main/AndroidManifest.xml`.
  static const String androidAppId = 'ca-app-pub-5034627120549852~3841427606';

  /// Used in `ios/Runner/Info.plist`.
  static const String iosAppId = 'ca-app-pub-3940256099942544~1458002511';

  // ---------------------------------------------------------------------------
  // Production banner units - replace the empty strings with your own IDs.
  // ---------------------------------------------------------------------------

  static const AdUnitIds homeBanner = AdUnitIds(
    android: 'ca-app-pub-5034627120549852/2187021423',
    ios: '',
  );

  static const AdUnitIds categoryBanner = AdUnitIds(
    android: 'ca-app-pub-5034627120549852/5250712195',
    ios: '',
  );

  static const AdUnitIds topicBanner = AdUnitIds(
    android: 'ca-app-pub-5034627120549852/8577169953',
    ios: '',
  );

  static const AdUnitIds quizBanner = AdUnitIds(
    android: 'ca-app-pub-5034627120549852/8998385511',
    ios: '',
  );

  static const AdUnitIds bookmarksBanner = AdUnitIds(
    android: 'ca-app-pub-5034627120549852/6372222174',
    ios: '',
  );

  static const AdUnitIds settingsBanner = AdUnitIds(
    android: 'ca-app-pub-5034627120549852/9698679937',
    ios: '',
  );

  // ---------------------------------------------------------------------------
  // Google test banners.
  // ---------------------------------------------------------------------------

  static const AdUnitIds testBanner = AdUnitIds(
    android: 'ca-app-pub-3940256099942544/6300978111',
    ios: 'ca-app-pub-3940256099942544/2934735716',
  );

  /// Returns the unit ID a banner slot should request.
  ///
  /// Debug builds always use Google's test banner, so development never
  /// generates invalid traffic. Profile and release builds use [productionIds]
  /// and hide the slot when that placement has not been configured yet.
  static String resolve(AdUnitIds productionIds) {
    if (kDebugMode) {
      return testBanner.current;
    }
    return productionIds.isConfigured ? productionIds.current : '';
  }
}
