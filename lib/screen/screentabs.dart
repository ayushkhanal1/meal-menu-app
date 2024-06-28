import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/dummy_data/dummy_data.dart';
import 'package:meals/providers/favourite_provider.dart';
import 'package:meals/screen/categoryscreen.dart';
import 'package:meals/screen/meals.dart';
import 'package:meals/widgets/drawer.dart';
import 'package:meals/widgets/filters.dart';
import 'package:meals/providers/filters_provider.dart';

const kinitialfilter = {
  Filter.gluttenFree: false,
  Filter.lactoseFree: false,
  Filter.vegeterian: false,
  Filter.vegan: false
};

class ScreenTabs extends ConsumerStatefulWidget {
  const ScreenTabs({super.key});

  @override
  ConsumerState<ScreenTabs> createState() {
    return _ScreenTabs();
  }
}

class _ScreenTabs extends ConsumerState<ScreenTabs> {
  int selectedpageindex = 0;
  void _selectedpage(int index) {
    setState(() {
      selectedpageindex = index;
    });
  }

  void _fordrawerscreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == "filter") {
       await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) =>const FilterScreen(),
        ),
      );
    }
  }

  @override
  Widget build(context) {
    final selectedfilter=ref.watch(filtersprovider);
    final availablemeals = dummyMeals.where((meal) {
      if (selectedfilter[Filter.gluttenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (selectedfilter[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (selectedfilter[Filter.vegeterian]! && !meal.isVegetarian) {
        return false;
      }
      if (selectedfilter[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();
    Widget activepage = CategoryScreen(availablemeals:availablemeals);
    var activetitle = 'Categories';
    final favouritesM =ref.watch(favouritemealprovider);
    if (selectedpageindex == 1) {
      activepage = MealScreen(
          title: 'favourites',
          meals: favouritesM,);
      activetitle = 'favourites';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activetitle),
      ),
      drawer: SideDrawer(changedrawer: _fordrawerscreen),
      body: activepage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedpage,
        currentIndex: selectedpageindex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'CATEGORIES'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'FAVOURITES'),
        ],
      ),
    );
  }
}
