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
    return Authentication(this?.contacts.toDomain(),
        this?.customer.toDomain()); //what does onEmpty do 🤦
  }
}

extension ForgotPasswordResponseMapper on ForgotPasswordResponse? {
  String toDomain() {
    return this?.support?.orEmpty() ?? Constants.empty;
  }
}

extension ServiceResponseMapper on ServicesResponse? {
  Service toDomain() {
    return Service(this?.id.orZero() ??Constants.zero, this?.title.orEmpty() ?? Constants.empty,
        this?.image.orEmpty() ??  Constants.empty);
  }
}

extension BannerResponseMapper on BannerResponse? {
  Banners toDomain() {
    return Banners(this?.id.orZero() ?? Constants.zero, this?.link.orEmpty() ??  Constants.empty,
        this?.title.orEmpty() ??  Constants.empty, this?.image.orEmpty() ??  Constants.empty);
  }
}

extension StoreResponseMapper on StoresResponse? {
  Stores toDomain() {
    return Stores(this?.id.orZero() ?? Constants.zero, this?.title.orEmpty() ??  Constants.empty,
        this?.image.orEmpty() ??  Constants.empty);
  }
}

extension HomeResponseMapper on HomeResponse? {
  HomeObject toDomain() {
    List<Service> services = (this?.data?.services?.map((e) => e.toDomain()) ??
            const Iterable.empty())
        .cast<Service>()
        .toList();
    List<Banners> banners = (this?.data?.banners?.map((e) => e.toDomain()) ??
            const Iterable.empty())
        .cast<Banners>()
        .toList();
    List<Stores> stores =
        (this?.data?.stores?.map((e) => e.toDomain()) ?? const Iterable.empty())
            .cast<Stores>()
            .toList();
    var data = HomeData(services, banners, stores);
    return HomeObject(data);
  }
}
