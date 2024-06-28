import 'package:flutter/material.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({super.key,required this.changedrawer});
  final Function(String identifier) changedrawer;
  @override
  Widget build(context) {
    return Drawer(
      child: Column(
        children: [
         const DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 213, 14, 14),
                Colors.orange,
                Colors.yellow
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.fastfood),
                SizedBox(width: 15),
                Text("COOKING up!"),
              ],
            ),
          ),
          ListTile(
            leading:const Icon(Icons.restaurant),
            title:const Text('MEALS',style: TextStyle(fontSize: 24,color: Colors.amber),),
            onTap: (){
              changedrawer("meals");
            },
          ),
             ListTile(
            leading:const Icon(Icons.settings),
            title:const Text('FILTERS',style: TextStyle(fontSize: 24,color: Colors.amber),),
            onTap: (){
              changedrawer("filter");
            },
          ),
        ],
      ),
    );
  }
}
