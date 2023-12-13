import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'model.dart';
import 'new.dart'; // Import the NewPage or relevant file where RecipeModel is used

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<RecipeModel> recipeList = <RecipeModel>[];
  TextEditingController searchController = TextEditingController();

  Future<void> getRecipes(String query) async {
    try {
      String url =
          "https://api.edamam.com/search?q=chicken&app_id=3d31fefc&app_key=1d1183c8f4add888bb1d9661d4d2c962";
      http.Response response = await http.get(Uri.parse(url));
      Map data = jsonDecode(response.body);

      recipeList.clear(); // Clear the list before adding new recipes

      data["hits"].forEach((element) {
        RecipeModel recipeModel = RecipeModel.fromMap(element["recipe"]);
        recipeList.add(recipeModel);
        log(recipeList.toString());
      });

      recipeList.forEach((Recipe) {
        print(Recipe.applabel);
        print(Recipe.appcalories);
        print(Recipe.appimgUrl); // Check the fetched image URL
      });
    } catch (error) {
      log("Error fetching recipes: $error");
      // Handle the error as needed
    }
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NewPage(recommendationData: recipeList); // Pass the recipeList to NewPage
  }
}
