import 'package:flutter/material.dart';
import 'package:sap_zeal/widgets/cusotm_button_widget.dart';

import 'package:sap_zeal/widgets/custom_page_widget.dart';
import 'package:sap_zeal/widgets/custom_popup_widget.dart';
import 'package:sap_zeal/widgets/custom_textfield_widget.dart';

// all ledger, item ledger(create, alter), fabric ledger(create, alter), tailoring ledger(create, alter), material ledger, etc

class LedgerPage extends StatefulWidget {
  static const String routeName = "/ledger-page";

  const LedgerPage({super.key});

  @override
  State<LedgerPage> createState() => _LedgerPageState();
}

class _LedgerPageState extends State<LedgerPage> {
  final _rollsFormKey = GlobalKey<FormState>();
  final TextEditingController ledgerCostController = TextEditingController();
  final TextEditingController ledgerDescriptionController =
      TextEditingController();

  @override
  void dispose() {
    ledgerCostController.dispose();
    ledgerDescriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPageWidget(
      title: "Ledger",
      children: [
        const Row(
          children: [
            Text(
              'Ledger',
              style: TextStyle(
                fontSize: 22,
                color: Colors.white,
              ),
            ),
          ],
        ),

// all ledger, item ledger(create, alter), fabric ledger(create, alter), tailoring ledger(create, alter), material ledger, etc

        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            const Text(
              'Item Ledger Entries:',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),

            // create
            IconButton(
              onPressed: () {
                showCreateLedgerDialog(
                  ledgerType: LedgerType.item,
                );
              },
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: itemLedgerList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('Item Ledger Entry ${index + 1}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Description ${itemLedgerList[index].itemDescription}'),
                  Text('Rs. ${itemLedgerList[index].itemCost}'),
                ],
              ),
              trailing: IconButton(
                onPressed: () {
                  // alter
                },
                icon: const Icon(Icons.edit),
              ),
            );
          },
        ),

        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            const Text(
              'Fabric Ledger Entries:',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),

            // create
            IconButton(
              onPressed: () {
                showCreateLedgerDialog(
                  ledgerType: LedgerType.fabric,
                );
              },
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: fabricLedgerList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('Fabric Ledger Entry ${index + 1}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                      'Description ${fabricLedgerList[index].itemDescription}'),
                  Text('Rs. ${fabricLedgerList[index].itemCost}'),
                ],
              ),
              trailing: IconButton(
                onPressed: () {
                  // alter
                },
                icon: const Icon(Icons.edit),
              ),
            );
          },
        ),

        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            const Text(
              'Tailoring Ledger Entries:',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),

            // create
            IconButton(
              onPressed: () {
                showCreateLedgerDialog(
                  ledgerType: LedgerType.tailoring,
                );
              },
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: tailoringLedgerList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('Tailoring Ledger Entry ${index + 1}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                      'Description ${tailoringLedgerList[index].itemDescription}'),
                  Text('Rs. ${tailoringLedgerList[index].itemCost}'),
                ],
              ),
              trailing: IconButton(
                onPressed: () {
                  // alter
                },
                icon: const Icon(Icons.edit),
              ),
            );
          },
        ),

        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            const Text(
              'Material Ledger Entries:',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),

            // create
            IconButton(
              onPressed: () {
                showCreateLedgerDialog(
                  ledgerType: LedgerType.material,
                );
              },
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: materialLedgerList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('Material Ledger Entry ${index + 1}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                      'Description ${materialLedgerList[index].itemDescription}'),
                  Text('Rs. ${materialLedgerList[index].itemCost}'),
                ],
              ),
              trailing: IconButton(
                onPressed: () {
                  // alter
                },
                icon: const Icon(Icons.edit),
              ),
            );
          },
        ),
      ],
    );
  }

  final List<Ledger> itemLedgerList = [];
  final List<Ledger> fabricLedgerList = [];
  final List<Ledger> tailoringLedgerList = [];
  final List<Ledger> materialLedgerList = [];

  showCreateLedgerDialog({required LedgerType ledgerType}) {
    customPopupWidget(
      context: context,
      title: 'Ledger ENtry',
      height: 280,
      children: [
        Form(
          key: _rollsFormKey,
          child: SizedBox(
            width: 300,
            child: Column(
              children: [
                CustomTextfieldWidget(
                  controller: ledgerDescriptionController,
                  hintText: 'Ledger Description',
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextfieldWidget(
                  controller: ledgerCostController,
                  hintText: 'Ledger Cost',
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomButtonWidget(
                  onTap: () {
                    if (_rollsFormKey.currentState!.validate()) {
                      if (LedgerType.item == ledgerType) {
                        // create item ledger
                        itemLedgerList.add(
                          Ledger(
                            itemDescription: ledgerDescriptionController.text,
                            itemCost: double.parse(ledgerCostController.text),
                          ),
                        );
                      } else if (LedgerType.fabric == ledgerType) {
                        // create fabric ledger
                        fabricLedgerList.add(
                          Ledger(
                            itemDescription: ledgerDescriptionController.text,
                            itemCost: double.parse(ledgerCostController.text),
                          ),
                        );
                      } else if (LedgerType.tailoring == ledgerType) {
                        // create tailoring ledger
                        tailoringLedgerList.add(
                          Ledger(
                            itemDescription: ledgerDescriptionController.text,
                            itemCost: double.parse(ledgerCostController.text),
                          ),
                        );
                      } else if (LedgerType.material == ledgerType) {
                        // create material ledger
                        materialLedgerList.add(
                          Ledger(
                            itemDescription: ledgerDescriptionController.text,
                            itemCost: double.parse(ledgerCostController.text),
                          ),
                        );
                      }
                    }
                  },
                  text: 'Add',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class Ledger {
  final String itemDescription;
  final double itemCost;

  Ledger({
    required this.itemDescription,
    required this.itemCost,
  });
}

enum LedgerType {
  item,
  fabric,
  tailoring,
  material,
}
