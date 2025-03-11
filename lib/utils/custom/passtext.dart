import 'package:flutter/material.dart';
import 'package:smartspend/utils/constants/colors.dart';
import 'package:smartspend/utils/helpers/helper_functions.dart';
import 'package:smartspend/utils/validators/validation.dart';

class PasswordTextField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final bool obscureText;

  const PasswordTextField({
    super.key,
    required this.controller,
    required this.labelText,
    this.obscureText = true,
  });

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunctions.isDarkMode(context);
    return TextFormField(
      controller: widget.controller,
      validator: (value) {
        return SValidator.validatePassword(value);
      },
      decoration: InputDecoration(
        labelText: widget.labelText,
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
            color: dark ? SColors.white : SColors.black,
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      obscureText: _obscureText,
    );
  }
}
