import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Text('Home Screen'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue, // Background color of the bottom navigation bar
        selectedItemColor: Colors.black, // Color of the selected item
        unselectedItemColor: Colors.black, // Color of the unselected items
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
        currentIndex: 0, // Set the current index to highlight 'Home'
        onTap: (int index) {
          switch (index) {
            case 0:
            // Handle navigation to HomeScreen if needed
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
