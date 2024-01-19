

class UserdetailsModel {
  Data data;

  UserdetailsModel({
    required this.data,
  });

  UserdetailsModel copyWih({required Data data}) =>
      UserdetailsModel(data: data);
}

class Data {
  Primary? primary;
  Secondary? secondary;

  Data({
    required this.primary,
    required this.secondary,
  });

  Data({required Primary primary, required Secondary secondary}) =>
      Data(primary: primary, secondary: secondary);
}

class Primary {
  dynamic addLineOne;
  dynamic addLineTwo;
  dynamic stateOrProvince;
  dynamic poscodeOrZip;
  dynamic addLat;
  dynamic addLon;
  dynamic country;
  String middleName;
  String gender;
  dynamic dob;
  dynamic phone;
  dynamic city;
  String firstName;
  String lastName;
  String username;
  String email;
  bool loginTwoStep;

  Primary({
    required this.addLineOne,
    required this.addLineTwo,
    required this.stateOrProvince,
    required this.poscodeOrZip,
    required this.addLat,
    required this.addLon,
    required this.country,
    required this.middleName,
    required this.gender,
    required this.dob,
    required this.phone,
    required this.city,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.loginTwoStep,
  });

  Primary({
    dynamic addLineOne,
    dynamic addLineTwo,
    dynamic stateOrProvince,
    dynamic poscodeOrZip,
    dynamic addLat,
    dynamic addLon,
    dynamic country,
    required String middleName,
    required String gender,
    dynamic dob,
    dynamic phone,
    dynamic city,
    required String firstName,
    required String lastName,
    required String username,
    required String email,
    required bool loginTwoStep,
  }) =>
      Primary(
          addLineOne: addLineOne,
          addLineTwo: addLineTwo,
          stateOrProvince: stateOrProvince,
          poscodeOrZip: poscodeOrZip,
          addLat: addLat,
          addLon: addLon,
          country: country,
          middleName: middleName,
          gender: gender,
          dob: dob,
          phone: phone,
          city: city,
          firstName: firstName,
          lastName: lastName,
          username: username,
          email: email,
          loginTwoStep: loginTwoStep);
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
