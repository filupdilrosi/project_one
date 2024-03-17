import 'package:flutter/material.dart';
import 'package:project_one/home_screen.dart';
import 'package:project_one/recipe_list_screen.dart';
import 'package:project_one/meal_planner_screen.dart';
import 'package:project_one/grocery_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meal Planner App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/recipes': (context) => RecipeListScreen(),
        '/mealplanner': (context) => MealPlannerScreen(),
        '/grocerylist': (context) => GroceryListScreen(),
      },
    );
  }
}
