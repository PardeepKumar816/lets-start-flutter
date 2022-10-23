import 'package:flutter/material.dart';

class DrawerExample extends StatelessWidget {
  const DrawerExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 1),
      child: Container(
        color: Colors.black87,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  labelText: 'Search',
                ),
                onChanged: (value) => Null),
            Row(
              children: const [
                Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
                Text('Settings', style: TextStyle(color: Colors.white)),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
