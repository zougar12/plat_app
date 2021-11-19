import 'package:flutter/material.dart';
import 'package:food_recipe/views/recipe_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.restaurant_menu),
              SizedBox(width: 10),
              Text('Plats'),
            ],
          ),
        ),
        resizeToAvoidBottomInset: false,
        body: 
             ListView.builder(
                itemCount: 1,
                 itemBuilder: (context, index) {
                return RecipeCard();}
                )
        );
  }
}