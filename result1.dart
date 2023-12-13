import 'package:flutter/material.dart';

class Result1 extends StatelessWidget {
  final dynamic recommendationData;

  Result1({required this.recommendationData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recommendation Result'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Recommended Dishes:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            // Display the recommended dishes data
            for (var dish in recommendationData) ...[
              ListTile(
                title: Text('Name: ${dish['name']}'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Index: ${dish['index']}'),
                    Text('Steps: ${dish['steps']}'),
                    Text('Minutes: ${dish['minutes']}'),
                    Text('Ingredients: ${dish['ingredients']}'),
                    Text('Description: ${dish['description']}'),
                  ],
                ),
              ),
              Divider(), // Add a divider between dishes
            ],
          ],
        ),
      ),
    );
  }
}
