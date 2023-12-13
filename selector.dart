import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'new.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'head',
        primaryColor: Color.fromRGBO(245, 245, 245, 1),
        scaffoldBackgroundColor: Colors.grey[200],
      ),
      home: IngredientSelectionPage(),
    );
  }
}

class IngredientSelectionPage extends StatefulWidget {
  @override
  _IngredientSelectionPageState createState() =>
      _IngredientSelectionPageState();
}

class _IngredientSelectionPageState extends State<IngredientSelectionPage> {
  List<String> selectedIngredients = [];
  bool isLoading = false;

  Map<String, List<String>> ingredientSections = {
    'Grains': ['Rice', 'Wheat', 'Barley', 'Corn', 'Millets'],
    'Fruits': ['Apples', 'Bananas', 'Grapes', 'Oranges'],
    'Vegetables': [
      'Tomatoes',
      'Onions',
      'Garlic',
      'Peppers',
      'Potato',
      'Cabbage',
      'Cauliflower',
      'Eggplant',
      'Ladyfinger'
    ],
    'Dairy': ['Milk', 'Cheese', 'Yogurt', 'Butter', 'Cottage Cheese'],
    'Non-Veg': ['Chicken', 'Beef', 'Fish', 'Eggs', 'Mutton'],
  };

  String appBarTitle = 'Pick Your Ingredients';

  static const String makeDishButtonLabel = 'Make the Dish';

  Future<void> recommendDish() async {
    try {
      setState(() {
        isLoading = true;
      });

      // Convert the list of selected ingredients to a comma-separated string
      final String ingredientsString = selectedIngredients.join(',');

      final response = await http.post(
        Uri.parse('http://192.168.0.196:5000/recommend'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'ingredients': ingredientsString}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        // Navigate to the new page with the recommendation data
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewPage(recommendationData: data),
          ),
        );
      } else {
        print(
            'Failed to load recommendations. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Color buttonColor =
        selectedIngredients.isEmpty ? Colors.grey : Colors.black;

    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back, color: Colors.black),
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        // ),
        automaticallyImplyLeading: false,

        title: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 1, 1, 1),
              child: Text(
                appBarTitle,
                style: TextStyle(
                    fontFamily: "head",
                    color: Color.fromRGBO(1, 1, 1, 1),
                    fontSize: 25),
              ),
            ),
          ],
        ),
        backgroundColor: Color.fromRGBO(250, 250, 250, 1),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.delete, color: Colors.black),
            onPressed: () {
              setState(() {
                selectedIngredients.clear();
              });
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: ingredientSections.length,
                  itemBuilder: (context, index) {
                    String sectionTitle =
                        ingredientSections.keys.elementAt(index);
                    List<String> sectionIngredients =
                        ingredientSections[sectionTitle]!;

                    return Container(
                      margin: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(12.0),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                topRight: Radius.circular(10.0),
                              ),
                            ),
                            child: Text(
                              sectionTitle,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Column(
                            children: sectionIngredients.map((ingredient) {
                              return ListTile(
                                title: Container(
                                  child: Row(
                                    children: [
                                      Transform.scale(
                                        scale: 1.2,
                                        child: Checkbox(
                                          activeColor: Colors.transparent,
                                          checkColor: Colors.black,
                                          fillColor:
                                              MaterialStateProperty.resolveWith(
                                                  (Set<MaterialState> states) {
                                            if (states.contains(
                                                MaterialState.selected)) {
                                              return Colors
                                                  .black; // Checked color
                                            }
                                            return Color.fromRGBO(219, 219, 219,
                                                1); // Unchecked color
                                          }),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          value: selectedIngredients
                                              .contains(ingredient),
                                          onChanged: (value) {
                                            setState(() {
                                              if (value!) {
                                                selectedIngredients
                                                    .add(ingredient);
                                              } else {
                                                selectedIngredients
                                                    .remove(ingredient);
                                              }
                                            });
                                          },
                                        ),
                                      ),
                                      Text(ingredient),
                                    ],
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: selectedIngredients.isEmpty ? null : recommendDish,
                  style: ElevatedButton.styleFrom(
                    primary: buttonColor,
                    onPrimary: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 25.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.0),
                    ),
                  ),
                  child: Text(
                    makeDishButtonLabel,
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              ),
            ],
          ),
          // Loading Screen
          if (isLoading)
            Container(
              color: Colors.transparent,
              child: Center(
                child: Card(
                  color: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 16.0),
                        // Text(
                        //   '',
                        //   style: TextStyle(
                        //     fontSize: 18.0,
                        //     fontWeight: FontWeight.bold,
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
