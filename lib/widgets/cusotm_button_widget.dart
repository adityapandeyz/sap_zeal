// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final bool isLoading;
  final bool isCenter;
  const CustomButtonWidget({
    super.key,
    required this.onTap,
    required this.text,
    this.isLoading = false,
    this.isCenter = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          isCenter ? MainAxisAlignment.center : MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.red,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              child: isLoading
                  ? const CircularProgressIndicator()
                  : Text(
                      text,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
