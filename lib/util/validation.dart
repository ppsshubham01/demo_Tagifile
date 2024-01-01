class Validation {

  static passwordValidate(String? value){
    if (value!.isEmpty) {
      return "Password is required";
    } else if (value.length < 8) {
      return ('length should be at-least 8 character');
    } else if(!value.contains(RegExp(r'[A-Z]'))){
      return "Password not contain at-least one capital letter";
    } else if(!value.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>]'))){
      return "Password not contain at-least one special character";
    }
  }
}