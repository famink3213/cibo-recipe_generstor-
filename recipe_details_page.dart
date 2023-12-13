import 'package:flutter/material.dart';

class RecipeDetailsPage extends StatelessWidget {
  final Map<String, dynamic> recipe;

  RecipeDetailsPage({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe['name']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ingredients:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: recipe['ingredients']
                  .map<Widget>((ingredient) => Text('- $ingredient'))
                  .toList(),
            ),
            SizedBox(height: 16),
            Text(
              'Steps:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: recipe['steps']
                  .map<Widget>((step) => Text('- $step'))
                  .toList(),
            ),
            SizedBox(height: 16),
            Text(
              'Time Required: ${recipe['minutes']} minutes',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
