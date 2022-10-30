import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MyHomePage();
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool bookNow = false;
  bool bookForLater = false;
  String? gender;
  double _currentValue = 0;
  bool switchState = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(tabs: [
              Tab(
                child: Text("Book Now"),
              ),
              Tab(icon: Icon(Icons.directions_bike_rounded), ),
              Tab(icon: Icon(Icons.directions_bus_filled_outlined))
            ]),
          ),
          bottomNavigationBar: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            notchMargin: 10,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.museum_rounded)),
                IconButton(onPressed: () {}, icon: Icon(Icons.search)),
              ],
            ),
          ),

          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.supervised_user_circle_outlined),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Text('Profile'),
                ),
                ListTile(
                  title: const Text('Item 1'),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text('Item 2'),
                  onTap: () {},
                ),
              ],
            ),
          ),
          body:

          Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Text(" Select anyone:"),
                  SizedBox(
                    width: 20,
                  ),
                  Text("Book Now"),
                  Checkbox(
                      value: bookNow,
                      onChanged: (bool? value) {
                        setState(() {
                          bookNow = value!;
                          if (bookForLater == true) {
                            bookForLater = false;
                          }
                        });
                      }),
                  Text("Book for later"),
                  Checkbox(
                      value: bookForLater,
                      onChanged: (bool? value) {
                        setState(() {
                          bookForLater = value!;
                          if (bookNow == true) {
                            bookNow = false;
                          }
                        });
                      })
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Text("Select Your Gender:"),
                  Row(
                    children: [
                      Radio(
                          value: "male",
                          groupValue: gender,
                          onChanged: (value) {
                            setState(() {
                              gender = value.toString();
                            });
                          }),
                      const Text("Male"),
                      Radio(
                          value: "female",
                          groupValue: gender,
                          onChanged: (value) {
                            setState(() {
                              gender = value.toString();
                            });
                          }),
                      const Text("Female"),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Text("Rate the Services"),
              Slider(
                  value: _currentValue,
                  min: 0,
                  max: 10,
                  divisions: 10,
                  label: _currentValue.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      _currentValue = value;
                    });
                  }),
              Switch(
                  value: switchState,
                  onChanged: (value) {
                    setState(() {
                      switchState = value;
                    });
                  })
            ],
          ),
        ),
      ),
    );
  }
}
