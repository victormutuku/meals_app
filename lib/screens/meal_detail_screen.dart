import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/mealdetails';
  final Function toggleFavourites;
  final Function isFavourite;

  const MealDetailScreen(this.toggleFavourites, this.isFavourite, {Key? key}) : super(key: key);

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10)),
        height: 150,
        width: 300,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String?>;
    final String mealId = routeArgs['id'] as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Center(
            child: Text(
              selectedMeal.title!,
              style:const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold),
              ),
          ),
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                  height: 300,
                  width: double.infinity,
                  child: Image.network(
                        selectedMeal.imageUrl!,
                        fit: BoxFit.cover,
                      ),
                    ),
              buildSectionTitle(context, 'Ingredients'),
              buildContainer(
                ListView.builder(
                    itemBuilder: ((context, index) => Card(
                          color: Theme.of(context).accentColor,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            child: Text(selectedMeal.ingredients![index]),
                          ),
                        )),
                    itemCount: selectedMeal.ingredients!.length),
              ),
              buildSectionTitle(context, 'Steps'),
              buildContainer(ListView.builder(
                itemBuilder: ((context, index) => Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            child: Text('#${index + 1}'),
                          ),
                          title: Text(selectedMeal.steps![index]),
                        ),
                        const Divider(),
                      ],
                    )),
                itemCount: selectedMeal.steps!.length,
              ))
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => toggleFavourites(mealId),
          child: Icon(isFavourite(mealId)? Icons.star : Icons.star_border),
        ));
  }
}
