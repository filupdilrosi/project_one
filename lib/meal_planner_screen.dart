import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

  @override
  Widget build(BuildContext context) {
    // Sort the keys alphabetically
    final sortedIngredients = ingredientQuantities.keys.toList()..sort();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Meal Planner'),
      ),
      body: ListView.builder(
        itemCount: sortedIngredients.length,
        itemBuilder: (context, index) {
          String ingredient = sortedIngredients[index];
          int quantity = ingredientQuantities[ingredient] ?? 0;
          return ListTile(
            title: Text('$ingredient: $quantity'),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
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
