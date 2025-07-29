import 'package:ecommerce_crafty_bay_live/app/app_colors.dart';
import 'package:ecommerce_crafty_bay_live/features/auth/ui/screens/sign_up_screen.dart';
import 'package:ecommerce_crafty_bay_live/features/auth/ui/widgets/app_logo.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

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
                  ElevatedButton(
                    onPressed: _onTapLoginButton,
                    child: Text("Login"),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  
  
  void _onTapLoginButton(){
    //if(_formKey.currentState!.validate()){}
    Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));
  }
  
  @override
  void dispose() {
    super.dispose();
    _emailTEController.dispose();
    _passwordTEController.dispose();
  }
  
  
}
