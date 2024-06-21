import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sap_zeal/pages/sign_in_page.dart';
import 'package:sap_zeal/widgets/app_logo_widget.dart';

import '../constants/global_variables.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    loadDataAndNavigate();
  }

  Future<void> loadDataAndNavigate() async {
    await Future.delayed(const Duration(seconds: 6));
    Navigator.pushReplacement(
      context,
      PageTransition(
        type: PageTransitionType.leftToRightWithFade,
        child: const SignInPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              color: AppColors.backgroundColor,
              height: 340,
              width: 340,
              child: const AppLogoWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
