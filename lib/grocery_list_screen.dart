import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class QuantityInputField extends StatefulWidget {
  final Function(int) onQuantityChanged;

  const QuantityInputField({Key? key, required this.onQuantityChanged})
      : super(key: key);

  @override
  State<QuantityInputField> createState() => _QuantityInputFieldState();
}

class _QuantityInputFieldState extends State<QuantityInputField> {
  int quantity = 0;

  void _incrementQuantity() {
    setState(() {
      quantity++;
    });
    widget.onQuantityChanged(quantity);
  }

  void _decrementQuantity() {
    if (quantity > 0) {
      setState(() {
        quantity--;
      });
      widget.onQuantityChanged(quantity);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        IconButton(
          icon: const Icon(Icons.remove), // Add a button to decrement quantity
          onPressed: _decrementQuantity,
        ),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: _incrementQuantity,
        ),
        Text('$quantity'),
      ],
    );
  }
}

class GroceryListScreen extends StatefulWidget {
  @override
  _GroceryListScreenState createState() => _GroceryListScreenState();
}

class _GroceryListScreenState extends State<GroceryListScreen> {
  final List<String> allIngredients = [
    'Flour',
    'Butter',
    'Sugar',
    'Brown Sugar',
    'Eggs',
    'Vanilla Extract',
    'Baking Soda',
    'Chocolate Chips',
    'Assorted Vegetables',
    'Curry Sauce',
    'Coconut Milk',
    'Rice',
    'Grilled Chicken Strips',
    'Romaine Lettuce',
    'Caesar Dressing',
    'Parmesan Cheese',
    'Tortillas',
    'Pizza Dough',
    'Tomato Sauce',
    'Fresh Mozzarella',
    'Basil',
    'Olive Oil',
    'Beef Strips',
    'Bell Peppers',
    'Broccoli',
    'Carrots',
    'Soy Sauce',
    'Garlic',
    'Ginger',
    'Rice Vinegar',
    'Sushi Rice',
    'Nori',
    'Fish',
    'Soy Sauce',
    'Wasabi',
    'Pickled Ginger',
    'Ground Beef',
    'Taco Seasoning',
    'Lettuce',
    'Tomato',
    'Cheese',
    'Salsa',
    'Sour Cream',
    'Pasta',
    'Olive Oil',
    'Garlic',
    'Parmesan',
    'Chicken',
    'Yogurt',
    'Tomato Sauce',
    'Spices',
    'Cream'
  ];

  final Map<String, int> ingredientQuantities = {};


  @override
  Widget build(BuildContext context) {
    final Set<String> uniqueIngredients = allIngredients.toSet();
    final List<String> sortedIngredients = uniqueIngredients.toList()..sort();

    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Grocery List'),
        ),
        body: ListView.builder(
          itemCount: sortedIngredients.length,
          itemBuilder: (context, index) {
            final String ingredient = sortedIngredients[index];
            return ListTile(
              title: Row(
                children: [
                  Expanded(
                    child: Text(ingredient),
                  ),
                  QuantityInputField(
                    onQuantityChanged: (quantity) {
                      setState(() {
                        ingredientQuantities[ingredient] = quantity;
                      });
                    },
                  ),
                ],
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _saveIngredientsToFile,
          child: const Icon(Icons.check),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.blue,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black,
          currentIndex: 1, // Set to the index of grocery list
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
      ),
    );
  }
}
