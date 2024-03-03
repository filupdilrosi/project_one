class Recipe {
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final List<String> reviews;

  Recipe({
    required this.title,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
    required this.reviews,
  });
}

List<Recipe> dummyRecipes = [
  Recipe(
    title: 'Spaghetti Carbonara',
    imageUrl: 'https://via.placeholder.com/300',
    ingredients: ['Spaghetti', 'Eggs', 'Bacon', 'Parmesan cheese'],
    steps: [
      'Cook spaghetti according to package instructions.',
      'In a separate pan, fry bacon until crispy.',
      'In a bowl, whisk eggs and mix in grated parmesan cheese.',
      'Combine cooked spaghetti with bacon, then stir in egg mixture.',
      'Serve hot and enjoy!'
    ],
    reviews: ['Delicious!', 'Easy to make.', 'Family favorite.'],
  ),
  // Add more dummy recipes here...
];
