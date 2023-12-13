class RecipeModel {
  late String applabel;
  late String appimgUrl; // New property for the recipe image URL
  late double appcalories;
  late String appurl;

  RecipeModel({
    this.applabel = "LABEL",
    this.appcalories = 0.000,
    this.appimgUrl = "IMAGE",
    this.appurl = "URL",
  });

  factory RecipeModel.fromMap(Map recipe) {
    return RecipeModel(
      applabel: recipe["label"],
      appcalories: recipe["calories"],
      appimgUrl: recipe["image"], // Assuming the API response has an "image" field for the recipe image
      appurl: recipe["url"],
    );
  }
}
