// test_page.dart

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TestPage extends StatefulWidget {
  final List<String> selectedIngredients;

  TestPage({required this.selectedIngredients});

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                // Convert the list of ingredients to a string
                final ingredientsList = jsonEncode(widget.selectedIngredients);

                // Perform the HTTP request with ingredientsList
                final response = await http.post(
                  Uri.parse('http://127.0.0.1:5000/recommend'),
                  headers: {'Content-Type': 'application/json'},
                  body: '{"ingredients": $ingredientsList}',
                );

                if (response.statusCode == 200) {
                  setState(() {
                    result = response.body;
                  });
                } else {
                  setState(() {
                    result =
                        'Failed to load recommendations. Status code: ${response.statusCode}';
                  });
                }

                print('Ingredients List: $ingredientsList');
              },
              child: Text('Make HTTP Request with Ingredients'),
            ),
            SizedBox(height: 20),
            Text(
              'API Response:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              result,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
