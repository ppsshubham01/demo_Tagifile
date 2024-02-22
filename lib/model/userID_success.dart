class UserIdSuccess {
  Data? data;

  UserIdSuccess({
    this.data,
  });

  factory UserIdSuccess.fromJson(Map<String, dynamic> json) {
    return UserIdSuccess(
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String token;
  User user;
  int isAccountVerified;

  Data({
    required this.token,
    required this.user,
    required this.isAccountVerified,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      token: json['token'],
      user: User.fromJson(json['user']),
      isAccountVerified: json['is_account_verified'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'token': this.token,
      'user': this.user.toJson(),
      'is_account_verified': this.isAccountVerified,
    };
    return data;
  }
}

class User {
  int id;
  dynamic lastLogin;
  bool isSuperuser;
  String username;
  String firstName;
  String lastName;
  String email;
  bool isStaff;
  bool isActive;
  DateTime dateJoined;

  User({
    required this.id,
    required this.lastLogin,
    required this.isSuperuser,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.isStaff,
    required this.isActive,
    required this.dateJoined,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      lastLogin: json['last_login'],
      isSuperuser: json['is_superuser'],
      username: json['username'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      isStaff: json['is_staff'],
      isActive: json['is_active'],
      dateJoined: DateTime.parse(json['date_joined']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'id': this.id,
      'last_login': this.lastLogin,
      'is_superuser': this.isSuperuser,
      'username': this.username,
      'first_name': this.firstName,
      'last_name': this.lastName,
      'email': this.email,
      'is_staff': this.isStaff,
      'is_active': this.isActive,
      'date_joined': this.dateJoined.toIso8601String(),
    };
    return data;
  }
}
