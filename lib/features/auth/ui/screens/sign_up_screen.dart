import 'package:ecommerce_crafty_bay_live/core/ui/widgets/snack_bar_message.dart';
import 'package:ecommerce_crafty_bay_live/features/auth/data/models/sign_up_request_model.dart';
import 'package:ecommerce_crafty_bay_live/features/auth/ui/controller/sign_up_controller.dart';
import 'package:ecommerce_crafty_bay_live/features/auth/ui/screens/verify_otp_screen.dart';
import 'package:ecommerce_crafty_bay_live/features/auth/ui/widgets/app_logo.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/ui/widgets/centeres_circular_progress-indicator.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static final String name = '/signUp';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _cityTEController = TextEditingController();
  final TextEditingController _addressTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final SignUpController _signUpController = Get.find<SignUpController>();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  SizedBox(
                    height: 8,
                  ),
                  AppLogo(),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Register Account",
                    style: textTheme.titleLarge,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    "Get Started With us with your details",
                    style: textTheme.headlineMedium,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: _emailTEController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      hintText: "Email Address",
                    ),
                    validator: (String? value) {
                      String emailValue = value ?? '';
                      if (EmailValidator.validate(emailValue) == false) {
                        return "Enter a valid email";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: _firstNameTEController,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      hintText: "FirstName",
                    ),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return "Enter your First Name";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: _lastNameTEController,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      hintText: "LastName",
                    ),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return "Enter your Last Name";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                      controller: _mobileTEController,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: "Mobile",
                      ),
                      validator: (String? value) {
                        String phone = value?.trim() ?? '';
                        RegExp regExp =
                            RegExp(r"^(?:\+?88|0088)?01[15-9]\d{8}$");
                        //RegExp regExp = RegExp(r"^(?:\+?88|0088)?01[15-9]\d{8}$");
                        if (regExp.hasMatch(phone) == false) {
                          return "Enter your valid mobile number";
                        }
                        return null;
                      }),
                  SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: _cityTEController,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      hintText: "City",
                    ),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return "Enter your City Name";
                      }
                    },
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: _addressTEController,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(16),
                      hintText: "Shipping Address",
                    ),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return "Enter your Shipping Address";
                      }
                    },
                    maxLines: 3,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: _passwordTEController,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      hintText: "Password",
                    ),
                    validator: (String? value) {
                      if ((value?.length ?? 0) <= 6) {
                        return "Enter a password at least 6 letters";
                      }
                      return null;
                    },
                    // obscureText: true,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  GetBuilder<SignUpController>(builder: (_) {
                    return Visibility(
                      visible: _signUpController.inProgress == false,
                        replacement: CenteredCirclarProgressIndicator(),
                        child: ElevatedButton(
                            onPressed: _onTapSignUpButton,
                            child: Text("SignUp")));
                  }),
                  SizedBox(
                    height: 32,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTapSignUpButton() async {
    if (_formKey.currentState!.validate()) {
      final SignUpRequestModel model = SignUpRequestModel(
          email: _emailTEController.text.trim(),
          firstName: _firstNameTEController.text.trim(),
          lastName: _firstNameTEController.text.trim(),
          password: _passwordTEController.text,
          city: _cityTEController.text.trim(),
          phone: _mobileTEController.text.trim());
      final bool isSuccess = await _signUpController.signUp(model);
      if (isSuccess) {
        showSnackBarMessage(context, _signUpController.message);
        Navigator.pushNamed(context, VerifyOtpScreen.name,arguments: _emailTEController.text.trim());
      } else {
        showSnackBarMessage(context, _signUpController.errorMessage!, true);
      }
    }
  }

  @override
  void dispose() {
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _emailTEController.dispose();
    _mobileTEController.dispose();
    _cityTEController.dispose();
    _addressTEController.dispose();
    _passwordTEController.dispose();

    super.dispose();
  }
}


