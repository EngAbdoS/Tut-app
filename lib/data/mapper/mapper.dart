import 'package:flu_proj/app/constants.dart';
import 'package:flu_proj/app/extensions.dart';
import 'package:flu_proj/data/response/responses.dart';
import 'package:flu_proj/domain/models/models.dart';

extension CustomerResponseMapper on CustomerResponse? {
  Customer toDomain() {
    return Customer(
        this?.id.orEmpty() ?? Constants.empty,
        this?.num_notif.orZero() ?? Constants.zero,
        this?.name.orEmpty() ?? Constants.empty); //what does onEmpty do 🤦
  }
}

extension ContactResponseMapper on ContactResponse? {
  Contacts toDomain() {
    return Contacts(
        this?.phone.orEmpty() ?? Constants.empty,
        this?.email.orEmpty() ?? Constants.empty,
        this?.link.orEmpty() ?? Constants.empty); //what does onEmpty do 🤦
  }
}

extension AuthrnticationResponseMapper on AuthenticationResponse? {
  Authentication toDomain() {
    return Authentication(
        this?.contacts.toDomain(), this?.customer.toDomain()); //what does onEmpty do 🤦
  }

}


extension ForgotPasswordResponseMapper on ForgotPasswordResponse?{

String toDomain(){
  return this?.support?.orEmpty()??Constants.empty;


}

}

