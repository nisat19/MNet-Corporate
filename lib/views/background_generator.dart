import 'package:flutter/material.dart';
import 'package:mnet_corporate/common/design_clippath.dart';
import 'package:mnet_corporate/constant/app_color.dart';

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
            : AppColor.primary.withOpacity(0.5),
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
          color: color != null ? color!.topColor : Colors.amber,
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
