import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants/global_variables.dart';

void customPopupWidget({
  required BuildContext context,
  required String title,
  double height = 600,
  required List<Widget> children,
}) async {
  return showDialog<void>(
    context: context,
    builder: (context) => Center(
      child: SizedBox(
        width: 600,
        height: height,
        child: Scaffold(
          backgroundColor: AppColors.backgroundColor,
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // const Text(""),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const FaIcon(FontAwesomeIcons.close),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                ...children,
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
