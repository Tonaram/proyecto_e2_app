// lib\services\ad_service.dart

import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdService {
  static final AdService _instance = AdService._internal();

  factory AdService() {
    return _instance;
  }

  AdService._internal();

  late BannerAd banner;

  void initialize() {
    banner = BannerAd(
      adUnitId: "",//BannerAd.testAdUnitId, // remplazar con el id del banner TODO
      size: AdSize.banner,
      request: AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) {
          print('Ad loaded: ${ad.adUnitId}');
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          print('Ad failed to load: ${ad.adUnitId}, $error');
        },
        // métodos del listener
      ),
    )..load();
  }
}
