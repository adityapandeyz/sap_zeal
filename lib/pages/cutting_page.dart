import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import 'package:sap_zeal/widgets/cusotm_button_widget.dart';
import 'package:sap_zeal/widgets/custom_textfield_widget.dart';
import 'package:sap_zeal/widgets/custom_page_widget.dart';

import '../widgets/custom_barcode_widget.dart';

class CuttingPage extends StatefulWidget {
  static const String routeName = "/cutting-page";

  const CuttingPage({super.key});

  @override
  State<CuttingPage> createState() => _CuttingPageState();
}

class _CuttingPageState extends State<CuttingPage> {
  TextEditingController noOfRollsCutted = TextEditingController();
  TextEditingController masterNameController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController sizeController = TextEditingController();
  TextEditingController totalWasteController = TextEditingController();
  final _rollsFormKey = GlobalKey<FormState>();
  List<Cut> cutList = [];

  @override
  void dispose() {
    noOfRollsCutted.dispose();
    masterNameController.dispose();
    quantityController.dispose();
    sizeController.dispose();
    totalWasteController.dispose();
    super.dispose();
  }

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2024),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  void submitCutting() {
    if (_rollsFormKey.currentState!.validate()) {
      // Implement API call here
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomPageWidget(
      title: "Cutting",
      children: [
        const Row(
          children: [
            Text(
              'Cutting',
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
          height: 10,
        ),
        CustomTextfieldWidget(
          controller: noOfRollsCutted,
          hintText: "No. of Rolls Cut",
        ),
        const SizedBox(
          height: 10,
        ),
        CustomTextfieldWidget(
          controller: masterNameController,
          hintText: "Master Name",
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'Pices cut by size:',
          style: TextStyle(
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        ListView.builder(
          scrollDirection: Axis.vertical,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: cutList.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Text(
                (index + 1).toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              title: Row(
                children: [
                  Text(
                    "Size: ${cutList[index].size} | Qty: ${cutList[index].quantity}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              trailing: IconButton(
                onPressed: () {
                  setState(() {
                    cutList.removeAt(index);
                  });
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
            );
          },
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "Total Qty: ${cutList.length.toString()}",
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: CustomTextfieldWidget(
                controller: sizeController,
                hintText: "Size",
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: CustomTextfieldWidget(
                controller: quantityController,
                hintText: "Quantity",
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            CustomButtonWidget(
              onTap: addCuttingDataToList,
              text: "Add",
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            const Text(
              'Date: ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            Text(
              DateFormat('dd-MM-yyyy')
                  .format(selectedDate.toLocal())
                  .toString(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 21,
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {
                _selectDate(context);
              },
              icon: const Icon(
                FontAwesomeIcons.calendar,
                color: Colors.white,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        CustomTextfieldWidget(
          controller: totalWasteController,
          hintText: "Total Waste (Kg/lot)",
        ),
        const SizedBox(
          height: 16,
        ),
        CustomButtonWidget(
          onTap: submitCutting,
          text: "send For Printing",
        ),
      ],
    );
  }

  addCuttingDataToList() {
    if (sizeController.text.isNotEmpty && quantityController.text.isNotEmpty) {
      cutList.add(
        Cut(
          size: sizeController.text,
          quantity: quantityController.text,
        ),
      );
      setState(() {
        sizeController.clear();
        quantityController.clear();
      });
    }
  }
}

class Cut {
  final String size;
  final String quantity;

  Cut({
    required this.size,
    required this.quantity,
  });
}
