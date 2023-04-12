class LoginRequest {
  String email;
  String password;

  LoginRequest(this.email, this.password);
}

class RegisterRequest {
  String email;
  String password;
  String userName;
  String countryMobileCode;
  String mobileNumber;
  String profilePicture;

  RegisterRequest(this.userName, this.email, this.password,
      this.countryMobileCode, this.mobileNumber, this.profilePicture);
}
