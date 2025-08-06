import 'package:ecommerce_crafty_bay_live/core/ui/widgets/centeres_circular_progress-indicator.dart';
import 'package:ecommerce_crafty_bay_live/core/ui/widgets/snack_bar_message.dart';
import 'package:ecommerce_crafty_bay_live/features/auth/data/models/login_request_model.dart';
import 'package:ecommerce_crafty_bay_live/features/auth/ui/controller/login_controller.dart';
import 'package:ecommerce_crafty_bay_live/features/auth/ui/screens/sign_up_screen.dart';
import 'package:ecommerce_crafty_bay_live/features/auth/ui/widgets/app_logo.dart';
import 'package:ecommerce_crafty_bay_live/features/common/ui/screens/main_bottom_nav_screen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static final String name = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final LoginController _loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 80,
                  ),
                  AppLogo(
                    width: 90,
                    height: 90,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Welcome Back",
                    style: textTheme.titleLarge,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    "Please Enter Your Email & password",
                    style: textTheme.headlineMedium,
                  ),
                  SizedBox(
                    height: 24,
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
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  GetBuilder<LoginController>(
                    builder: (controller) {
                      return Visibility(
                        visible: controller.inProgress == false,
                        replacement: CenteredCirclarProgressIndicator(),
                        child: ElevatedButton(
                          onPressed: _onTapLoginButton,
                          child: Text("Login"),
                        ),
                      );
                    }
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  
  
  Future<void> _onTapLoginButton() async {
    if(_formKey.currentState!.validate()){
      LoginRequestModel model = LoginRequestModel(email: _emailTEController.text.trim(), password: _passwordTEController.text);
      final bool isSuccess = await _loginController.login(model);
      if(isSuccess){
        Navigator.pushNamedAndRemoveUntil(context, MainBottomNavScreen.name, (predicate)=>false);
      }else{
        showSnackBarMessage(context, _loginController.errorMessage!,true);
      }
    }

  }
  
  @override
  void dispose() {
    super.dispose();
    _emailTEController.dispose();
    _passwordTEController.dispose();
  }
  
  
}
