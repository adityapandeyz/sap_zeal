import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:sap_zeal/widgets/cusotm_button_widget.dart';
import 'package:sap_zeal/widgets/custom_textfield_widget.dart';
import 'package:sap_zeal/widgets/custom_page_widget.dart';

import '../widgets/custom_barcode_widget.dart';

class MaterialsPage extends StatefulWidget {
  static const String routeName = "/materials-page";

  const MaterialsPage({super.key});

  @override
  State<MaterialsPage> createState() => _MaterialsPageState();
}

class _MaterialsPageState extends State<MaterialsPage> {
  TextEditingController threadController = TextEditingController();
  TextEditingController threadColorController = TextEditingController();
  TextEditingController threadMeterEachController = TextEditingController();
  TextEditingController threadQtyController = TextEditingController();
  TextEditingController chainController = TextEditingController();
  TextEditingController chainColorController = TextEditingController();
  TextEditingController chainQtyController = TextEditingController();
  TextEditingController buttonController = TextEditingController();
  TextEditingController buttonColorController = TextEditingController();
  TextEditingController buttonQtyController = TextEditingController();
  TextEditingController stringController = TextEditingController();

  TextEditingController elasticController = TextEditingController();
  TextEditingController elasticColorController = TextEditingController();
  TextEditingController elasticQtyController = TextEditingController();
  TextEditingController elasticTypeController = TextEditingController();

  final _rollsFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    threadController.dispose();
    threadColorController.dispose();
    threadMeterEachController.dispose();
    threadQtyController.dispose();
    chainController.dispose();
    chainColorController.dispose();
    chainQtyController.dispose();
    buttonController.dispose();
    buttonColorController.dispose();
    buttonQtyController.dispose();
    stringController.dispose();
    elasticController.dispose();
    elasticColorController.dispose();
    elasticQtyController.dispose();
    elasticTypeController.dispose();

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
      title: "Materials",
      children: [
        const Row(
          children: [
            Text(
              'Materials',
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
        Column(
          children: [
            CustomTextfieldWidget(
              controller: threadController,
              hintText: "Thread",
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Text('|_'),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 180,
                  child: CustomTextfieldWidget(
                    controller: threadColorController,
                    hintText: "Color",
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Text('|_'),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 180,
                  child: CustomTextfieldWidget(
                    controller: threadMeterEachController,
                    hintText: "Meter Each",
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Text('|_'),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 180,
                  child: CustomTextfieldWidget(
                    controller: threadQtyController,
                    hintText: "Quantity",
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
        CustomTextfieldWidget(
          controller: chainController,
          hintText: "Chain",
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            const Text('|_'),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              width: 180,
              child: CustomTextfieldWidget(
                controller: chainColorController,
                hintText: "Color",
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            const Text('|_'),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              width: 180,
              child: CustomTextfieldWidget(
                controller: chainQtyController,
                hintText: "Quantity",
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        CustomTextfieldWidget(
          controller: buttonController,
          hintText: "Button",
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            const Text('|_'),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              width: 180,
              child: CustomTextfieldWidget(
                controller: buttonColorController,
                hintText: "Color",
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            const Text('|_'),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              width: 180,
              child: CustomTextfieldWidget(
                controller: buttonQtyController,
                hintText: "Quantity",
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        CustomTextfieldWidget(
          controller: stringController,
          hintText: "String",
        ),
        const SizedBox(
          height: 10,
        ),
        CustomTextfieldWidget(
          controller: elasticController,
          hintText: "Elastic",
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            const Text('|_'),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              width: 180,
              child: CustomTextfieldWidget(
                controller: elasticColorController,
                hintText: "Color",
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            const Text('|_'),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              width: 180,
              child: CustomTextfieldWidget(
                controller: elasticQtyController,
                hintText: "Quantity",
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        CustomButtonWidget(
          onTap: submitMaterials,
          text: "Submit",
        ),
      ],
    );
  }
}
