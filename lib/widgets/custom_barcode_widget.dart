import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';

class CustomBarcodeWidget extends StatelessWidget {
  final String barcode;
  const CustomBarcodeWidget({
    super.key,
    required this.barcode,
  });

  @override
  Widget build(BuildContext context) {
    return BarcodeWidget(
      height: 100,
      width: 150,
      style: const TextStyle(
        color: Colors.white,
      ),
      color: Colors.white,
      barcode: Barcode.code128(),
      data: barcode,
      errorBuilder: (context, error) => Center(child: Text(error)),
    );
  }
}
