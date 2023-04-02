import 'package:flutter/material.dart';
import 'package:mnet_corporate/res/color/app_color.dart';
import 'package:mnet_corporate/util/design_clippath.dart';

// ignore: must_be_immutable
class BackgroundGenerator extends StatelessWidget {
  BuildContext context;
  Widget child;
  AdjustColor? color;
  BackgroundGenerator(
      {super.key, required this.context, required this.child, this.color});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: color != null
            ? color!.bottomColor
            : Colors.amber,
      ),
      ClipPath(
        clipper: GreenClipper(),
        child: Container(
          color: Colors.white,
        ),
      ),
      ClipPath(
        clipper: CustomClipPath(),
        child: Container(
          height: MediaQuery.of(context).size.height / 6,
          color: color != null ? color!.topColor : AppColor.primary,
        ),
      ),
      child
    ]);
  }
}

class AdjustColor {
  Color topColor;
  Color bottomColor;
  AdjustColor({required this.topColor, required this.bottomColor});
}
