# radio_proto

Prototype for Radio App

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## move to new environment
The login is base on local apache server, and mysql database.
I use xammp to have all feature in a bundle.

To import whole login feature, some things need to modify in your own machine. 

1. 	import sql flutter_app.sql file into your local mysql database
	
	$servername = "localhost";
	$username = "root";
	$password = "";
	$dbname = "flutter_app";
	
	password for database
	
2. test1.php is server file, need move to .../xammp/htdoc/flutter_passtest/ folder, which is also indicated in line12 of login_page.dart, as a variable of validate php file address named localServerPage.

3. The local IP address in that variable,
"http://192.168.1.67/......";
must changed to your own private ip address, check that with ipconfig command in cmd
If you try to use localhost as other php server file, an error will occur.
