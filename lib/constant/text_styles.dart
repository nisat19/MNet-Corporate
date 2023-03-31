// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:mnet_corporate/constant/app_color.dart';

TextStyle getHeaderStyle(BuildContext context) {
  return Theme.of(context)
      .textTheme
      .headline4!
      .copyWith(color: Colors.black, fontWeight: FontWeight.w800);
}

TextStyle getSubHeaderStyle(BuildContext context) {
  return Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.black);
}

TextStyle getTitleStyle(BuildContext context) {
  return Theme.of(context)
      .textTheme
      .titleLarge!
      .copyWith(fontWeight: FontWeight.bold, color: AppColor.textBody);
}

TextStyle getSubTitleStyle(BuildContext context) {
  return Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.black);
}

const floatingTitleStyle = TextStyle(
  fontSize: 20,
  color: AppColor.primary,
);


const textfieldgap = 23.0;
const textLineGap = 5.0;

ThemeData dateTimeTheme = ThemeData(
  primarySwatch: Colors.grey,
  splashColor: Colors.black,
  textTheme: const TextTheme(
    subtitle1: TextStyle(color: Colors.black),
    button: TextStyle(color: Colors.black),
  ),
  colorScheme: const ColorScheme.light(
    primary: AppColor.primary,
    primaryContainer: Colors.black,
    secondaryContainer: Colors.black,
    onSecondary: Colors.black,
    onPrimary: Colors.white,
    surface: Colors.black,
    onSurface: Colors.black,
    secondary: Colors.black,
  ),
  dialogBackgroundColor: Colors.white,
);
InputDecoration dateTimeDecoration(String lableText, BuildContext context) {
  return InputDecoration(
      suffixIcon: const Icon(
        Icons.calendar_month,
        color: AppColor.primary,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: const BorderSide(
          color: AppColor.primary,
        ),
      ),
      labelStyle:
          const TextStyle(fontFamily: 'Nunito', color: AppColor.primary),
      contentPadding: const EdgeInsets.only(left: 21, top: 10, bottom: 10),
      focusColor: AppColor.primary,
      //icon of text field
      labelText: lableText //label text of field
      );
}

final KtextField = InputDecoration(
  focusColor: AppColor.primary,
  hintText: '',
  hintStyle: const TextStyle(color: AppColor.primary),
  contentPadding: const EdgeInsets.only(left: 21, top: 10, bottom: 10),
  labelStyle: const TextStyle(
    fontFamily: 'Nunito',
    color: AppColor.primary,
  ),
  floatingLabelStyle: floatingTitleStyle,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide: const BorderSide(
      color: AppColor.primary,
    ),
  ),
);
