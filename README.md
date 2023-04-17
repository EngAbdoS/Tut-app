<!DOCTYPE html> <html lang="en"> <head> <meta charset="UTF-8"> <meta name="viewport" content="width=device-width, initial-scale=1.0"> <meta http-equiv="X-UA-Compatible" content="ie=edge"> <title>Tut-app</title> </head> <body> <h1>Tut-app</h1> <p>Tut-app is a Flutter application built with Dart that provides a platform for training. It uses mock APIs to simulate backend services and implements clean architecture, MVVM, dependency injection, error handling, localization, caching, Dio, state flow, state rendering, stream controllers, and more.</p>
    <h2>Screenshots</h2>
    <!-- TODO: Add screenshots of the application's UI. -->
    
    <table>
        <tr>
          <td><img src="C:\Users\Swidan\Desktop\New folder (5)\New folder\1.jpg" alt="Girl in a jacket" width="270" height="500">
          </td>
          <td><img src="C:\Users\Swidan\Desktop\New folder (5)\New folder\2.jpg" alt="Girl in a jacket" width="270" height="500">
          </td>
          <td><img src="C:\Users\Swidan\Desktop\New folder (5)\New folder\3.jpg" alt="Girl in a jacket" width="270" height="500">
          </td><td><img src="C:\Users\Swidan\Desktop\New folder (5)\New folder\4.jpg" alt="Girl in a jacket" width="270" height="500">
          </td>
        </tr>
        <tr>
          
             <td><img src="C:\Users\Swidan\Desktop\New folder (5)\New folder\5.jpg" alt="Girl in a jacket" width="270" height="500">
            </td> <td><img src="C:\Users\Swidan\Desktop\New folder (5)\New folder\6.jpg" alt="Girl in a jacket" width="270" height="500">
            </td><td><img src="C:\Users\Swidan\Desktop\New folder (5)\New folder\7.jpg" alt="Girl in a jacket" width="270" height="500">
            </td><td><img src="C:\Users\Swidan\Desktop\New folder (5)\New folder\8.jpg" alt="Girl in a jacket" width="270" height="500">
            </td>
        </tr>
      </table>

    
    <h2>Features</h2>
    <ul>
        <li><strong>Login Screen:</strong> Users can log in to their accounts with their email and password. The screen also includes validation for the email and password fields.</li>
        <li><strong>Forgot Password Screen:</strong> Users can reset their password by entering their email address.</li>
        <li><strong>Register Screen:</strong> New users can create an account by entering their name, email address, and password. The screen also includes validation for all fields.</li>
        <li><strong>Home Screen:</strong> The main screen of the application contains a banner section and a services slider. Users can access the stores and settings screens from here.</li>
        <li><strong>Stores Screen:</strong> This screen displays a list of all the stores available in the application. Users can tap on a store to view its details.</li>
        <li><strong>Store Details Screen:</strong> This screen displays detailed information about a store, including its name, location, and opening hours.</li>
        <li><strong>Settings Screen:</strong> Users can access the application's settings from this screen. They can change their language preferences and clear the cache.</li>
    </ul>
    
    <h2>Architecture</h2>
    <p>The Tut-app follows a clean architecture pattern, which separates the application into layers to promote modularity, scalability, and testability. The layers are:</p>
    <ul>
        <li><strong>Presentation:</strong> This layer contains the user interface and handles the application's visual elements.</li>
        <li><strong>Domain:</strong> This layer contains the application's business logic and use cases.</li>
        <li><strong>Data:</strong> This layer contains the implementation of the application's data sources, such as APIs and databases.</li>
    </ul>
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
    <ol>
        <li>Clone the repository: <code>git clone https://github.com/EngAbdoS/Tut-app.git</code></li>
        <li>Navigate to the project directory: <code>cd tut-app</code></li>
        <li>Install dependencies: <code>flutter pub get</code></li>
        <li>Run the application: <code>flutter run</code></li>
    </ol>
    
    <h2>Contributing</h2>
    <p>Contributions are welcome! Please read <code>CONTRIBUTING.md</code> for details on our code of conduct and the process for submitting pull requests.</p>
    
    <h2>License</h2>
    <p>This project is licensed under the MIT License - see <code>LICENSE.md</code> for details.</p>
    </body> </html>
