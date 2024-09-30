import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    super.key,
    this.width,
    this.height,
    this.hintText,
    this.suffixIcon,
    this.obscureText = false,
    this.suffixIconConstraints,
    this.keyboardType,
    this.isNOte = false,
    this.controller,
    this.validator,
  });
  final double? width;
  final double? height;
  final String? hintText;
  final Widget? suffixIcon;
  final bool obscureText;
  final BoxConstraints? suffixIconConstraints;
  final TextInputType? keyboardType;
  final bool isNOte;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height ?? 56,
      child: TextFormField(
        validator: validator,
        controller: controller,
        expands: isNOte ? true : false,
        maxLines: isNOte ? null : 1,
        obscureText: obscureText,
        keyboardType: keyboardType ?? TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: hintText ?? 'Enter your Email',
          suffixIconConstraints:
              suffixIconConstraints ?? const BoxConstraints(maxWidth: 33),
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
