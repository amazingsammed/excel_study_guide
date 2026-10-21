import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

/// Thin wrapper around AdMob initialisation.
///
/// Ads are only supported on Android and iOS. On desktop, web, and in widget
/// tests the service reports that ads are unavailable and every banner slot
/// collapses to zero height.
class AdService {
  AdService._();

  static bool _initialized = false;
  static bool _unavailable = false;
  static Future<bool>? _initialization;

  static bool get isSupported =>
      !kIsWeb &&
      (defaultTargetPlatform == TargetPlatform.android ||
          defaultTargetPlatform == TargetPlatform.iOS);

  static bool get isReady => _initialized && !_unavailable;

  /// Initialises the Mobile Ads SDK once and returns whether it is usable.
  static Future<bool> ensureInitialized() {
    if (!isSupported || _unavailable) {
      return Future<bool>.value(false);
    }
    if (_initialized) {
      return Future<bool>.value(true);
    }
    return _initialization ??= _initialize();
  }

  static Future<bool> _initialize() async {
    try {
      await MobileAds.instance.initialize();
      _initialized = true;
      return true;
    } on MissingPluginException {
      // Expected when ads are opened in a host-side widget test.
      _unavailable = true;
      return false;
    } on UnimplementedError {
      _unavailable = true;
      return false;
    } catch (error) {
      // Allow a later attempt if this was a transient network failure.
      _initialization = null;
      debugPrint('AdMob initialisation failed: $error');
      return false;
    }
  }
}
