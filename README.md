<h1>Tut-app</h1>
<h2>Tut-app</h2> <p>is a Flutter application built with Dart that provides a platform for training. It uses mock APIs to simulate backend services and implements clean architecture, MVVM, dependency injection, error handling, localization, caching, Dio, state flow, state rendering, stream controllers, and more.</p>

<h2>Screenshots</h2>

<img src="https://user-images.githubusercontent.com/86132875/232644969-813f366e-707c-4aa5-bd79-c9d63666ca55.jpg" width="240" height="500">
<img src="https://user-images.githubusercontent.com/86132875/232644983-8db72a45-0179-4629-a3cc-0e4db9b63ab0.jpg" width="240" height="500">
<img src="https://user-images.githubusercontent.com/86132875/232645011-0142a6c0-57b9-4b8e-8e1e-feaa72d563c5.jpg" width="240" height="500">
<img src="https://user-images.githubusercontent.com/86132875/232645033-5ea14851-0485-4200-a966-9cce7daf9621.jpg" width="240" height="500">
<img src="https://user-images.githubusercontent.com/86132875/232645038-26d0b5be-3591-4fb2-b6a2-65ab8de0b574.jpg" width="240" height="500">
<img src="https://user-images.githubusercontent.com/86132875/232645050-a28e7bd6-91b3-4d1f-bd65-2e60c470a8b9.jpg" width="240" height="500">
<img src="https://user-images.githubusercontent.com/86132875/232645061-2b84486b-7c7e-4807-b0ea-83c50262b2e9.jpg" width="240" height="500">
<img src="https://user-images.githubusercontent.com/86132875/232645073-3eae1edc-56be-4267-83bd-9f3eaaea1422.jpg" width="240" height="500">


<h2>Features</h2>
<h3>Login Screen:</h3><p> Users can log in to their accounts with their email and password. The screen also includes validation for the email and password fields.
</p>
<h3>Forgot Password Screen:</h3><p> Users can reset their password by entering their email address.
</p>
<h3>Register Screen: </h3><p>New users can create an account by entering their name, email address, and password. The screen also includes validation for all fields.
</p>
<h3>Home Screen:</h3><p> The main screen of the application contains a banner section and a services slider. Users can access the stores and settings screens from here.
</p>
<h3>Stores Screen:</h3><p> This screen displays a list of all the stores available in the application. Users can tap on a store to view its details.
</p>
<h3>Store Details Screen:</h3><p> This screen displays detailed information about a store, including its name, location, and opening hours.
</p>
<h3>Settings Screen:</h3><p> Users can access the application's settings from this screen. They can change their language preferences and clear the cache.
</p>
<h2>Architecture</h2>

<p>The Tut-app follows a clean architecture pattern, which separates the application into layers to promote modularity, scalability, and testability. The layers are:
</p>
<h3>Presentation:</h3> 
<p>This layer contains the user interface and handles the application's visual elements.
</p>
<h3> Domain:</h3>
<p>This layer contains the application's business logic and use cases.
</p>

<h3>Data:</h3>
<p>This layer contains the implementation of the application's data sources, such as APIs and databases.
</p>
<h3>APP</h3>
<p>This is a pure logic layer where we write core business or application logic.
</p>
<p>The application also uses MVVM architecture, which separates the application into Model, View, and ViewModel layers.</p>
    
<h2>Dependencies</h2>
<ul>

<li>  flutter_svg: ^2.0.2  </li>   
<li>  retrofit: ^4.0.1</li>
<li>  analyzer: ^5.7.1</li>
<li>  dio: ^5.1.1</li>
<li>  json_serializable: ^6.6.1</li>
<li>  retrofit_generator: ^6.0.0+1</li>
<li>  json_annotation: ^4.8.0</li>
<li>  dartz: ^0.10.1</li>
<li>  internet_connection_checker: ^1.0.0</li>
<li>  pretty_dio_logger: ^1.3.1</li>
<li>  shared_preferences: ^2.0.20</li>
<li>  freezed: ^2.3.2</li>
<li>  get_it: ^7.2.0</li>
<li>  lottie: ^2.3.1</li>
<li>  country_code_picker: ^3.0.0</li>
<li>  image_picker: ^0.8.7+2</li>
<li>  rxdart: ^0.27.7</li>
<li>  carousel_slider: ^4.2.1</li>
<li>  easy_localization: ^3.0.1</li>
<li>  flutter_phoenix: ^1.1.1</li>

</ul>
<h2>Installation</h2>
<p>Clone the repository: git clone https://github.com/EngAbdoS/Tut-app.git
</p>
<p>Navigate to the project directory: cd tut-app
</p>
<p>Install dependencies: flutter pub get</p>
<p>Run the application: flutter run
</p>
<h2>Contributing
</h2>
<p>Contributions are welcome! Please read CONTRIBUTING.md for details on our code of conduct and the process for submitting pull requests.
</p>
<h2>License</h2>
<p>This project is licensed under the MIT License - see LICENSE.md for details.
</p>
