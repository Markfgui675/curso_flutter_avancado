class SliderObject{

  String? title;
  String? subTitle;
  String? image;

  SliderObject(this.title, this.subTitle, this.image);
}

class Customer{

  String? id;
  String? name;
  int? numOfNotifications;

  Customer(this.id, this.name,
      this.numOfNotifications);
}

class Contacts{

  String? phone;
  String? link;
  String? email;

  Contacts(this.phone, this.link, this.email);
}

class Authentication{

  Customer? customer;
  Contacts? contacts;

  Authentication(this.customer, this.contacts);
}

class DeviceInfo{

  String name;
  String identifier;
  String version;

  DeviceInfo(this.name, this.identifier, this.version);

}

class Service{
  int id;
  String title;
  String image;

  Service(this.id, this.title, this.image);
}

class Store{
  int id;
  String title;
  String image;

  Store(this.id, this.title, this.image);
}

class Banner{
  int id;
  String title;
  String image;
  String link;

  Banner(this.id, this.title, this.image, this.link);
}

class HomeData{
  List<Service> service;
  List<Store> store;
  List<Banner> banner;

  HomeData(this.service, this.store, this.banner);
}

class HomeObject{
  HomeData data;

  HomeObject(this.data);
}
