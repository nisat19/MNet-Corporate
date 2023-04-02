import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mnet_corporate/res/color/app_color.dart';

Widget buildImage(String imagePath, double size, Color borderColor,
    double borderWidth, VoidCallback onClicked) {
  return GestureDetector(
    onTap: onClicked,
    child: Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          border: Border.all(color: borderColor, width: borderWidth),
          borderRadius: BorderRadius.circular(size / 2),
          boxShadow: [
            BoxShadow(
              offset: const Offset(-3, 3),
              spreadRadius: 2,
              blurRadius: 7,
              color: Colors.grey.withOpacity(0.5),
            )
          ]),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(size)),
        child: shapedImage(imagePath, size),
      ),
    ),
  );
}

Widget shapedImage(String imagePath, double size) {
  if (imagePath.isEmpty) {
    return Image.asset(
      'assets/profilepic.png',
      height: size,
      width: double.infinity,
      fit: BoxFit.cover,
      alignment: Alignment.center,
    );
  } else if (imagePath.contains('https')) {
    return CachedNetworkImage(
      height: size,
      width: double.infinity,
      fit: BoxFit.cover,
      imageUrl: imagePath,
      cacheManager: CacheManager(Config(
        imagePath,
        stalePeriod: const Duration(days: 7),
        //one week cache period
      )),
      placeholder: (context, url) => Image.asset(
        'assets/gif/spinner.gif',
        fit: BoxFit.cover,
        width: double.infinity,
        height: 80,
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error_outline),
    );
  } else if (imagePath.contains('assets')) {
    return Image.asset(
      imagePath,
      height: size,
      width: double.infinity,
      fit: BoxFit.cover,
      alignment: Alignment.center,
    );
  } else {
    return Image.memory(
      base64Decode(imagePath),
      height: size,
      width: double.infinity,
      fit: BoxFit.cover,
      alignment: Alignment.center,
    );
  }
}

class CustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    double height = size.height;
    double width = size.width;
    path.lineTo(0, height - 100);
    path.quadraticBezierTo(width / 2, height, width, height - 100);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

Widget builderLoader(double height, double width) {
  return Container(
    height: height,
    width: width,
    color: Colors.grey.shade200,
    child: const Center(
      child: SpinKitFoldingCube(
        color: Colors.white,
        size: 50.0,
      ),
    ),
  );
}

void showCustomSnackBar(BuildContext context, String message,
    {bool isError = false}) {
  if (message.isNotEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        dismissDirection: DismissDirection.horizontal,
        // margin: const EdgeInsets.all(8),
        duration: const Duration(seconds: 3),
        backgroundColor: isError ? Colors.red : AppColor.primary,
        behavior: SnackBarBehavior.fixed,
        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        content: Text(message,
            style: const TextStyle(fontSize: 15, color: Colors.white))));
  }
}

List<Widget> indicators(imagesLength, currentIndex) {
  return List<Widget>.generate(imagesLength, (index) {
    return Container(
      margin: const EdgeInsets.all(3),
      width: 10,
      height: 10,
      decoration: BoxDecoration(
          color: currentIndex == index ? Colors.black : Colors.black26,
          shape: BoxShape.circle),
    );
  });
}

Widget syncRequired({required int isSync, required int isUpdated}) {
  if (isSync == 0 || isUpdated == 1) {
    return SvgPicture.asset(
      'assets/svg/synced_required.svg',
      height: 15,
    );
  } else {
    return const Text('');
  }
}
