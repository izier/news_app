# News App - Implementation of NewsAPI

<div align= 'left'>
  <img src='https://github.com/izier/news_app/blob/main/screenshots/1.jpg' width='200'>
  <img src='https://github.com/izier/news_app/blob/main/screenshots/2.jpg' width='200'>
  <img src='https://github.com/izier/news_app/blob/main/screenshots/3.jpg' width='200'>
  <img src='https://github.com/izier/news_app/blob/main/screenshots/4.jpg' width='200'>
  <img src='https://github.com/izier/news_app/blob/main/screenshots/5.jpg' width='200'>
  <img src='https://github.com/izier/news_app/blob/main/screenshots/6.jpg' width='200'>
</div>

Posted is a simple news app built with Flutter. It is connected to [NewsAPI](https://newsapi.org/) for its article and news data needs.

## Features

- **Group news by category**: Shows lists of news based on their categories.
- **Country selection**: Able to choose selection of country where the news is published.
- **News search**: Search for any news by their title or content.
- **Article detail**: Shows the detail of news or article by using web view.

## Dependencies

The Posted app utilizes the following dependencies:

## Dependencies and Functionalities

- [flutter_native_splash](https://pub.dev/packages/flutter_native_splash): Helps in setting up a custom splash screen for your Flutter app, providing a seamless and branded launch experience.
- [http](https://pub.dev/packages/http): Enables the app to make HTTP requests and interact with APIs. It allows the app to send HTTP GET, POST, PUT, and DELETE requests, and handle responses.
- [get](https://pub.dev/packages/get): Provides a simple way to manage state, navigate between screens, and handle dependency injection.
- [hive](https://pub.dev/packages/hive): Lightweight and efficient NoSQL database for Flutter. It allows the app to store and retrieve data locally on the device, making it easy to persist app data.
- [hive_flutter](https://pub.dev/packages/hive_flutter): Provides integration between Hive and Flutter. It allows the app to use Hive database seamlessly with Flutter widgets and manage data persistence efficiently.

Feel free to explore each dependency by clicking on the respective links above to access their documentation and additional details.

## Installation

To run the News App locally, ensure that you have Flutter SDK installed on your system. Then, follow these steps:

1. Clone the repository:

```bash
git clone https://github.com/izier/news_app.git
```
2. Navigate to the project directory:

```bash
cd news_app
```
3. Fetch the required dependencies:

```bash
flutter pub get
```
4. Build and run the app:

```bash
flutter run
```

## Contributing

Contributions to News App are always welcome! If you have any bug reports, feature requests, or suggestions, please open an issue on the GitHub repository. If you would like to contribute code, you can fork the repository and create a pull request with your changes.

Please ensure that your code adheres to the existing coding style and that you have tested your changes thoroughly before submitting a pull request.
