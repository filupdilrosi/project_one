import 'package:flutter/material.dart';

class MealPlannerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meal Planner'),
      ),
      body: Center(
        child: Text('Meal Planner Screen'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue, // Background color of the bottom navigation bar
        selectedItemColor: Colors.black, // Color of the selected item
        unselectedItemColor: Colors.black, // Color of the unselected items
        currentIndex: 2, // Set the current index for Meal Planner
        onTap: (index) {
          // Handle navigation when a bottom navigation item is tapped
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/'); // Navigate to HomeScreen
              break;
            case 1:
              Navigator.pushNamed(context, '/grocerylist'); // Navigate to GroceryListScreen
              break;
            case 3:
              Navigator.pushNamed(context, '/recipes'); // Navigate to RecipeListScreen
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
