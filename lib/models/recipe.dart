import 'package:flutter/material.dart';

class Recipe {
  final String id;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final List<String> reviews;
  bool isFavorite;

  Recipe({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
    required this.reviews,
    this.isFavorite = false,
  });
}

final List<Recipe> dummyRecipes = [
  Recipe(
    id: '1',
    title: 'Chicken Tikka Masala',
    imageUrl: 'assets/ChickenTikkaMasala.png',
    ingredients: ['Chicken', 'Yogurt', 'Tomato Sauce', 'Spices', 'Cream'],
    steps: ['Marinate chicken', 'Grill or bake', 'Simmer in tomato sauce with cream'],
    reviews: ['Rich and flavorful!', 'Absolutely delicious!'],
    isFavorite: false,
  ),
  Recipe(
    id: '2',
    title: 'Pasta Primavera',
    imageUrl: 'assets/PastaPrimavera.png',
    ingredients: ['Pasta', 'Assorted Vegetables', 'Olive Oil', 'Garlic', 'Parmesan Cheese'],
    steps: ['Cook pasta', 'Sauté vegetables with garlic in olive oil', 'Toss with pasta and cheese'],
    reviews: ['Fresh and tasty!', 'Love the mix of veggies!'],
    isFavorite: false,
  ),
  Recipe(
    id: '3',
    title: 'Beef Tacos',
    imageUrl: 'assets/BeefTacos.png',
    ingredients: ['Ground Beef', 'Taco Seasoning', 'Tortillas', 'Lettuce', 'Tomato', 'Cheese', 'Salsa', 'Sour Cream'],
    steps: ['Cook beef with taco seasoning', 'Assemble tacos with desired toppings'],
    reviews: ['So satisfying!', 'Great for taco night!'],
    isFavorite: false,
  ),
  Recipe(
    id: '4',
    title: 'Caesar Salad',
    imageUrl: 'assets/CaesarSalad.png',
    ingredients: ['Romaine Lettuce', 'Caesar Dressing', 'Croutons', 'Parmesan Cheese'],
    steps: ['Toss lettuce with dressing', 'Top with croutons and cheese'],
    reviews: ['Classic and delicious!', 'Perfect light meal!'],
    isFavorite: false,
  ),
  Recipe(
    id: '5',
    title: 'Sushi Rolls',
    imageUrl: 'assets/SushiRolls.png',
    ingredients: ['Sushi Rice', 'Nori Seaweed', 'Assorted Fish', 'Vegetables', 'Soy Sauce', 'Wasabi', 'Pickled Ginger'],
    steps: ['Spread rice on nori', 'Add fillings, roll tightly', 'Slice and serve with soy sauce, wasabi, and pickled ginger'],
    reviews: ['Homemade sushi is the best!', 'Delicious and fresh!'],
    isFavorite: false,
  ),
  Recipe(
    id: '6',
    title: 'Beef Stir Fry',
    imageUrl: 'assets/BeefStirFry.png',
    ingredients: ['Beef Strips', 'Bell Peppers', 'Broccoli', 'Carrots', 'Soy Sauce', 'Garlic', 'Ginger', 'Rice'],
    steps: ['Sear beef', 'Stir-fry vegetables', 'Add sauce, serve over rice'],
    reviews: ['Quick and flavorful!', 'Great weeknight dinner!'],
    isFavorite: false,
  ),
  Recipe(
    id: '7',
    title: 'Margherita Pizza',
    imageUrl: 'assets/MargheritaPizza.png',
    ingredients: ['Pizza Dough', 'Tomato Sauce', 'Fresh Mozzarella Cheese', 'Fresh Basil', 'Olive Oil'],
    steps: ['Roll out dough', 'Top with sauce, cheese, and basil', 'Bake until golden and bubbly'],
    reviews: ['Classic and tasty!', 'Best pizza ever!'],
    isFavorite: false,
  ),
  Recipe(
    id: '8',
    title: 'Chicken Caesar Salad Wraps',
    imageUrl: 'assets/ChickenCaesarSaladWraps.png',
    ingredients: ['Grilled Chicken Strips', 'Romaine Lettuce', 'Caesar Dressing', 'Parmesan Cheese', 'Tortillas'],
    steps: ['Fill tortillas with chicken, lettuce, dressing, and cheese', 'Roll up tightly'],
    reviews: ['Perfect for a quick lunch!', 'Healthy and delicious!'],
    isFavorite: false,
  ),
  Recipe(
    id: '9',
    title: 'Vegetable Curry',
    imageUrl: 'assets/VegetableCurry.png',
    ingredients: ['Assorted Vegetables', 'Curry Sauce', 'Coconut Milk', 'Rice'],
    steps: ['Cook vegetables in curry sauce and coconut milk', 'Serve over rice'],
    reviews: ['So flavorful!', 'Love the variety of veggies!'],
    isFavorite: false,
  ),
  Recipe(
    id: '10',
    title: 'Chocolate Chip Cookies',
    imageUrl: 'assets/ChocolateChipCookies.png',
    ingredients: ['Flour', 'Butter', 'Sugar', 'Brown Sugar', 'Eggs', 'Vanilla Extract', 'Baking Soda', 'Chocolate Chips'],
    steps: ['Cream butter and sugars', 'Add eggs and vanilla', 'Mix in dry ingredients and chocolate chips', 'Bake until golden'],
    reviews: ['The best cookies ever!', 'So addictive!'],
    isFavorite: false,
  ),
];
