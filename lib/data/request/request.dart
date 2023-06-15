class LoginRequest{
  String email;
  String password;
  String imei;
  String deviceType;

  LoginRequest(this.email, this.password, this.imei, this.deviceType);
}

class RegisterRequest{
  String email;
  String password;
  String mobileNumber;
  String userName;
  String profilePicture;
  String countryMobileCode;

  RegisterRequest(this.email, this.password, this.mobileNumber,this.userName, this.profilePicture, this.countryMobileCode);
}