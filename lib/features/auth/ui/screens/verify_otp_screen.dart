import 'package:ecommerce_crafty_bay_live/app/app_colors.dart';
import 'package:ecommerce_crafty_bay_live/core/ui/widgets/centeres_circular_progress-indicator.dart';
import 'package:ecommerce_crafty_bay_live/core/ui/widgets/snack_bar_message.dart';
import 'package:ecommerce_crafty_bay_live/features/auth/data/models/verify_otp_request_model.dart';
import 'package:ecommerce_crafty_bay_live/features/auth/ui/controller/verify_otp_controller.dart';
import 'package:ecommerce_crafty_bay_live/features/auth/ui/screens/sign_up_screen.dart';
import 'package:ecommerce_crafty_bay_live/features/auth/ui/widgets/app_logo.dart';
import 'package:ecommerce_crafty_bay_live/features/common/ui/screens/main_bottom_nav_screen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key, required this.email});

  final String email;

  static final String name = '/verify-otp';

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final TextEditingController _otpTEController = TextEditingController();
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
                    "Enter OTP Code",
                    style: textTheme.titleLarge,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    "A 4 digit OTP code has been sent to your ${widget.email}",
                    textAlign: TextAlign.center,
                    style: textTheme.headlineMedium,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  PinCodeTextField(
                    controller: _otpTEController,
                    length: 4,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    animationDuration: Duration(milliseconds: 300),
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    keyboardType: TextInputType.number,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      fieldHeight: 60,
                      fieldWidth: 50,
                    ),
                    appContext: context,
                    validator: (String ? value){
                      if(value == null || value.length<4){
                        return 'Enter your Otp';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  GetBuilder<VerifyOtpController>(
                    builder: (controller) {
                      return Visibility(
                        visible: controller.inProgress == false,
                        replacement: CenteredCirclarProgressIndicator(),
                        child: ElevatedButton(
                          onPressed: _onTapLoginButton,
                          child: Text("Verify"),
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
     VeriyOtpRequestModel model = VeriyOtpRequestModel(email: widget.email, otp: _otpTEController.text);
     final bool isSuccess = await Get.find<VerifyOtpController>().verisyOtp(model);
     if(isSuccess){
       Navigator.pushNamedAndRemoveUntil(context, MainBottomNavScreen.name, (predicate)=>false);
     }else{
       showSnackBarMessage(context, Get.find<VerifyOtpController>().errorMessage!,true);
     }
    }
  }

  @override
  void dispose() {
    super.dispose();
    _otpTEController.dispose();
  }


}
