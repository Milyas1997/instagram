import 'package:flutter/material.dart';

class AppFormField extends StatelessWidget {
  const AppFormField({
    super.key,
    required this.labelText,
    this.isObsecure = false,
    required this.contoller,
    required this.preIcon,
    required this.keyboardAs,
  });

  final String labelText;
  final bool isObsecure;
  final TextEditingController contoller;
  final TextInputType keyboardAs;
  final IconData preIcon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(color: Colors.white),
      obscureText: isObsecure,
      controller: contoller,
      keyboardType: keyboardAs,
      decoration: InputDecoration(
        fillColor: Colors.white12,
        filled: true,
        label: Text(
          labelText,
          style: const TextStyle(color: Colors.white),
        ),
        prefixIcon: Icon(
          preIcon,
          color: Colors.white,
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: Colors.blue),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }
}
