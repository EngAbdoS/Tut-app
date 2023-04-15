import 'package:json_annotation/json_annotation.dart';

part 'responses.g.dart';

@JsonSerializable()
class BaseResponse {
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "message")
  String? message;
}

@JsonSerializable()
class CustomerResponse {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "num_notif")
  int? num_notif;

  CustomerResponse(this.name, this.id, this.num_notif);

  factory CustomerResponse.fromJson(Map<String, dynamic> json) =>
      _$CustomerResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerResponseToJson(this);
}

@JsonSerializable()
class ContactResponse {
  @JsonKey(name: "phone")
  String? phone;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "link")
  String? link;

  ContactResponse(this.link, this.email, this.phone);

  factory ContactResponse.fromJson(Map<String, dynamic> json) =>
      _$ContactResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ContactResponseToJson(this);
}

@JsonSerializable()
class AuthenticationResponse extends BaseResponse {
  @JsonKey(name: "customer")
  CustomerResponse? customer;
  @JsonKey(name: "contacts")
  ContactResponse? contacts;

  AuthenticationResponse(this.contacts, this.customer);

  factory AuthenticationResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationResponseFromJson(json); //why factory
  Map<String, dynamic> toJson() => _$AuthenticationResponseToJson(this);
}

@JsonSerializable()
class ForgotPasswordResponse extends BaseResponse {
  @JsonKey(name: "support")
  String? support;

  ForgotPasswordResponse(this.support);

  factory ForgotPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ForgotPasswordResponseToJson(this);
}
@JsonSerializable()
class ServicesResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "image")
  String? image;

  ServicesResponse(this.id, this.title, this.image);

  factory ServicesResponse.fromJson(Map<String, dynamic> json) =>
      _$ServicesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ServicesResponseToJson(this);
}
@JsonSerializable()
class BannerResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "link")
  String? link;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "image")
  String? image;

  BannerResponse(this.id, this.link, this.title, this.image);

  factory BannerResponse.fromJson(Map<String, dynamic> json) =>
      _$BannerResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BannerResponseToJson(this);
}
@JsonSerializable()
class StoresResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "image")
  String? image;

  StoresResponse(this.id, this.title, this.image);

  factory StoresResponse.fromJson(Map<String, dynamic> json) =>
      _$StoresResponseFromJson(json);

  Map<String, dynamic> toJson() => _$StoresResponseToJson(this);
}


@JsonSerializable()
class HomeDataResponse{

  @JsonKey(name: "services")
  List<ServicesResponse>? services;
  @JsonKey(name: "banners")
  List<BannerResponse>? banners;
  @JsonKey(name: "stores")
  List<StoresResponse>? stores;


  HomeDataResponse(this.services, this.banners, this.stores);

  factory HomeDataResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HomeDataResponseToJson(this);

}


@JsonSerializable()
class HomeResponse extends BaseResponse{
  @JsonKey(name: "data")
  HomeDataResponse? data;

  HomeResponse(this.data);

  factory HomeResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HomeResponseToJson(this);


}