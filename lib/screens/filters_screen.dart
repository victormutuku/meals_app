import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FilterScreen extends StatelessWidget {
  static const routeName = '/filterscreen';
  const FilterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(title: const Text('Filters')),
        drawer: const MainDrawer(),
        body: const Center(child: Text('Filters')));
  }
}
