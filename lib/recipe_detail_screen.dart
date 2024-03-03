import 'package:flutter/material.dart';
import 'package:project_one/models/recipe.dart';

class RecipeDetailScreen extends StatelessWidget {
  final Recipe recipe;

  RecipeDetailScreen({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(recipe.imageUrl),
          Text('Ingredients:'),
          Column(
            children: recipe.ingredients
                .map((ingredient) => Text('- $ingredient'))
                .toList(),
          ),
          Text('Steps:'),
          Column(
            children: recipe.steps
                .asMap()
                .entries
                .map((step) => ListTile(
              leading: CircleAvatar(child: Text('${step.key + 1}')),
              title: Text(step.value),
            ))
                .toList(),
          ),
          Text('Reviews:'),
          Column(
            children: recipe.reviews
                .map((review) => Text('- $review'))
                .toList(),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Back to Recipes'),
          ),
        ],
      ),
    );
  }
}