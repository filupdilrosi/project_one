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
    'Cinnamon',
    'Nutmeg',
    'Cloves',
    'Allspice',
    'Gingerbread Spice',
    'Pumpkin Puree',
    'Canned Tomatoes',
    'Cilantro',
    'Cumin',
    'Chili Powder',
    'Cayenne Pepper',
    'Paprika',
    'Coriander',
    'Lime',
    'Lemon',
    'Orange',
    'Grapefruit',
    'Mango',
    'Pineapple',
    'Peaches',
    'Apples',
    'Bananas',
    'Blueberries',
    'Strawberries',
    'Raspberries',
    'Blackberries',
    'Kiwi',
    'Avocado',
    'Green Onions',
    'Chives',
    'Parsley',
    'Thyme',
    'Rosemary',
    'Sage',
    'Oregano',
    'Dill',
    'Mint',
    'Basil Pesto',
    'Almonds',
    'Walnuts',
    'Pecans',
    'Cashews',
    'Peanuts',
    'Pistachios',
    'Hazelnuts',
    'Macadamia Nuts',
    'Coconut Flakes',
    'Sunflower Seeds',
    'Pumpkin Seeds',
    'Chia Seeds',
    'Flaxseeds',
    'Sesame Seeds',
    'Poppy Seeds',
    'Quinoa',
    'Couscous',
    'Bulgur',
    'Barley',
    'Farro',
    'Millet',
    'Wild Rice',
    'Red Lentils',
    'Green Lentils',
    'Black Lentils',
    'Chickpeas',
    'Black Beans',
    'Kidney Beans',
    'Cannellini Beans',
    'Pinto Beans',
    'Great Northern Beans',
    'Adzuki Beans',
    'Mung Beans',
    'Black Eyed Peas',
    'Split Peas',
    'Edamame',
    'Tofu',
    'Tempeh',
    'Seitan',
    'Jackfruit',
    'Textured Vegetable Protein (TVP)',
    'Nutritional Yeast',
    'Honey',
    'Maple Syrup',
    'Agave Nectar',
    'Molasses',
    'Coconut Sugar',
    'Stevia',
    'Xylitol',
    'Erythritol',
    'Monk Fruit Sweetener',
    'Date Syrup',
    'Coconut Flour',
    'Almond Flour',
    'Oat Flour',
    'Chickpea Flour',
    'Buckwheat Flour',
    'Quinoa Flour',
    'Rye Flour',
    'Spelt Flour',
    'Tapioca Flour',
    'Arrowroot Flour',
    'Cornmeal',
    'Breadcrumbs',
    'Panko Breadcrumbs',
    'Cornstarch',
    'Potato Starch',
    'Rice Flour',
    'Wheat Germ',
    'Wheat Bran',
    'Flaxseed Meal',
    'Psyllium Husk',
    'Cocoa Powder',
    'Carob Powder',
    'Matcha Powder',
    'Turmeric',
    'Saffron',
    'Cumin Seeds',
    'Fennel Seeds',
    'Mustard Seeds',
    'Poppy Seeds',
    'Cardamom Pods',
    'Vanilla Beans',
    'Almond Extract',
    'Orange Blossom Water',
    'Rose Water',
    'Lemon Zest',
    'Orange Zest',
    'Lemon Extract',
    'Almond Milk',
    'Soy Milk',
    'Oat Milk',
    'Coconut Water',
    'Raspberry Jam',
    'Strawberry Jam',
    'Apricot Jam',
    'Peach Jam',
    'Fig Jam',
    'Blueberry Jam',
    'Blackberry Jam',
    'Cherry Jam',
    'Grape Jam',
    'Plum Jam',
    'Marmalade',
    'Peanut Butter',
    'Almond Butter',
    'Cashew Butter',
    'Hazelnut Butter',
    'Sunflower Seed Butter',
    'Tahini',
    'Hummus',
    'Guacamole',
    'Tzatziki',
    'Baba Ganoush',
    'Pesto Sauce',
    'Marinara Sauce',
    'Alfredo Sauce',
    'Peanut Sauce',
    'Teriyaki Sauce',
    'Hoisin Sauce',
    'Sweet Chili Sauce',
    'Thai Red Curry Paste',
    'Thai Green Curry Paste',
    'Harissa Paste',
    'Tom Yum Paste',
    'Miso Paste',
    'Tahini Paste',
    'Balsamic Vinegar',
    'Red Wine Vinegar',
    'White Wine Vinegar',
    'Apple Cider Vinegar',
    'Rice Wine Vinegar',
    'Sherry Vinegar',
    'Malt Vinegar',
    'Mirin',
    'Sake',
    'Port Wine',
    'Sherry',
    'Marsala Wine',
    'Dry White Wine',
    'Dry Red Wine',
    'Sweet Vermouth',
    'Dry Vermouth',
    'Cognac',
    'Brandy',
    'Rum',
    'Whiskey',
    'Tequila',
    'Gin',
    'Vodka',
    'Sake',
    'Prosecco',
    'Champagne',
    'Beer',
    'Wine',
    'Soda Water',
    'Tonic Water',
    'Ginger Beer',
    'Lemonade',
    'Iced Tea',
    'Fruit Juice',
    'Vegetable Juice',
    'Coconut Water',
    'Sports Drink',
    'Energy Drink',
    'Milkshake',
    'Smoothie',
    'Coffee',
    'Espresso',
    'Cappuccino',
    'Latte',
    'Macchiato',
    'Americano',
    'Mocha',
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
  void _saveIngredientsToFile() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/ingredients.txt');

      final buffer = StringBuffer();
      ingredientQuantities.forEach((ingredient, quantity) {
        buffer.writeln('$ingredient: $quantity');
      });

      // Open the file in append mode and write the new data
      await file.writeAsString(buffer.toString(), mode: FileMode.append);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Ingredients have been saved to ingredients.txt'),
          duration: Duration(seconds: 2),
        ),
      );
    } catch (e) {
      print('Error saving ingredients: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to save ingredients to the txt file '),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

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
