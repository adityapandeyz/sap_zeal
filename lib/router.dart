import 'package:flutter/material.dart';
import 'package:sap_zeal/pages/costing_page.dart';
import 'package:sap_zeal/pages/cutting_page.dart';
import 'package:sap_zeal/pages/taki_kaanch_button_page.dart';
import 'package:sap_zeal/pages/materials_page.dart';
import 'package:sap_zeal/pages/printing_page.dart';
import 'package:sap_zeal/pages/rolls_page.dart';
import 'package:sap_zeal/pages/sign_in_page.dart';
import 'package:sap_zeal/pages/stitching_page.dart';
import 'package:sap_zeal/pages/washing_page.dart';

import 'pages/ledger_page.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case SignInPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const SignInPage(),
      );

    case RollsPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const RollsPage(),
      );

    case MaterialsPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const MaterialsPage(),
      );

    case CuttingPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const CuttingPage(),
      );

    case PrintingPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const PrintingPage(),
      );

    case StitchingPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const StitchingPage(),
      );

    case TakiKaanchButtonPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const TakiKaanchButtonPage(),
      );

    case WashingPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const WashingPage(),
      );

    case LedgerPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const LedgerPage(),
      );

    case CostingPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const CostingPage(),
      );

    default:
      return MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Error 404!'),
          ),
        ),
      );
  }
}
