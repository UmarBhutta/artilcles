# Articles

Articles is sample app developed with Flutter, which fetch the Article list form the server using GraphQL and show them on list.
The main goal of this app is to be a sample of how to build an high quality Flutter application that uses the BloC Design Pattern,Network image loading, GraphQL queries using clean Architecture approach in Dart.

<img src=".documentation/list.png"/>
<img src=".documentation/details.png"/>

## Architecture
The app uses BloC [Business Logic Component]. It provides a more elegant and reusable way of managing state in Flutter applications which takes advantage of flutter’s UI reactive model, separation of concern, testability, and a lot more.

## Libraries and tools 🛠

<li><a href="https://pub.dev/packages/flutter_bloc">Flutter BloC</a></li>
<li><a href="https://pub.dev/packages/graphql">GraphQL</a></li>
<li><a href="https://pub.dev/packages/cached_network_image">Cached network image</a></li>
<li><a href="https://pub.dev/packages/equatable">Equatable</a></li>
<li><a href="https://pub.dev/packages/flutter_markdown">Flutter Markdown</a></li>

## Testing 🧪
<li><a href="https://api.flutter.dev/flutter/flutter_test/flutter_test-library.html">Flutter Test</a></li>
<li><a href="https://pub.dev/packages/bloc_test">Bloc Test</a></li>
<li><a href="https://pub.dev/packages/mockito">Mockito</a></li>

## Guide to Run and Compile On Local Machine

It required to have Flutter SDK install on the local machine to run the compile the project. Which can be installed using this Link.
<li><a href="https://flutter.dev/docs/get-started/install">Flutter SDK</a></li>

After successfully installing the Flutter use below command in the project directory

###  Install Dependencies

```sh
flutter pub get
```

###  Usage

```sh
flutter run
```

### 🧪 Test

```sh
flutter analyze .
flutter test
```

Another Option is to install Latest Android Studio and it is shipped with the Flutter Support.
<li><a href="https://developer.android.com/studio">Android Studio</a></li>

For help getting started with Flutter,
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
