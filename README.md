# radio_proto

Prototype for UNA Radio App

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

### Info about Radio App

This project uses a number of different flutter packages in order to operate. If you are someone that is going to continue working on the project, please see the following links to learn about the packages and how they operate:

- [just_audio](https://pub.dev/packages/just_audio)
- [url_launcher](https://pub.dev/packages/url_launcher)
- [dio](https://pub.dev/packages/dio)
- [groovin_material_icons](https://pub.flutter-io.cn/packages/groovin_material_icons)
- [cupertino_icons](https://pub.dev/packages/cupertino_icons)
- [flutter_launcher_icons](https://pub.dev/packages/flutter_launcher_icons)
- [flutter_launcher_name](https://pub.dev/packages/flutter_launcher_name)

In its current state, this application:
- Has a dummy login screen
- A basic channel selection GUI which can be expanded with more channels
- A functional music player that can stream music from mp3 links on the web, open up links in an inapp browser, advance to the next song in a genre playlist

What this application needs improvement on:
- A more secure login method
- A way to login and remember login information for future app launches
- A more professional GUI
- Ability to get song data from a database rather than be hardcoded in
- Improved song queueing method which allows music to start playing immediately after tapping next song
- Controller for music player when not inside the app (notification bar player controller + lock screen player controller)

#### Useful links for future developers

The following are some flutter packages we researched but were unable to have time to implement that future developers can use to fix some of the issues mentioned in the previous section:

- [flutter_secure_storage](https://pub.dev/packages/flutter_secure_storage), for storing login info and more
- [mongo_dart](https://pub.dev/packages/mongo_dart), for setting up song info to be acquired from a mongodb if mongo is desired
- [sqflite](https://pub.dev/packages/sqflite), same as above except using SQLite
- [audio_service](https://pub.dev/packages/audio_service), for adding music player controller outside the app

Note the above packages are simply suggestions. Future developers may or may not use them at thier discretion, however flutter_secure_storage and audio_service are highly recommended.

Alternatively, you could set up the app with [Firebase](https://flutter.dev/docs/development/data-and-backend/firebase) for handling database information.
