import 'package:flutter/material.dart';
import 'package:project_one/recipe_detail_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/recipe.dart';

class RecipeListScreen extends StatefulWidget {
  @override
  _RecipeListScreenState createState() => _RecipeListScreenState();
}

class _RecipeListScreenState extends State<RecipeListScreen> {
  late List<Recipe> recipes;

  @override
  void initState() {
    super.initState();
    // Assuming dummyRecipes is available globally or passed to this widget
    recipes = List<Recipe>.from(dummyRecipes); // Make a copy of the dummyRecipes list
    _loadFavorites(); // Load favorites when widget initializes
  }

  void _toggleFavorite(String recipeId) {
    final recipeIndex = recipes.indexWhere((recipe) => recipe.id == recipeId);
    setState(() {
      recipes[recipeIndex].isFavorite = !recipes[recipeIndex].isFavorite;
    });
    _saveFavorites();
  }

  Future<void> _saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favoriteIds = recipes.where((recipe) => recipe.isFavorite).map((recipe) => recipe.id).toList();
    await prefs.setString('favoriteRecipes', jsonEncode(favoriteIds));
  }

  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favoriteIdsJson = prefs.getString('favoriteRecipes');
    final List<String>? favoriteIds = favoriteIdsJson != null ? json.decode(favoriteIdsJson).cast<String>() : null;

    if (favoriteIds != null) {
      setState(() {
        for (var recipe in recipes) {
          recipe.isFavorite = favoriteIds.contains(recipe.id);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipes'),
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(recipes[index].title),
            leading: Image.asset(
              recipes[index].imageUrl,
              fit: BoxFit.cover,
              width: 80.0,
              height: 80.0,
            ),
            trailing: IconButton(
              icon: recipes[index].isFavorite ? Icon(Icons.favorite, color: Colors.red) : Icon(Icons.favorite_border),
              onPressed: () => _toggleFavorite(recipes[index].id),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RecipeDetailScreen(recipe: recipes[index]),
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        currentIndex: 3,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/');
              break;
            case 1:
              Navigator.pushNamed(context, '/grocerylist');
              break;
            case 2:
              Navigator.pushNamed(context, '/mealplanner');
              break;
          // Ensure there's a case for navigating back to itself or handle it accordingly
          }
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Grocery List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Meal Planner',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Recipes',
          ),
        ],
      ),
    );
  }
}
