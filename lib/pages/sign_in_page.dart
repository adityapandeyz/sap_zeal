import 'package:flutter/material.dart';
import 'package:sap_zeal/constants/global_variables.dart';
import 'package:sap_zeal/pages/rolls_page.dart';
import 'package:sap_zeal/widgets/app_logo_widget.dart';
import 'package:sap_zeal/widgets/cusotm_button_widget.dart';
import 'package:sap_zeal/widgets/custom_textfield_widget.dart';

class SignInPage extends StatefulWidget {
  static const String routeName = "/signIn-page";
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _signInFormKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void signInUser() {
    setState(() {
      _isLoading = true;
    });

    if (_signInFormKey.currentState!.validate()) {
      Navigator.of(context).pushReplacementNamed(RollsPage.routeName);
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
          Form(
            key: _signInFormKey,
            child: Container(
              color: AppColors.backgroundColor,
              height: 340,
              width: 340,
              child: Padding(
                padding: const EdgeInsets.all(21.0),
                child: Column(
                  children: [
                    const AppLogoWidget(),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextfieldWidget(
                      controller: emailController,
                      hintText: "Email",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextfieldWidget(
                      controller: passwordController,
                      hintText: "Password",
                      isPass: true,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButtonWidget(
                      onTap: signInUser,
                      text: "Sign In",
                      isLoading: _isLoading,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
