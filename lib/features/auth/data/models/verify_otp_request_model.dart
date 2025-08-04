class VeridyOtpRequestModel {
  final String email;
  final String otp;

  VeridyOtpRequestModel({
    required this.email,
    required this.otp
  });
  Map<String,dynamic> toJson(){
    return{
      'email': email,
      'otp': otp
    };
  }
}