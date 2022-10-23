import 'package:flutter/material.dart';

class ListViewBuilderExample extends StatelessWidget {
  List<int> randomNumbers = [
    1,
    5,
    4,
    46,
    6,
    116,
    118,
    7,
    9,
    117,
    8,
    130,
    45,
    3,
    124,
    69,
    114,
    37
  ];
  ListViewBuilderExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('ListView Builder Example'),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: ListView.builder(
          padding: EdgeInsets.all(16),
          itemCount: randomNumbers.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              color: Colors
                  .primaries[randomNumbers[index] % Colors.primaries.length]
                  .shade100,
              child: ListTile(
                contentPadding: EdgeInsets.all(16),
                leading: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      color: Colors
                          .primaries[
                              randomNumbers[index] % Colors.primaries.length]
                          .shade900,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 1), // changes position of shadow
                        ),
                      ]),
                ),
                title: Text(
                  "Item #${randomNumbers[index]}",
                  style: TextStyle(
                    color: Colors
                        .primaries[
                            randomNumbers[index] % Colors.primaries.length]
                        .shade900,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
