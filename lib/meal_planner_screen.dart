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

class MealPlannerScreen extends StatefulWidget {
  @override
  _MealPlannerScreenState createState() => _MealPlannerScreenState();
}

class _MealPlannerScreenState extends State<MealPlannerScreen> {
  int _selectedIndex = 2; // Assuming Meal Planner is at index 2
  late Map<String, int> ingredientQuantities; // Change here

  @override
  void initState() {
    super.initState();
    ingredientQuantities = {};
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/ingredients.txt');

      if (await file.exists()) {
        final contents = await file.readAsLines();
        for (var line in contents) {
          final parts = line.split(': ');
          if (parts.length == 2) {
            final ingredient = parts[0];
            final quantity = int.tryParse(parts[1]) ?? 0;
            setState(() {
              if (ingredientQuantities.containsKey(ingredient)) {
                final existingQuantity = ingredientQuantities[ingredient] ?? 0;
                ingredientQuantities[ingredient] = existingQuantity + quantity;
              } else {
                ingredientQuantities[ingredient] = quantity;
              }
            });
          }
        }
      } else {
        print('Ingredients file does not exist');
      }
    } catch (e) {
      print('Error loading ingredients: $e');
    }
  }

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
