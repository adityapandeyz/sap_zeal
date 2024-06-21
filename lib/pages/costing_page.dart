import 'package:flutter/material.dart';

import 'package:sap_zeal/widgets/cusotm_button_widget.dart';
import 'package:sap_zeal/widgets/custom_barcode_widget.dart';
import 'package:sap_zeal/widgets/custom_popup_widget.dart';
import 'package:sap_zeal/widgets/custom_page_widget.dart';

class CostingPage extends StatefulWidget {
  static const String routeName = "/costing-page";

  const CostingPage({super.key});

  @override
  State<CostingPage> createState() => _CostingPageState();
}

class _CostingPageState extends State<CostingPage> {
  final _rollsFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
  }

  void submitMaterials() {
    if (_rollsFormKey.currentState!.validate()) {
      // Implement API call here
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomPageWidget(
      title: "Costing",
      children: [
        const Row(
          children: [
            Text(
              'Costing',
              style: TextStyle(
                fontSize: 22,
                color: Colors.white,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const CustomBarcodeWidget(
          barcode: 'FAB1546',
        ),
        const SizedBox(
          height: 20,
        ),
        // fabric costing, material costing, cutting costing, printing costing, stitching costing, taki/kaanch.button, washing costing, finishing costing, packing costing, etc
        const SizedBox(
          width: 300,
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Fabric Costing:',
                    style: TextStyle(),
                  ),
                  Spacer(),
                  Text(
                    'Rs. 1000',
                    style: TextStyle(),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    'Material Costing:',
                    style: TextStyle(),
                  ),
                  Spacer(),
                  Text(
                    'Rs. 1000',
                    style: TextStyle(),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    'Cutting Costing:',
                    style: TextStyle(),
                  ),
                  Spacer(),
                  Text(
                    'Rs. 1000',
                    style: TextStyle(),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    'Printing Costing:',
                    style: TextStyle(),
                  ),
                  Spacer(),
                  Text(
                    'Rs. 1000',
                    style: TextStyle(),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    'Stitching Costing:',
                    style: TextStyle(),
                  ),
                  Spacer(),
                  Text(
                    'Rs. 1000',
                    style: TextStyle(),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    'Taki/Kaanch/Button Costing:',
                    style: TextStyle(),
                  ),
                  Spacer(),
                  Text(
                    'Rs. 1000',
                    style: TextStyle(),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    'Washing Costing:',
                    style: TextStyle(),
                  ),
                  Spacer(),
                  Text(
                    'Rs. 1000',
                    style: TextStyle(),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                color: Colors.white,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    'Total:',
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  Spacer(),
                  Text(
                    'Rs. 7000',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        CustomButtonWidget(
          onTap: () {
            customPopupWidget(
              context: context,
              title: 'Print Report',
              children: [
                const CustomBarcodeWidget(
                  barcode: 'FAB1546',
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Total Quantity: 10',
                  style: TextStyle(),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Rate per Pc.: Rs. 7000',
                  style: TextStyle(),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButtonWidget(
                  onTap: () {},
                  text: "Print Report",
                  isCenter: true,
                ),
              ],
            );
          },
          text: "Print Report",
          isCenter: true,
        )
      ],
    );
  }
}
