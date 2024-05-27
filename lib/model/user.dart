class MyUser {
  MyUser({
    required this.userName,
    required this.userEmail,
    required this.userPhoneNumber,
    required this.address,
    this.avatar,
  });

  final String userName;
  final String userEmail;
  final String userPhoneNumber;
  final Map<String, String> address;
  final int? avatar;

  factory MyUser.fromJson(Map<dynamic, dynamic> json) {
    return MyUser(
      userName: json['userName'] as String,
      userEmail: json['userEmail'] as String,
      userPhoneNumber: json['userPhoneNumber'] as String,
      address: Map<String, String>.from(json['address'] as Map),
      avatar: json['avatar'] != null ? json['avatar'] as int : null,
    );
  }

  Map<String, dynamic> toJson() {
    final data = {
      'userName': userName,
      'userEmail': userEmail,
      'userPhoneNumber': userPhoneNumber,
      'address': address,
    };
    return data;
  }
}
