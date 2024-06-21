import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sap_zeal/constants/global_variables.dart';
import 'package:sap_zeal/pages/costing_page.dart';
import 'package:sap_zeal/pages/cutting_page.dart';
import 'package:sap_zeal/pages/ledger_page.dart';
import 'package:sap_zeal/pages/taki_kaanch_button_page.dart';
import 'package:sap_zeal/pages/materials_page.dart';
import 'package:sap_zeal/pages/rolls_page.dart';
import 'package:sap_zeal/pages/sign_in_page.dart';
import 'package:sap_zeal/pages/stitching_page.dart';
import 'package:sap_zeal/pages/washing_page.dart';
import 'package:sap_zeal/widgets/app_logo_widget.dart';

import '../pages/printing_page.dart';

class CustomPageWidget extends StatelessWidget {
  final String title;
  final List<Widget> children;
  CustomPageWidget({
    super.key,
    required this.title,
    required this.children,
  });

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const AppLogoWidget(
              size: 18,
            ),
            Text(
              ' | $title',
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              menu(context);
            },
            icon: const FaIcon(
              FontAwesomeIcons.windows,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, SignInPage.routeName, (route) => false);
            },
            icon: const FaIcon(
              FontAwesomeIcons.powerOff,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Image.network(
                AppConstants.backroundImage,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: 600,
              // height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                color: AppColors.backgroundColor,
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: children,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void menu(context) async {
    await showDialog<void>(
      context: context,
      builder: (context) => Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Container(
          width: double.infinity,
          // decoration: const BoxDecoration(
          //   color: AppColors.backgroundColor,
          // ),
          alignment: Alignment.centerLeft,
          child: SingleChildScrollView(
            child: Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                // height: MediaQuery.of(context).size.height * 0.6,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const FaIcon(
                            FontAwesomeIcons.close,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GridView.count(
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount:
                            MediaQuery.of(context).size.width < 800 ? 1 : 4,
                        mainAxisSpacing: 40,
                        crossAxisSpacing: 40,
                        shrinkWrap: true,
                        children: const [
                          CustomSquareButtonWidget(
                            title: 'Rolls',
                            routeName: RollsPage.routeName,
                          ),
                          CustomSquareButtonWidget(
                            title: 'Materials',
                            routeName: MaterialsPage.routeName,
                          ),
                          CustomSquareButtonWidget(
                            title: 'Cutting',
                            routeName: CuttingPage.routeName,
                          ),
                          CustomSquareButtonWidget(
                            title: 'Printing',
                            routeName: PrintingPage.routeName,
                          ),
                          CustomSquareButtonWidget(
                            title: 'Stitching',
                            routeName: StitchingPage.routeName,
                          ),
                          CustomSquareButtonWidget(
                            title: 'Taki/Kaanch/Button',
                            routeName: TakiKaanchButtonPage.routeName,
                          ),
                          CustomSquareButtonWidget(
                            title: 'Washing',
                            routeName: WashingPage.routeName,
                          ),
                          CustomSquareButtonWidget(
                            title: 'Ledger',
                            routeName: LedgerPage.routeName,
                          ),
                          CustomSquareButtonWidget(
                            title: 'Costing',
                            routeName: CostingPage.routeName,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomSquareButtonWidget extends StatelessWidget {
  final String title;
  final String routeName;
  const CustomSquareButtonWidget({
    required this.title,
    super.key,
    required this.routeName,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamedAndRemoveUntil(
          context, routeName, (route) => false),
      child: Container(
        alignment: AlignmentDirectional.center,
        color: AppColors.secondaryColor,
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
