import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(contact());
}

class contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
              elevation: 0,
              title: Text(
                "Contact Us",
                style: TextStyle(color: Colors.orange),
              ),
              backgroundColor: Colors.white),
          body: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Center(
                  child: Image.asset(
                "img/contact.jpg",
                height: 250,
              )),
              SizedBox(
                height: 20,
              ),
              Text(
                "If You Need Any Help \n Feel Free To Contact Us",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey[600]),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        height: 100,
                        width: 150,
                        decoration:
                            BoxDecoration(color: Colors.white, boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 20,
                          )
                        ]),
                        child: Column(children: <Widget>[
                          Icon(
                            Icons.alternate_email,
                            color: Colors.orange,
                            size: 50,
                          ),
                          Text('Write to us:'),
                          Text('Help@gmail.com'),
                        ])),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,
                      width: 150,
                      decoration:
                          BoxDecoration(color: Colors.white, boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 20,
                        )
                      ]),
                      child: Column(children: <Widget>[
                        Icon(
                          Icons.question_answer,
                          color: Colors.orange,
                          size: 50,
                        ),
                        Text('FAQs'),
                        Text(
                          'Frequently asked \n questions',
                          textAlign: TextAlign.center,
                        ),
                      ]),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        height: 100,
                        width: 150,
                        decoration:
                            BoxDecoration(color: Colors.white, boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 20,
                          )
                        ]),
                        child: Column(
                          children: <Widget>[
                            Icon(
                              Icons.call,
                              color: Colors.orange,
                              size: 50,
                            ),
                            Text(
                              "Phone Number:",
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              "030000001",
                              textAlign: TextAlign.center,
                            ),
                          ],
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        height: 100,
                        width: 150,
                        decoration:
                            (BoxDecoration(color: Colors.white, boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 20,
                          )
                        ])),
                        child: Column(children: <Widget>[
                          Icon(
                            Icons.location_city,
                            color: Colors.orange,
                            size: 50,
                          ),
                          Text(
                            "Meet Us:",
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "Dadu City",
                            textAlign: TextAlign.center,
                          ),
                        ])),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
