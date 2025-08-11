class UserModel{

  final String id;
  final String fistName;
  final String lastName;
  final String email;
  final String phone;
  final String avatarUrl;
  final String city;

  factory UserModel.fromJson(Map<String,dynamic> jsonData){
    return UserModel(
        id: jsonData['_id'] ?? '',
        fistName: jsonData['first_name']??'',
        lastName: jsonData['last_name']??'',
        email: jsonData['email']??'',
        phone: jsonData['phone']??'',
        avatarUrl: jsonData['avatar_url']??'',
        city: jsonData['city']??''
    );
  }

  UserModel({
    required this.id,
    required this.fistName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.avatarUrl,
    required this.city
  });

  Map<String,dynamic> toJson(){
    return {
      '_id':id,
      'first_name':fistName,
      'last_name':lastName,
      'email':email,
      'phone':phone,
      'avatar_url':avatarUrl,
      'city':city,
    };
  }
}