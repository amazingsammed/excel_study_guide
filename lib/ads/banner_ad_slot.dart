import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'ad_ids.dart';
import 'ad_service.dart';

/// A responsive banner ad for the bottom of a screen or inline in a list.
///
/// The slot collapses completely on unsupported platforms, when no ad unit is
/// configured, or while an ad fails to load. AdMob's adaptive size keeps the
/// creative at normal banner height (never full screen) and fits the available
/// width.
class BannerAdSlot extends StatefulWidget {
  const BannerAdSlot({super.key, required this.ids});

  final AdUnitIds ids;

  @override
  State<BannerAdSlot> createState() => _BannerAdSlotState();
}

class _BannerAdSlotState extends State<BannerAdSlot> {
  BannerAd? _ad;
  bool _loaded = false;
  bool _loading = false;
  bool _routeReady = true;
  int _requestedWidth = 0;
  Animation<double>? _routeAnimation;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final animation = ModalRoute.of(context)?.animation;
    if (!identical(animation, _routeAnimation)) {
      _routeAnimation?.removeStatusListener(_onRouteStatusChanged);
      _routeAnimation = animation;
      _routeAnimation?.addStatusListener(_onRouteStatusChanged);
    }
    _routeReady =
        animation == null || animation.status == AnimationStatus.completed;
  }

  void _onRouteStatusChanged(AnimationStatus status) {
    if (status == AnimationStatus.completed && mounted && !_routeReady) {
      setState(() => _routeReady = true);
    }
  }

  @override
  void dispose() {
    _routeAnimation?.removeStatusListener(_onRouteStatusChanged);
    _ad?.dispose();
    super.dispose();
  }

  Future<void> _load(int width) async {
    if (_loading || width <= 0 || !AdService.isSupported) {
      return;
    }

    final unitId = AdIds.resolve(widget.ids);
    if (unitId.isEmpty) {
      return;
    }

    _loading = true;
    _requestedWidth = width;
    _loaded = false;
    final previous = _ad;
    _ad = null;
    previous?.dispose();

    final ready = await AdService.ensureInitialized();
    if (!ready || !mounted) {
      _loading = false;
      return;
    }

    final size = await AdSize.getLargeAnchoredAdaptiveBannerAdSize(width);
    if (size == null || !mounted) {
      _loading = false;
      return;
    }

    final banner = BannerAd(
      adUnitId: unitId,
      size: size,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          if (!mounted || !identical(_ad, ad)) {
            ad.dispose();
            return;
          }
          setState(() {
            _loaded = true;
            _loading = false;
          });
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
          if (!mounted || !identical(_ad, ad)) {
            return;
          }
          debugPrint('Banner ad failed to load: $error');
          setState(() {
            _ad = null;
            _loaded = false;
            _loading = false;
          });
        },
      ),
    );

    _ad = banner;
    setState(() {});
    await banner.load();
  }

  @override
  Widget build(BuildContext context) {
    if (!AdService.isSupported || !_routeReady) {
      return const SizedBox.shrink();
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth.floor();
        if (width > 0 && (width - _requestedWidth).abs() > 8 && !_loading) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted) {
              _load(width);
            }
          });
        }

        final ad = _ad;
        if (ad == null) {
          return const SizedBox.shrink();
        }

        if (!_loaded) {
          // Reserve the space while the ad loads to avoid a layout jump.
          return SizedBox(height: ad.size.height + 8);
        }

        final scheme = Theme.of(context).colorScheme;
        return DecoratedBox(
          decoration: BoxDecoration(
            color: scheme.surface,
            border: Border(
              top: BorderSide(color: scheme.outlineVariant, width: 1),
            ),
          ),
          child: Center(
            child: ClipRect(
              child: SizedBox(
                width: ad.size.width.toDouble(),
                height: ad.size.height.toDouble(),
                child: AdWidget(ad: ad),
              ),
            ),
          ),
        );
      },
    );
  }
}
