import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:sap_zeal/widgets/cusotm_button_widget.dart';
import 'package:sap_zeal/widgets/custom_textfield_widget.dart';
import 'package:sap_zeal/widgets/custom_page_widget.dart';

import '../widgets/custom_barcode_widget.dart';
import '../widgets/custom_popup_widget.dart';

class RollsPage extends StatefulWidget {
  static const String routeName = "/rolls -page";

  const RollsPage({super.key});

  @override
  State<RollsPage> createState() => _RollsPageState();
}

class _RollsPageState extends State<RollsPage> {
  TextEditingController sellerNameController = TextEditingController();
  TextEditingController fabricTypeController = TextEditingController();
  TextEditingController lotNoController = TextEditingController();

  TextEditingController serialNoController = TextEditingController();
  TextEditingController netWeightController = TextEditingController();
  TextEditingController grossWeightController = TextEditingController();
  TextEditingController fabricLength = TextEditingController();

  TextEditingController rateController = TextEditingController();
  TextEditingController purposeController = TextEditingController();
  TextEditingController noOfRollsController = TextEditingController();
  final _rollsFormKey = GlobalKey<FormState>();
  List<Roll> rollsList = [];
  int rollNo = 0;
  Unit selectedUnit = Unit.meter;

  DateTime selectedDate = DateTime.now();

  // Future<void> _selectDate(BuildContext context) async {
  //   final DateTime? picked = await showDatePicker(
  //     context: context,
  //     initialDate: selectedDate,
  //     firstDate: DateTime(2024),
  //     lastDate: DateTime(2101),
  //   );

  //   if (picked != null && picked != selectedDate) {
  //     setState(() {
  //       selectedDate = picked;
  //     });
  //   }
  // }

