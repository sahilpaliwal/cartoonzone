// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, unnecessary_string_interpolations, unused_field, unrelated_type_equality_checks, sized_box_for_whitespace



import 'package:Cartoons/screens/drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CartoonScreen extends StatefulWidget {
  final String cartooName;
  final String CartoonUrl;
  const CartoonScreen({
    super.key,
    required this.CartoonUrl,
    required this.cartooName,
  });

  @override
  State<CartoonScreen> createState() => _CartoonScreenState();
}

class _CartoonScreenState extends State<CartoonScreen> {
  InterstitialAd? _interstitialAd;

  late WebViewController webviewcontroller;

  void _moveToHome() async {
    if (await webviewcontroller.canGoBack()) {
      webviewcontroller.goBack();
    } else {
      Navigator.pop(context);
    }
  }

  Future<bool> moveToHome() async {
    if (await webviewcontroller.canGoBack()) {
      webviewcontroller.goBack();
      return false;
    } else {
      return true;
    }
  }

  void _loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: "ca-app-pub-4280527336340292/5420962070",
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              print("ad dismissed");
            },
          );
          setState(() {
            _interstitialAd = ad;
          });
        },
        onAdFailedToLoad: (err) {
          debugPrint('Failed to load an interstitial ad: ${err.message}');
        },
      ),
    );
  }

  @override
  void initState() {
    _loadInterstitialAd();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_interstitialAd != null) {
          _interstitialAd?.show();
          return moveToHome();
        } else {
          return moveToHome();
        }
      },
      child: Scaffold(
        backgroundColor:black,
        appBar: AppBar(
          leading: BackButton(
            color: Colors.white,
            onPressed: () {
              if (_interstitialAd != null) {
                _interstitialAd?.show();
                _moveToHome();
              } else {
                _moveToHome();
              }
            },
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
            child: Text(
              widget.cartooName,
              style: GoogleFonts.quicksand(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
        body:Stack(children: [
                Positioned(
                  top: -50,
                  bottom: -60,
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: WebView(
                      onWebViewCreated: (controller) {
                        setState(() {
                          webviewcontroller = controller;
                        });
                      },
                      javascriptMode: JavascriptMode.unrestricted,
                      initialUrl: widget.CartoonUrl,
                    ),
                  ),
                ),
              ]),
      ),
    );
  }

  @override
  void dispose() {
    _interstitialAd?.dispose();
    super.dispose();
  }
}
