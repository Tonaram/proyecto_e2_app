// lib\services\ad_service.dart

import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdService {
  static final AdService _instance = AdService._internal();

  factory AdService() {
    return _instance;
  }

  AdService._internal();

  BannerAd createBannerAd() {
    BannerAd banner = BannerAd(
      adUnitId: 'ca-app-pub-7800978004000201/3339973032', // Ad Unit ID
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
    );
    banner.load();
    return banner;
  }
}

