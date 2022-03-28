import 'package:flutter/material.dart';
import '../models/meals.dart';

class MealItem extends StatelessWidget {
  final String? title;
  final String? imageUrl;
  final int? duration;
  final Complexity? complexity;
  final Affordability? affordability;

  const MealItem({
    @required this.title,
    @required this.imageUrl,
    @required this.duration, 
    @required this.complexity,
    @required this.affordability, 
    Key? key}) : super(key: key);

  void selectedMeal() {}

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: selectedMeal,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                      imageUrl!,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
