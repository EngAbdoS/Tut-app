<h1>Tut-app</h1>
Tut-app is a Flutter application built with Dart that provides a platform for training. It uses mock APIs to simulate backend services and implements clean architecture, MVVM, dependency injection, error handling, localization, caching, Dio, state flow, state rendering, stream controllers, and more.

Screenshots
![1](https://user-images.githubusercontent.com/86132875/232644969-813f366e-707c-4aa5-bd79-c9d63666ca55.jpg)
![2](https://user-images.githubusercontent.com/86132875/232644983-8db72a45-0179-4629-a3cc-0e4db9b63ab0.jpg)
![3](https://user-images.githubusercontent.com/86132875/232645011-0142a6c0-57b9-4b8e-8e1e-feaa72d563c5.jpg)
![4](https://user-images.githubusercontent.com/86132875/232645033-5ea14851-0485-4200-a966-9cce7daf9621.jpg)
![5](https://user-images.githubusercontent.com/86132875/232645038-26d0b5be-3591-4fb2-b6a2-65ab8de0b574.jpg)
![6](https://user-images.githubusercontent.com/86132875/232645050-a28e7bd6-91b3-4d1f-bd65-2e60c470a8b9.jpg)
![7](https://user-images.githubusercontent.com/86132875/232645061-2b84486b-7c7e-4807-b0ea-83c50262b2e9.jpg)
![8](https://user-images.githubusercontent.com/86132875/232645073-3eae1edc-56be-4267-83bd-9f3eaaea1422.jpg)


Features
Login Screen: Users can log in to their accounts with their email and password. The screen also includes validation for the email and password fields.

Forgot Password Screen: Users can reset their password by entering their email address.

Register Screen: New users can create an account by entering their name, email address, and password. The screen also includes validation for all fields.

Home Screen: The main screen of the application contains a banner section and a services slider. Users can access the stores and settings screens from here.

Stores Screen: This screen displays a list of all the stores available in the application. Users can tap on a store to view its details.

Store Details Screen: This screen displays detailed information about a store, including its name, location, and opening hours.

Settings Screen: Users can access the application's settings from this screen. They can change their language preferences and clear the cache.

Architecture
The Tut-app follows a clean architecture pattern, which separates the application into layers to promote modularity, scalability, and testability. The layers are:

Presentation: This layer contains the user interface and handles the application's visual elements.

Domain: This layer contains the application's business logic and use cases.

Data: This layer contains the implementation of the application's data sources, such as APIs and databases.

The application also uses MVVM architecture, which separates the application into Model, View, and ViewModel layers.

Dependencies
 cupertino_icons: ^1.0.2
  flutter_svg: ^2.0.2
  retrofit: ^4.0.1
  analyzer: ^5.7.1
  dio: ^5.1.1
  json_serializable: ^6.6.1
  retrofit_generator: ^6.0.0+1
  json_annotation: ^4.8.0
  dartz: ^0.10.1
  internet_connection_checker: ^1.0.0
  pretty_dio_logger: ^1.3.1
  shared_preferences: ^2.0.20
  freezed: ^2.3.2
  get_it: ^7.2.0
  lottie: ^2.3.1
  country_code_picker: ^3.0.0
  image_picker: ^0.8.7+2
  rxdart: ^0.27.7
  carousel_slider: ^4.2.1
  easy_localization: ^3.0.1
  flutter_phoenix: ^1.1.1
Installation
Clone the repository: git clone https://github.com/EngAbdoS/Tut-app.git

Navigate to the project directory: cd tut-app

Install dependencies: flutter pub get

Run the application: flutter run

Contributing
Contributions are welcome! Please read CONTRIBUTING.md for details on our code of conduct and the process for submitting pull requests.

License
This project is licensed under the MIT License - see LICENSE.md for details.
