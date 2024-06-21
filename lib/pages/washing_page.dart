import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import 'package:sap_zeal/widgets/cusotm_button_widget.dart';
import 'package:sap_zeal/widgets/custom_textfield_widget.dart';
import 'package:sap_zeal/widgets/custom_page_widget.dart';

class WashingPage extends StatefulWidget {
  static const String routeName = "/washing-page";

  const WashingPage({super.key});

  @override
  State<WashingPage> createState() => _WashingPageState();
}

class _WashingPageState extends State<WashingPage> {
  TextEditingController lotNoController = TextEditingController();
  TextEditingController quantityController = TextEditingController();

  final _rollsFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
  }

  DateTime selectedIncomingDate = DateTime.now();
  DateTime selectedOutgoingDate = DateTime.now();

  Future<void> _selectIncomingDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedIncomingDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      helpText: 'Select Incoming Date',
    );

    if (picked != null && picked != selectedIncomingDate) {
      setState(() {
        selectedIncomingDate = picked;
      });
    }
  }

  Future<void> _selectOutgoingDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedOutgoingDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      helpText: 'Select Outgoing Date',
    );

    if (picked != null && picked != selectedOutgoingDate) {
      setState(() {
        selectedOutgoingDate = picked;
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
      title: "Washing",
      children: [
        const Row(
          children: [
            Text(
              'Washing',
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
        BarcodeWidget(
          height: 100,
          width: 150,
          style: const TextStyle(
            color: Colors.white,
          ),
          color: Colors.white,
          barcode: Barcode.code128(),
          data: 'FAB1546',
          errorBuilder: (context, error) => Center(child: Text(error)),
        ),
        const SizedBox(
          height: 10,
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: washes.length,
          itemBuilder: (context, index) {
            final wash = washes[index];
            return ListTile(
              title: Text('Lot No. ${wash.lotNo}'),
              subtitle: Text('Qty: ${wash.quantity.toString()}'),
              trailing: Row(
                children: [
                  Text(
                      '${const Icon(FontAwesomeIcons.arrowUp)} ${DateFormat('dd-MM-yyyy').format(wash.outgoingDate)}'),
                  Text(
                      '${const Icon(FontAwesomeIcons.arrowDown)} ${DateFormat('dd-MM-yyyy').format(wash.incomingDate)}'),
                ],
              ),
            );
          },
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
              'Incoming Date: ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            Text(
              DateFormat('dd-MM-yyyy')
                  .format(selectedIncomingDate.toLocal())
                  .toString(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                // fontSize: 21,
              ),
            ),
            IconButton(
              onPressed: () {
                _selectIncomingDate(context);
              },
              icon: const Icon(
                FontAwesomeIcons.calendar,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 10,
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
              'Outgoing Date: ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            Text(
              DateFormat('dd-MM-yyyy')
                  .format(selectedOutgoingDate.toLocal())
                  .toString(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                // fontSize: 21,
              ),
            ),
            IconButton(
              onPressed: () {
                _selectOutgoingDate(context);
              },
              icon: const Icon(
                FontAwesomeIcons.calendar,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        CustomButtonWidget(
          onTap: addWash,
          text: 'Add to list',
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

  List<Wash> washes = [];

  void addWash() {
    if (lotNoController.text.isEmpty & quantityController.text.isEmpty) {
      return;
    }
    final wash = Wash(
      lotNo: lotNoController.text,
      quantity: int.parse(quantityController.text),
      incomingDate: selectedIncomingDate,
      outgoingDate: selectedOutgoingDate,
    );

    washes.add(wash);

    setState(() {});
  }
}

class Wash {
  final String lotNo;
  final int quantity;
  final DateTime incomingDate;
  final DateTime outgoingDate;

  Wash({
    required this.lotNo,
    required this.quantity,
    required this.incomingDate,
    required this.outgoingDate,
  });
}
