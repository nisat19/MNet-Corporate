import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mnet_corporate/common/size_config.dart';

class AppHelper {
  late BuildContext context;
  late DateTime currentBackPressTime;

  // ignore: no_leading_underscores_for_local_identifiers
  AppHelper.of(BuildContext _context) {
    context = _context;
  }

  static OverlayEntry overlayLoader(context) {
    OverlayEntry loader = OverlayEntry(builder: (context) {
      final size = MediaQuery.of(context).size;
      return Positioned(
        height: size.height,
        width: size.width,
        top: 0,
        left: 0,
        child: Material(
            color: Colors.grey.withOpacity(0.4),
            child: const SpinKitFoldingCube(
              color: Colors.white,
              size: 50.0,
            )),
      );
    });
    return loader;
  }

  Widget emptyView() {
    final size = MediaQuery.of(context).size;
    return Center(
        child: Image.asset(
      'assets/images/empty.png',
      height: AppHelper.getProportionateScreenHeight(size.height * 0.5),
    ));
  }

  static showLoader(BuildContext context, OverlayEntry loader) {
    Overlay.of(context)!.insert(loader);
  }

  static hideLoader(OverlayEntry loader) {
    Timer(const Duration(milliseconds: 500), () {
      try {
        loader.remove();
        // ignore: empty_catches
      } catch (e) {}
    });
  }

  static getData(Map<String, dynamic> data) {
    return data['data'] ?? [];
  }

  static double getProportionateScreenWidth(double inputWidth) {
    double screenWidth = SizeConfig.screenWidth;
    // 375 is the layout width that designer use
    return (inputWidth / 375.0) * screenWidth;
  }

  static double getProportionateScreenHeight(double inputHeight) {
    double screenHeight = SizeConfig.screenHeight;
    // 812 is the layout height that designer use
    return (inputHeight / 812.0) * screenHeight;
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
