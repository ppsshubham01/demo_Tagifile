

class UserdetailsModel {
  Data? data;

  UserdetailsModel({
     this.data,
  });

  UserdetailsModel copyWih({required Data data}) =>
      UserdetailsModel(data: data);

  Map<String, dynamic> toJson() => {
    'data': data?.toJson(),
  };

  factory UserdetailsModel.fromJson(Map<String, dynamic> json) =>
      UserdetailsModel(
        data: Data.fromJson(json['data']),
      );

}

class Data {
  Primary? primary;
  Secondary? secondary;

  Data({
    required this.primary,
    required this.secondary,
  });

  Map<String, dynamic> toJson() => {
    'primary': primary?.toJson(),
    'secondary': secondary?.toJson(),
  };

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    primary: Primary.fromJson(json['primary']),
    secondary: Secondary.fromJson(json['secondary']),
  );


}

class Primary {
  dynamic addLineOne;
  dynamic addLineTwo;
  dynamic stateOrProvince;
  dynamic poscodeOrZip;
  dynamic addLat;
  dynamic addLon;
  dynamic country;
  String? middleName;
  String? gender;
  dynamic dob;
  dynamic phone;
  dynamic city;
  String? firstName;
  String? lastName;
  String? username;
  String? email;
  bool? loginTwoStep;

  Primary({
    required this.addLineOne,
    required this.addLineTwo,
    required this.stateOrProvince,
    required this.poscodeOrZip,
    required this.addLat,
    required this.addLon,
    required this.country,
     this.middleName,
     this.gender,
    required this.dob,
    required this.phone,
    required this.city,
     this.firstName,
     this.lastName,
     this.username,
     this.email,
     this.loginTwoStep,
  });

  Map<String, dynamic> toJson() => {
    'add_line_one': addLineOne,
    'add_line_two': addLineTwo,
    'state_or_province': stateOrProvince,
    'poscode_or_zip': poscodeOrZip,
    'add_lat': addLat,
    'add_lon': addLon,
    'country': country,
    'middle_name': middleName,
    'gender': gender,
    'dob': dob,
    'phone': phone,
    'city': city,
    'first_name': firstName,
    'last_name': lastName,
    'username': username,
    'email': email,
    'login_two_step': loginTwoStep,
  };

  factory Primary.fromJson(Map<String, dynamic> json) => Primary(
    addLineOne: json['add_line_one'],
    addLineTwo: json['add_line_two'],
    stateOrProvince: json['state_or_province'],
    poscodeOrZip: json['poscode_or_zip'],
    addLat: json['add_lat'],
    addLon: json['add_lon'],
    country: json['country'],
    middleName: json['middle_name'],
    gender: json['gender'],
    dob: json['dob'],
    phone: json['phone'],
    city: json['city'],
    firstName: json['first_name'],
    lastName: json['last_name'],
    username: json['username'],
    email: json['email'],
    loginTwoStep: json['login_two_step'],
  );
}


class Secondary {
  dynamic maritalStatus;
  List<dynamic> work;
  List<dynamic> education;
  String religion;
  List<dynamic> languages;
  List<dynamic> interests;
  List<dynamic> business;
  List<dynamic> occupation;

  Secondary({
    required this.maritalStatus,
    required this.work,
    required this.education,
    required this.religion,
    required this.languages,
    required this.interests,
    required this.business,
    required this.occupation,
  });

  Secondary copyWith({
    dynamic maritalStatus,
    required List<dynamic> work,
    required List<dynamic> education,
    required String religion,
    required List<dynamic> languages,
    required List<dynamic> interests,
    required List<dynamic> business,
    required List<dynamic> occupation,
  }) =>
      Secondary(
          maritalStatus: maritalStatus,
          work: work,
          education: education,
          religion: religion,
          languages: languages,
          interests: interests,
          business: business,
          occupation: occupation);

  Map<String, dynamic> toJson() => {
    'marital_status': maritalStatus,
    'work': work,
    'education': education,
    'religion': religion,
    'languages': languages,
    'interests': interests,
    'business': business,
    'occupation': occupation,
  };

  factory Secondary.fromJson(Map<String, dynamic> json) => Secondary(
    maritalStatus: json['marital_status'],
    work: List<dynamic>.from(json['work']),
    education: List<dynamic>.from(json['education']),
    religion: json['religion'],
    languages: List<dynamic>.from(json['languages']),
    interests: List<dynamic>.from(json['interests']),
    business: List<dynamic>.from(json['business']),
    occupation: List<dynamic>.from(json['occupation']),
  );


}

// {
// "data": {
// "primary": {
// "add_line_one": null,
// "add_line_two": null,
// "state_or_province": null,
// "poscode_or_zip": null,
// "add_lat": null,
// "add_lon": null,
// "country": null,
// "middle_name": "",
// "gender": "",
// "dob": null,
// "phone": null,
// "city": null,
// "first_name": "jahangir",
// "last_name": "gavar",
// "username": "unruffleddewdney",
// "email": "gavar@gmail.com",
// "login_two_step": false
// },
// "secondary": {
// "marital_status": null,
// "work": [],
// "education": [],
// "religion": "",
// "languages": [],
// "interests": [],
// "business": [],
// "occupation": []
// }
// }
