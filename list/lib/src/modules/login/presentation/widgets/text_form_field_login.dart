import 'package:flutter/material.dart';

class TextFormFieldLogin extends StatelessWidget {
  final String label;
  final bool obscureText;
  final TextEditingController controller;
  final String? Function(String?) validator;
  final VoidCallback? showPassword;
  final TextInputType? textInputType;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final VoidCallback? onSubmit;

  const TextFormFieldLogin({
    super.key,
    required this.label,
    required this.obscureText,
    required this.controller,
    required this.validator,
    this.showPassword,
    this.textInputType,
    this.focusNode,
    this.nextFocus,
    this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey,
      ),
    );
    return TextFormField(
      obscureText: obscureText,
      validator: validator,
      controller: controller,
      keyboardType: textInputType,
      focusNode: focusNode,
      onEditingComplete: nextFocus != null ? nextFocus!.requestFocus : null,
      onFieldSubmitted: (value) => onSubmit != null ? onSubmit!() : null,
      style: const TextStyle(
        color: Colors.grey,
        fontSize: 16,
        fontWeight: FontWeight.normal,
      ),
      decoration: InputDecoration(
          prefixIcon: textInputType == TextInputType.emailAddress
              ? const Icon(
                  Icons.person_2_outlined,
                  color: Colors.grey,
                )
              : const Icon(
                  Icons.lock_outline,
                  color: Colors.grey,
                ),
          suffixIcon: textInputType == TextInputType.emailAddress
              ? null
              : IconButton(
                  onPressed: showPassword,
                  enableFeedback: false,
                  splashRadius: 25,
                  icon: obscureText
                      ? const Icon(
                          Icons.remove_red_eye_outlined,
                          color: Colors.grey,
                        )
                      : const Icon(
                          Icons.visibility_off_outlined,
                          color: Colors.grey,
                        ),
                ),
          isDense: true,
          fillColor: Colors.white,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          filled: true,
          label: Text(
            label,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
          ),
          errorStyle: const TextStyle(
            color: Colors.red,
            fontSize: 12,
            fontWeight: FontWeight.normal,
          ),
          border: border,
          disabledBorder: border,
          enabledBorder: border,
          focusedBorder: border,
          errorBorder: border.copyWith(
              borderSide: const BorderSide(
            color: Colors.red,
          ))),
    );
  }
}
