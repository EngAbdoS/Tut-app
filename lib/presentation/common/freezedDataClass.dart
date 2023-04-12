import 'package:freezed_annotation/freezed_annotation.dart';

part 'freezedDataClass.freezed.dart';

@freezed
class LoginObject with _$LoginObject{//freezed data class
  factory LoginObject(String userName,String password)=_LoginOblect;


}
@freezed
class RegisterObject with _$RegisterObject{//freezed data class
  factory RegisterObject(  String email,
  String password,
  String userName,
  String countryMobileCode,
  String mobileNumber,
  String profilePicture)=_RegisterObject;


}