import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Professnow',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
   
  int firstnum;
  int secondnum;
  String texttodisplay = '';
  String res;
  String operatortoperform;

  void btnclicked(String btnvalue) {
    if (btnvalue == 'C') {
      texttodisplay = '';
      firstnum = 0;
      secondnum = 0;
      res = '';
    } 
    else if (
        btnvalue == '+' ||
        btnvalue == '-' ||
        btnvalue == 'x' ||
        btnvalue == '/') {
      firstnum = int.parse(texttodisplay);
      res = '';
      operatortoperform = btnvalue;
    } 
    else if (btnvalue == '=') {
      secondnum = int.parse(texttodisplay);
      if (operatortoperform == '+') { 
        res = (firstnum + secondnum).toString();
      }
      if (operatortoperform == '-') {
        res = (firstnum - secondnum).toString();
      }
      if (operatortoperform == 'x') {
        res = (firstnum * secondnum).toString();
      }
      if (operatortoperform == '/') {
        res = (firstnum / secondnum).toString();
      }
    } 
    else {
      res = int.parse(texttodisplay + btnvalue).toString();
    }

    setState(() {
      texttodisplay = res;
    });
  }

  // button class start
  Widget custombutton(String btnvalue) {
    return Expanded(
      child: OutlineButton(
        padding: EdgeInsets.all(20),
        onPressed: () => btnclicked(btnvalue),
        child: Text(
          '$btnvalue',
          style: TextStyle(
            fontSize: 20,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
// button class end

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Expanded(
                child: Container(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    '$texttodisplay',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                custombutton('9'),
                custombutton('8'),
                custombutton('7'),
                custombutton('+'),
              ],
            ),
            Row(
              children: <Widget>[
                custombutton('6'),
                custombutton('5'),
                custombutton('4'),
                custombutton('-'),
              ],
            ),
            Row(
              children: <Widget>[
                custombutton('3'),
                custombutton('2'),
                custombutton('1'),
                custombutton('x'),
              ],
            ),
            Row(
              children: <Widget>[
                custombutton('C'),
                custombutton('0'),
                custombutton('='),
                custombutton('/'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
