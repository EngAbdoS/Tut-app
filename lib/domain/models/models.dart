
class SliderObject {
  String title;
  String subTitle;
  String image;

  SliderObject(this.title, this.subTitle, this.image);
}


class SliderViewOblect{
  SliderViewOblect(this.sliderObject,this.currentIndex,this.numberOfSlides);
  SliderObject sliderObject;
  int numberOfSlides;
  int currentIndex;

}

///////////////////////////////////////////////////////////////////////////



//login models

class Customer{
  String id;
  String name;
  int num_notif;
  Customer(
      this.id,this.num_notif,this.name
      );


}

class Contacts{
  String phone;
  String email;
  String link;
  Contacts(this.phone,this.email,this.link

      );


}
class Authentication {
 Customer? customer;
 Contacts? contacts;
 Authentication(this.contacts,this.customer);



}


class Service{

  int id;
  String title;
  String image;
  Service(this.id,this.title,this.image);

}
class Banners{

  int id;
  String link;
  String title;
  String image;
  Banners(this.id,this.link,this.title,this.image);

}
class Stores{

  int id;
  String title;
  String image;
  Stores(this.id,this.title,this.image);

}

class StoreDetails {
  int id;
  String title;
  String image;
  String details;
  String services;
  String about;

  StoreDetails(
      this.id, this.title, this.image, this.details, this.services, this.about);
}
class HomeData{

List<Service> services;
List<Banners> banners;
List<Stores> stores;


HomeData(this.services, this.banners, this.stores);



}



class HomeObject{

HomeData ? data;

  HomeObject(this.data);



}


