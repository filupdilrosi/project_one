import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class MealPlannerScreen extends StatefulWidget {
  @override
  _MealPlannerScreenState createState() => _MealPlannerScreenState();
}

class _MealPlannerScreenState extends State<MealPlannerScreen> {
  int _selectedIndex = 1; // Assuming Meal Planner is at index 1
  Map<String, int> ingredientQuantities = {};

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? mealPlannerData = prefs.getString('mealPlannerData');
    setState(() {
      ingredientQuantities = mealPlannerData != null
          ? Map<String, int>.from(json.decode(mealPlannerData))
          : {};
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/home');
        break;
      case 1:
        Navigator.pushNamed(context, '/mealplanner');
        break;
      case 2:
        Navigator.pushNamed(context, '/grocerylist');
        break;
    // Add more cases as needed
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meal Planner'),
      ),
      body: ListView.builder(
        itemCount: ingredientQuantities.keys.length,
        itemBuilder: (context, index) {
          String ingredient = ingredientQuantities.keys.elementAt(index);
          int quantity = ingredientQuantities[ingredient]!;
          return ListTile(
            title: Text('$ingredient x $quantity'),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Meal Planner',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Grocery',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
