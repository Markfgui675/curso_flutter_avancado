import 'package:curso_flutter_avancado/data/responses/responses.dart';
import 'package:json_annotation/json_annotation.dart';
part 'responses.g.dart';

@JsonSerializable()
class BaseResponse{

  @JsonKey(name: "status")
  int? status;

  @JsonKey(name: "message")
  String? message;

}

@JsonSerializable()
class CustomerResponse{

  @JsonKey(name: "id")
  String? id;

  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "numOfNotifications")
  int? numOfNotifications;

  CustomerResponse(this.id, this.name,
      this.numOfNotifications);

  factory CustomerResponse.fromJson(Map<String, dynamic> json) =>
      _$CustomerResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerResponseToJson(this);
}

@JsonSerializable()
class ContactsResponse{

  @JsonKey(name: "phone")
  String? phone;

  @JsonKey(name: "link")
  String? link;

  @JsonKey(name: "email")
  String? email;

  ContactsResponse(this.email, this.phone, this.link);

  factory ContactsResponse.fromJson(Map<String, dynamic> json) =>
      _$ContactsResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ContactsResponseToJson(this);

}

@JsonSerializable()
class AuthenticationResponse extends BaseResponse{

  @JsonKey(name: "customer")
  CustomerResponse? customer;

  @JsonKey(name: "contacts")
  ContactsResponse? contacts;

  AuthenticationResponse(this.customer, this.contacts);
  // from json
  factory AuthenticationResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationResponseFromJson(json);

  // to json
  Map<String, dynamic> toJson() => _$AuthenticationResponseToJson(this);

}

@JsonSerializable()
class ForgotPasswordResponse extends BaseResponse {

  @JsonKey(name:"support")
  String? support;

  ForgotPasswordResponse(this.support);

  //to json
  Map<String, dynamic> toJson() => _$ForgotPasswordResponseToJson(this);

  //fromJson
  factory ForgotPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordResponseFromJson(json);

}







@JsonSerializable()
class ServiceResponse{

  @JsonKey(name:"id")
  int? id;
  @JsonKey(name:"title")
  String? title;
  @JsonKey(name:"image")
  String? image;

  ServiceResponse(this.id, this.title, this.image);

  Map<String, dynamic> toJson() => _$ServiceResponseToJson(this);

  factory ServiceResponse.fromJson(Map<String, dynamic> json) =>
      _$ServiceResponseFromJson(json);

}

@JsonSerializable()
class StoreResponse{

  @JsonKey(name:"id")
  int? id;
  @JsonKey(name:"title")
  String? title;
  @JsonKey(name:"image")
  String? image;

  StoreResponse(this.id, this.title, this.image);

  Map<String, dynamic> toJson() => _$StoreResponseToJson(this);

  factory StoreResponse.fromJson(Map<String, dynamic> json) =>
      _$StoreResponseFromJson(json);

}

@JsonSerializable()
class BannersResponse{

  @JsonKey(name:"id")
  int? id;
  @JsonKey(name:"title")
  String? title;
  @JsonKey(name:"image")
  String? image;
  @JsonKey(name:"link")
  String? link;

  BannersResponse(this.id, this.title, this.image, this.link);

  Map<String, dynamic> toJson() => _$BannersResponseToJson(this);

  factory BannersResponse.fromJson(Map<String, dynamic> json) =>
      _$BannersResponseFromJson(json);

}

@JsonSerializable()
class HomeDataResponse{

  @JsonKey(name:"services")
  List<ServiceResponse>? services;
  @JsonKey(name:"stores")
  List<StoreResponse>? stores;
  @JsonKey(name:"banners")
  List<BannersResponse>? banners;


  HomeDataResponse(this.services, this.stores, this.banners);

  Map<String, dynamic> toJson() => _$HomeDataResponseToJson(this);

  factory HomeDataResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeDataResponseFromJson(json);

}

@JsonSerializable()
class HomeResponse extends BaseResponse{

  @JsonKey(name: "data")
  HomeDataResponse? data;

  HomeResponse(this.data);

  Map<String, dynamic> toJson() => _$HomeResponseToJson(this);

  factory HomeResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeResponseFromJson(json);

}