  @override
  void dispose() {
    sellerNameController.dispose();
    fabricTypeController.dispose();
    rateController.dispose();
    purposeController.dispose();
    noOfRollsController.dispose();
    lotNoController.dispose();
    netWeightController.dispose();
    grossWeightController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPageWidget(
      title: "Rolls",
      children: [
        const Row(
          children: [
            Text(
              'Fabric Details',
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
        CustomTextfieldWidget(
          controller: sellerNameController,
          hintText: "Seller Name",
        ),
        const SizedBox(
          height: 10,
        ),
        CustomTextfieldWidget(
          controller: fabricTypeController,
          hintText: "Fabric Type",
        ),
        const SizedBox(
          height: 10,
        ),
        CustomTextfieldWidget(
          controller: purposeController,
          hintText: "Purpose",
        ),
        const SizedBox(
          height: 10,
        ),
        CustomTextfieldWidget(
          controller: lotNoController,
          hintText: "Lot No.",
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            const Text(
              'Unit:',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            DropdownButton<Unit>(
              value: selectedUnit,
              onChanged: (Unit? newValue) {
                setState(() {
                  selectedUnit = newValue!;
                  rollNo = 0;
                  rollsList.clear();
                });
              },
              items: Unit.values.map((Unit unit) {
                return DropdownMenuItem<Unit>(
                  value: unit,
                  child: Text(
                    unit == Unit.kg ? "Kg" : "Meter",
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
        const Text(
          'Individual Roll Entry:',
          style: TextStyle(
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        ListView.builder(
          scrollDirection: Axis.vertical,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: rollsList.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                customPopupWidget(
                  context: context,
                  title: "Roll Details",
                  children: [
                    Text("Lot No: ${lotNoController.text}"),
                    const SizedBox(
                      height: 10,
                    ),
                    Text("Roll No: ${rollsList[index].rollNo.toString()}"),
                    const SizedBox(
                      height: 10,
                    ),
                    Text("Seller Name: ${sellerNameController.text}"),
                    const SizedBox(
                      height: 10,
                    ),
                    Text("Fabric Type: ${fabricTypeController.text}"),
                    const SizedBox(
                      height: 10,
                    ),
                    Text("Purpose: ${purposeController.text}"),
                    const SizedBox(
                      height: 10,
                    ),
                    selectedUnit == Unit.meter
                        ? Text(
                            "Fabric Length: ${rollsList[index].fabricLength} Meter",
                          )
                        : Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                  "Net Weight: ${rollsList[index].netWeight.toString()} Kg"),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                  "Gross Weight: ${rollsList[index].grossWeight.toString()} Kg"),
                            ],
                          ),
                    const SizedBox(
                      height: 10,
                    ),
                    const CustomBarcodeWidget(
                      barcode: 'FAB1546',
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    CustomButtonWidget(
                      onTap: () {},
                      text: "Print Barcode",
                      isCenter: true,
                    )
                  ],
                );
              },
              leading: const Icon(Icons.print),
              title: Text("Roll ${rollsList[index].rollNo.toString()}"),
              subtitle: selectedUnit == Unit.meter
                  ? Text(
                      "Fabric Length: ${rollsList[index].fabricLength.toString()} Meter")
                  : Text(
                      "Net Weight: ${rollsList[index].netWeight.toString()} Kg | Gross Weight: ${rollsList[index].grossWeight.toString()} Kg"),
              trailing: Text("Barcode: ${rollsList[index].barcode.toString()}"),
            );
          },
        ),
        const SizedBox(
          height: 10,
        ),
        selectedUnit == Unit.meter
            ? Text(
                "Total Fabric Length: ${totalLength()} Meter",
                style: const TextStyle(
                  color: Colors.white,
                ),
              )
            : Text(
                "Total Net Weight: ${totalNetWeight().toString()} Kg | Total Gross Weight: ${totalGrossWeight()} Kg",
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
        const SizedBox(
          height: 10,
        ),
        selectedUnit == Unit.meter
            ? CustomTextfieldWidget(
                controller: fabricLength,
                hintText: "Fabric Length (Meter)",
              )
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomTextfieldWidget(
                    controller: netWeightController,
                    hintText: "Net Weight (Kg)",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextfieldWidget(
                    controller: grossWeightController,
                    hintText: "Gross Weight (Kg)",
                  ),
                ],
              ),
        const SizedBox(
          height: 10,
        ),
        CustomButtonWidget(
          onTap: addRoll,
          text: "Add Roll",
        ),
        const SizedBox(
          height: 20,
        ),
        CustomTextfieldWidget(
          controller: rateController,
          hintText: "Rate Per Unit (₹)",
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "Date: ${DateFormat('dd-MM-yyyy').format(selectedDate.toLocal()).toString()}",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 21,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        CustomButtonWidget(
          onTap: submitRolls,
          text: "Send for Cutting",
        ),
      ],
    );
  }

  void addRoll() {
    rollNo += 1;
    if (selectedUnit == Unit.meter) {
      if (fabricLength.text.isNotEmpty && lotNoController.text.isNotEmpty) {
        try {
          Roll roll = Roll(
            rollNo: rollNo,
            fabricLength: int.parse(fabricLength.text),
            barcode: "${lotNoController.text.toString()}${rollNo.toString()}",
          );

          rollsList.add(roll);

          setState(() {});
        } catch (e) {
          print(e);
        }
      }
    } else if (netWeightController.text.isNotEmpty &&
        grossWeightController.text.isNotEmpty &&
        lotNoController.text.isNotEmpty) {
      try {
        Roll roll = Roll(
          rollNo: rollNo,
          netWeight: double.parse(netWeightController.text),
          grossWeight: double.parse(grossWeightController.text),
          fabricLength: int.parse(fabricLength.text),
          barcode: "${lotNoController.text.toString()}${rollNo.toString()}",
        );

        rollsList.add(roll);

        setState(() {});
      } catch (e) {
        print(e);
      }
    }
  }

  void submitRolls() {
    if (_rollsFormKey.currentState!.validate()) {
      // Implement API call here

      // Clear all the fields
      rollNo = 0;
      sellerNameController.clear();
      fabricTypeController.clear();
      rateController.clear();
      purposeController.clear();
      noOfRollsController.clear();
      lotNoController.clear();
      netWeightController.clear();
      grossWeightController.clear();
      fabricLength.clear();
      rollsList.clear();
    }
  }

  double totalNetWeight() {
    double totalWeight = 0.0;
    for (var element in rollsList) {
      totalWeight += element.netWeight;
    }

    return totalWeight;
  }

  double totalGrossWeight() {
    double totalWeight = 0.0;
    for (var element in rollsList) {
      totalWeight += element.grossWeight;
    }

    return totalWeight;
  }

  int totalLength() {
    int totaLength = 0;
    for (var element in rollsList) {
      totaLength += element.fabricLength;
    }
    return totaLength;
  }
}

class Roll {
  final int rollNo;
  final double netWeight;
  final double grossWeight;
  final int fabricLength;
  final String barcode;

  Roll({
    required this.rollNo,
    this.netWeight = 0.0,
    this.grossWeight = 0.0,
    this.fabricLength = 0,
    required this.barcode,
  });
}

enum Unit { kg, meter }
