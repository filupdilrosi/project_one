import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class QuantityInputField extends StatefulWidget {
  final Function(int) onQuantityChanged;

  const QuantityInputField({Key? key, required this.onQuantityChanged}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
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
    'Flour', 'Butter', 'Sugar', 'Brown Sugar', 'Eggs', 'Vanilla Extract',
    'Baking Soda', 'Chocolate Chips', 'Assorted Vegetables', 'Curry Sauce',
    'Coconut Milk', 'Rice', 'Grilled Chicken Strips', 'Romaine Lettuce',
    'Caesar Dressing', 'Parmesan Cheese', 'Tortillas', 'Pizza Dough',
    'Tomato Sauce', 'Fresh Mozzarella', 'Basil', 'Olive Oil', 'Beef Strips',
    'Bell Peppers', 'Broccoli', 'Carrots', 'Soy Sauce', 'Garlic', 'Ginger',
    'Rice Vinegar', 'Sushi Rice', 'Nori', 'Fish', 'Soy Sauce', 'Wasabi',
    'Pickled Ginger', 'Ground Beef', 'Taco Seasoning', 'Lettuce', 'Tomato',
    'Cheese', 'Salsa', 'Sour Cream', 'Pasta', 'Olive Oil', 'Garlic',
    'Parmesan', 'Chicken', 'Yogurt', 'Tomato Sauce', 'Spices', 'Cream'
  ];

  final Map<String, int> ingredientQuantities = {};

  Future<void> _saveDataAndNavigate() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('mealPlannerData', json.encode(ingredientQuantities));
      Navigator.pushNamed(context, '/mealplanner');
    } catch (e) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('Error'),
          content: Text('Failed to save data. Error: $e'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final Set<String> uniqueIngredients = allIngredients.toSet();
    final List<String> sortedIngredients = uniqueIngredients.toList()..sort();

    return Scaffold(
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
        onPressed: _saveDataAndNavigate,
        child: const Icon(Icons.check),
      ),
    );
  }
}
