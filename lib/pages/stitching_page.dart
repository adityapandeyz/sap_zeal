import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import 'package:sap_zeal/widgets/cusotm_button_widget.dart';
import 'package:sap_zeal/widgets/custom_textfield_widget.dart';
import 'package:sap_zeal/widgets/custom_page_widget.dart';

import '../widgets/custom_barcode_widget.dart';

class StitchingPage extends StatefulWidget {
  static const String routeName = "/stitching-page";

  const StitchingPage({super.key});

  @override
  State<StitchingPage> createState() => _StitchingPageState();
}

class _StitchingPageState extends State<StitchingPage> {
  TextEditingController workerNameController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  final _rollsFormKey = GlobalKey<FormState>();
  List<Stitching> stitchingList = [];

  @override
  void dispose() {
    workerNameController.dispose();
    quantityController.dispose();
    super.dispose();
  }

  DateTime selectedStartDate = DateTime.now();
  DateTime selectedEndDate = DateTime.now();

  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedStartDate,
      firstDate: DateTime(2024),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedStartDate) {
      setState(() {
        selectedStartDate = picked;
      });
    }
  }

  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedEndDate,
      firstDate: DateTime(2024),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedEndDate) {
      setState(() {
        selectedEndDate = picked;
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
      title: "Stitching",
      children: [
        const Row(
          children: [
            Text(
              'Stitching',
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
        const Text(
          'Worker Worked on this lot:',
          style: TextStyle(
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: stitchingList.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Text(
                (index + 1).toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              title: Text(stitchingList[index].workerName),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Quantity: ${stitchingList[index].quantity}",
                  ),
                  Text(
                    "Start: ${DateFormat('dd-MM-yyyy').format(stitchingList[index].startDate.toLocal()).toString()}",
                  ),
                  Text(
                    "End: ${DateFormat('dd-MM-yyyy').format(stitchingList[index].endDate.toLocal()).toString()}",
                  ),
                ],
              ),
              trailing: IconButton(
                onPressed: () {
                  setState(() {
                    stitchingList.removeAt(index);
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
          "Total Workers: ${stitchingList.length}",
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const SizedBox(
          height: 10,
        ),
        CustomTextfieldWidget(
          controller: workerNameController,
          hintText: "Worker Name",
        ),
        const SizedBox(
          height: 10,
        ),
        CustomTextfieldWidget(
          controller: quantityController,
          hintText: "Quantity",
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Start: ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                // fontSize: 18,
              ),
            ),
            Text(
              DateFormat('dd-MM-yyyy')
                  .format(selectedStartDate.toLocal())
                  .toString(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                // fontSize: 21,
              ),
            ),
            IconButton(
              onPressed: () {
                _selectStartDate(context);
              },
              icon: const Icon(
                FontAwesomeIcons.calendar,
                color: Colors.white,
              ),
            ),
            const Text(
              'End: ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                // fontSize: 18,
              ),
            ),
            Text(
              DateFormat('dd-MM-yyyy')
                  .format(selectedEndDate.toLocal())
                  .toString(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                // fontSize: 21,
              ),
            ),
            IconButton(
              onPressed: () {
                _selectEndDate(context);
              },
              icon: const Icon(
                FontAwesomeIcons.calendar,
                color: Colors.white,
              ),
            ),
            CustomButtonWidget(
              onTap: addStitchingData,
              text: "Add",
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        CustomButtonWidget(
          onTap: submitCutting,
          text: "Send For Taki/Kaanch/Button",
        ),
      ],
    );
  }

  addStitchingData() {
    if (workerNameController.text.isNotEmpty &&
        quantityController.text.isNotEmpty) {
      stitchingList.add(
        Stitching(
          workerName: workerNameController.text,
          quantity: quantityController.text,
          startDate: selectedStartDate,
          endDate: selectedEndDate,
        ),
      );
      setState(() {});
    }
  }
}

class Stitching {
  final String workerName;
  final String quantity;
  final DateTime startDate;
  final DateTime endDate;

  Stitching({
    required this.workerName,
    required this.quantity,
    required this.startDate,
    required this.endDate,
  });
}
