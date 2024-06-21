import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import 'package:sap_zeal/widgets/cusotm_button_widget.dart';
import 'package:sap_zeal/widgets/custom_textfield_widget.dart';
import 'package:sap_zeal/widgets/custom_page_widget.dart';

import '../widgets/custom_barcode_widget.dart';

class TakiKaanchButtonPage extends StatefulWidget {
  static const String routeName = "/taki-kaanch-button-page";

  const TakiKaanchButtonPage({super.key});

  @override
  State<TakiKaanchButtonPage> createState() => _TakiKaanchButtonPageState();
}

class _TakiKaanchButtonPageState extends State<TakiKaanchButtonPage> {
  TextEditingController workerNameController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  final _rollsFormKey = GlobalKey<FormState>();

  List<Worker> workerList = [];
  WorkingOn selectedWorkingOn = WorkingOn.taki;

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
      title: "Taki/Kaanch/Button",
      children: [
        const Row(
          children: [
            Text(
              'Taki/Kaanch/Button',
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
          itemCount: workerList.length,
          itemBuilder: (context, index) {
            String displayText;
            if (workerList[index].workingOn == WorkingOn.button) {
              displayText = "Button";
            } else if (workerList[index].workingOn == WorkingOn.kaanch) {
              displayText = "Kaanch";
            } else {
              displayText = "Taki";
            }
            return ListTile(
              leading: Text(
                (index + 1).toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              title: Text(workerList[index].workerName),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Start: ${DateFormat('dd-MM-yyyy').format(workerList[index].startDate.toLocal()).toString()}",
                  ),
                  Text(
                    "End: ${DateFormat('dd-MM-yyyy').format(workerList[index].endDate.toLocal()).toString()}",
                  ),
                  Row(
                    children: [
                      Text(
                        "Worked On: $displayText",
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      Text(
                        "Quantity: ${workerList[index].quantity}",
                      ),
                    ],
                  ),
                ],
              ),
              trailing: IconButton(
                onPressed: () {
                  setState(() {
                    workerList.removeAt(index);
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
          "Total Workers: ${workerList.length}",
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Expanded(
              child: CustomTextfieldWidget(
                controller: workerNameController,
                hintText: "Worker Name",
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
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Working On: ',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            DropdownButton<WorkingOn>(
              value: selectedWorkingOn,
              onChanged: (WorkingOn? workingOn) {
                setState(() {
                  selectedWorkingOn = workingOn!;
                });
              },
              items: WorkingOn.values.map((WorkingOn workingOn) {
                String displayText;
                if (workingOn == WorkingOn.button) {
                  displayText = "Button";
                } else if (workingOn == WorkingOn.kaanch) {
                  displayText = "Kaanch";
                } else {
                  displayText = "Taki";
                }

                return DropdownMenuItem<WorkingOn>(
                  value: workingOn,
                  child: Text(
                    displayText,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
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
            const SizedBox(
              width: 10,
            ),
            CustomButtonWidget(
              onTap: addWorkingData,
              text: "Add",
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        CustomButtonWidget(
          onTap: submitCutting,
          text: "Submit",
        ),
      ],
    );
  }

  addWorkingData() {
    if (workerNameController.text.isEmpty && quantityController.text.isEmpty) {
      return;
    }
    workerList.add(
      Worker(
        workerName: workerNameController.text,
        quantity: quantityController.text,
        startDate: selectedStartDate,
        endDate: selectedEndDate,
        workingOn: selectedWorkingOn,
      ),
    );
    workerNameController.clear();
    setState(() {});
  }
}

class Worker {
  final String workerName;
  final String quantity;
  final DateTime startDate;
  final DateTime endDate;
  final WorkingOn workingOn;

  Worker({
    required this.workerName,
    required this.quantity,
    required this.startDate,
    required this.endDate,
    required this.workingOn,
  });
}

enum WorkingOn { taki, kaanch, button }
