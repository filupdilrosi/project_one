import 'package:flutter/material.dart';
import 'package:project_one/recipe_detail_screen.dart';
import '../models/recipe.dart';

class RecipeListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipes'),
      ),
      body: ListView.builder(
        itemCount: dummyRecipes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(dummyRecipes[index].title),
            leading: Image.asset(
              dummyRecipes[index].imageUrl, // Use AssetImage instead of NetworkImage
              fit: BoxFit.cover,
              width: 80.0,
              height: 80.0,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      RecipeDetailScreen(recipe: dummyRecipes[index]),
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue, // Background color of the bottom navigation bar
        selectedItemColor: Colors.black, // Color of the selected item
        unselectedItemColor: Colors.black, // Color of the unselected items
        currentIndex: 3, // Set the current index for Recipes
        onTap: (index) {
          // Handle navigation when a bottom navigation item is tapped
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/'); // Navigate to HomeScreen
              break;
            case 1:
              Navigator.pushNamed(context, '/grocerylist'); // Navigate to GroceryListScreen
              break;
            case 2:
              Navigator.pushNamed(context, '/mealplanner'); // Navigate to MealPlannerScreen
              break;
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
