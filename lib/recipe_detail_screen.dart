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
      body: Scrollbar(
        isAlwaysShown: true,
        interactive: true, // Enable interactive scrollbar
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                recipe.imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 200.0,
              ),
              SizedBox(height: 20),
              Text('Ingredients:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Column(
                children: recipe.ingredients
                    .map((ingredient) => Text('- $ingredient'))
                    .toList(),
              ),
              SizedBox(height: 20),
              Text('Steps:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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
              SizedBox(height: 20),
              Text('Reviews:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Column(
                children: recipe.reviews
                    .map((review) => Text('- $review'))
                    .toList(),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Back to Recipes'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
