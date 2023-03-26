
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
