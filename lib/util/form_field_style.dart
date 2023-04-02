import 'package:flutter/material.dart';

var minHeight = 10.0;

class FormFieldStyle extends StatelessWidget {
final TextEditingController controller;
  final String label;
  final String hint;
  final Widget? suffixIcon;
  final bool? obcureText;
  const FormFieldStyle(
      {Key? key,
      required this.controller,
      required this.label,
      required this.hint,
      this.suffixIcon,
      this.obcureText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obcureText ?? false,
      decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          border: const UnderlineInputBorder(),
          labelText: label,
          suffixIcon: suffixIcon,
          hintText: hint),
    );
  }
}
