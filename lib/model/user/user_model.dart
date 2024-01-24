class UserModel {
  int? userID;
  String? name;
  String? email;
  String? phone;
  String? profile;
  String? isoCode;
  String? dialCode;

  UserModel({
    this.userID,
    this.name,
    this.email,
    this.phone,
    this.profile,
    this.isoCode,
    this.dialCode,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'userID': userID,
      'name': name,
      'email': email,
      'phone': phone,
      'iso_code': isoCode,
      'dial_code': dialCode,
      'profile': profile,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userID: json['userID'] as int?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      isoCode: json['iso_code'] as String?,
      dialCode: json['dial_code'] as String?,
      profile: json['profile'] as String?,
    );
  }

  UserModel copyWith({
    int? userID,
    String? name,
    String? email,
    String? phone,
    String? profile,
    String? isoCode,
    String? dialCode,
  }) {
    return UserModel(
      userID: userID ?? this.userID,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      isoCode: isoCode ?? this.isoCode,
      dialCode: dialCode ?? this.dialCode,
      profile: profile ?? this.profile,
    );
  }

  @override
  String toString() {
    return 'UserModel(userID: $userID, name: $name, email: $email, phone: $phone, profile: $profile, isoCode: $isoCode, dialCode: $dialCode)';
  }
}
