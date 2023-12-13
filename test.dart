// // // ignore_for_file: prefer_const_declarations, unused_local_variable

// // import 'dart:convert';
// // import 'package:http/http.dart' as http;

// // void main() async {
// //   try {
// //     // Convert the list of ingredients to a string`

// //     final url =
// //         'https://api.edamam.com/search?q=biryani&app_id=ebb6041c&app_key=3c33ad913ab23b8554082bfb5fdd78b5';

// //     getApiData() async {
// //       var response = await http.get(Uri.parse(url));
// //       Map json = jsonDecode(response.body);
// //       print(response.body);
// //     }

// //     @override
// //     void initstate() {
// //       super.initstate();
// //       getApiData();
// //     }

// //     final ingredientsList = jsonEncode("['chicken','butter']");

// //     final response = await http.post(
// //       Uri.parse('http://127.0.0.1:5000/recommend'),
// //       headers: {'Content-Type': 'application/json'},
// //       body: '{"ingredients": $ingredientsList}',
// //     );

// //     if (response.statusCode == 200) {
// //       final data = jsonDecode(response.body);
// //       print('Index: ${data[1]['index']}');
// //       print('Name: ${data[1]['name']}');
// //       print('Steps: ${data[1]['steps']}');
// //       print('Minutes: ${data[1]['minutes']}');
// //       print('Ingredients: ${data[1]['ingredients']}');
// //       print('Description: ${data[1]['description']}');
// //     } else {
// //       print(
// //           'Failed to load recommendations. Status code: ${response.statusCode}');
// //     }
// //   } catch (e) {
// //     print('Error: $e');
// //   }
// // }







// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Homepage',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: HomePage(),
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final url =
//       'https://api.edamam.com/search?q=biryani&app_id=ebb6041c&app_key=3c33ad913ab23b8554082bfb5fdd78b5';

//   getApiData() async {
//     var response = await http.get(Uri.parse(url));
//     Map<String, dynamic> jsonData = jsonDecode(response.body);
//     print(jsonData);
//   }

//   @override
//   void initState() {
//     super.initState();
//     getApiData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Flutter Homepage'),
//       ),
//       // body: Center(
//       //   child: Column(
//       //     mainAxisAlignment: MainAxisAlignment.center,
//       //     children: <Widget>[
//       //       Text(
//       //         'Welcome to Flutter!',
//       //         style: TextStyle(fontSize: 24),
//       //       ),
//       //     ],
//       //   ),
//       // ),
//     );
//   }
// }
