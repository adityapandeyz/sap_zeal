import 'package:flutter/material.dart';

class CustomTextfieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isPass;
  const CustomTextfieldWidget({
    super.key,
    required this.controller,
    required this.hintText,
    this.isPass = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPass,
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w600,
      ),
      decoration: InputDecoration(
        // label: Text('Email'),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.w600,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10,
        ),
        fillColor: Colors.white,
        filled: true,
      ),
      validator: (val) {
        if (val!.isEmpty) {
          return 'Please enter $hintText';
        }
        return null;
      },
    );
  }
}
