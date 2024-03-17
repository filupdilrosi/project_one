import 'package:flutter/material.dart';
import '../models/recipe.dart'; // Ensure this import path is correct.

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Filter out favorite recipes from the dummy data.
    final favoriteRecipes = dummyRecipes.where((recipe) => recipe.isFavorite).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Favorite Recipes',
              style: Theme.of(context).textTheme.headline5,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: favoriteRecipes.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(favoriteRecipes[index].title),
                      leading: Image.asset(
                        favoriteRecipes[index].imageUrl,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                      // Optionally add an onTap handler
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
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
        currentIndex: 0,
        onTap: (int index) {
          switch (index) {
            case 0:
            // Stay at Home, no action required.
              break;
            case 1:
              Navigator.pushNamed(context, '/grocerylist');
              break;
            case 2:
              Navigator.pushNamed(context, '/mealplanner');
              break;
            case 3:
              Navigator.pushNamed(context, '/recipes');
              break;
          }
        },
      ),
    );
  }
}
