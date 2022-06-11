import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class NativeAds extends StatefulWidget {
  const NativeAds({Key? key}) : super(key: key);

  @override
  _NativeAdsState createState() => _NativeAdsState();
}

class _NativeAdsState extends State<NativeAds> {
  late NativeAd _adSmall;
  late NativeAd _adMedium;
  bool _isAdLoaded = false;
  bool _isAdLoadedMedium = false;

  @override
  void initState() {
    super.initState();

    _adSmall = NativeAd(
      // Here in adUnitId: add your own ad unit ID before release build
      adUnitId: "ca-app-pub-3940256099942544/2247696110",
      factoryId: 'listTileSmall',
      request: const AdRequest(),
      listener: NativeAdListener(
        onAdLoaded: (_) {
          setState(() {
            _isAdLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          // Releases an ad resource when it fails to load
          ad.dispose();

          print('Ad load failed (code=${error.code} message=${error.message})');
        },
      ),
    );

    _adSmall.load();

    _adMedium = NativeAd(
      // Here in adUnitId: add your own ad unit ID before release build

      adUnitId: "ca-app-pub-3940256099942544/2247696110",
      factoryId: 'listTileMedium',
      request: const AdRequest(),
      listener: NativeAdListener(
        onAdLoaded: (_) {
          setState(() {
            _isAdLoadedMedium = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          // Releases an ad resource when it fails to load
          ad.dispose();

          print('Ad load failed (code=${error.code} message=${error.message})');
        },
      ),
    );

    _adMedium.load();
  }

  @override
  void dispose() {
    _adSmall.dispose();
    _adMedium.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Container(
        height: 500,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            child: AdWidget(ad: _adMedium),
            height: 380,
            width: 400,
          ),
        ),
      ),
    );
  }
}
