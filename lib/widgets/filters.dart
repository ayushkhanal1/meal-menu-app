import 'package:flutter/material.dart';
import 'package:meals/screen/screentabs.dart';
import 'package:meals/widgets/drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/filters_provider.dart';

class FilterScreen extends ConsumerStatefulWidget {
  const FilterScreen({super.key});
  @override
  ConsumerState<FilterScreen> createState() {
    return _FilterScreenState();
  }
}

class _FilterScreenState extends ConsumerState<FilterScreen> {
  var _gluttenfreeset = false;
  var _lactosefreeset = false;
  var _vegeterianset = false;
  var _veganset = false;
  @override
  void initState() {
    super.initState();
    final activefilter=ref.read(filtersprovider);
       _gluttenfreeset = activefilter[Filter.gluttenFree]!;
       _lactosefreeset = activefilter[Filter.lactoseFree]!;
       _vegeterianset = activefilter[Filter.vegeterian]!;
       _veganset = activefilter[Filter.vegan]!;
  }
  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FILTERS"),
      ),
      drawer: SideDrawer(changedrawer: (identifier) {
        Navigator.of(context).pop();
        if (identifier == "meals") {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => const ScreenTabs(),
            ),
          );
        }
      }),
      body: WillPopScope(
        onWillPop: () async{
          ref.read(filtersprovider.notifier).setFilters({Filter.gluttenFree: _gluttenfreeset,
              Filter.lactoseFree: _lactosefreeset,
              Filter.vegeterian: _vegeterianset,
              Filter.vegan: _veganset});
          // Navigator.of(context).pop({});
          return true;
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _gluttenfreeset,
              onChanged: (checked) {
                setState(() {
                  _gluttenfreeset = checked;
                });
              },
              title: const Text('Glutten free'),
              subtitle: const Text('Only include glutten free'),
              activeColor: Colors.blue,
            ),
            SwitchListTile(
              value: _lactosefreeset,
              onChanged: (checked) {
                setState(() {
                  _lactosefreeset = checked;
                });
              },
              title: const Text('lactose free'),
              subtitle: const Text('Only include lactose free'),
              activeColor: Colors.blue,
            ),
            SwitchListTile(
              value: _vegeterianset,
              onChanged: (checked) {
                setState(() {
                  _vegeterianset = checked;
                });
              },
              title: const Text('vegeterian'),
              subtitle: const Text('Only include vegeterian'),
              activeColor: Colors.blue,
            ),
            SwitchListTile(
              value: _veganset,
              onChanged: (checked) {
                setState(() {
                  _veganset = checked;
                });
              },
              title: const Text('vegan'),
              subtitle: const Text('Only include vegan'),
              activeColor: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
