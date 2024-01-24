import '../../resources/exports/index.dart';

class Session {
  String? tokenId;
  UserModel? user;

  Session({
    this.tokenId,
    this.user,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'access_token': tokenId,
      'user': user?.toJson(),
    };
  }

  factory Session.fromJson(Map<String, dynamic> json) {
    return Session(
      tokenId:
          json['access_token'] != null ? json['access_token'] as String : null,
      user: json['user'] != null
          ? UserModel.fromJson(json['user'] as Map<String, dynamic>)
          : null,
    );
  }

  Session copyWith({
    String? tokenId,
    UserModel? user,
    String? userSelectedLanguage,
  }) {
    return Session(
      tokenId: tokenId ?? this.tokenId,
      user: user ?? this.user,
    );
  }

  @override
  String toString() => 'Session(tokenId: $tokenId, user: $user)';
}
