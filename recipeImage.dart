class RecipeImage {
  final String url;

  RecipeImage({required this.url});

  factory RecipeImage.fromJson(Map<String, dynamic> json) {
    return RecipeImage(url: json['image'] ?? '');
  }
}
