import 'package:flutter/material.dart';

class DescriptionTextWidget extends StatefulWidget {
  final String text;

  const DescriptionTextWidget({Key? key, required this.text}) : super(key: key);

  @override
  _DescriptionTextWidgetState createState() => _DescriptionTextWidgetState();
}

class _DescriptionTextWidgetState extends State<DescriptionTextWidget> {
  String firstHalf = '';
  String secondHalf = '';
  //final splitter = const LineSplitter();
  bool flag = true;

  @override
  void initState() {
    super.initState();

    if (widget.text.length > 70) {
      firstHalf = widget.text.substring(0, 180);
      secondHalf = widget.text.substring(180, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
      child: secondHalf.isEmpty
          ? Text(firstHalf)
          : Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  flag ? ("$firstHalf ....") : (firstHalf + secondHalf),
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 15),
                ),
                const SizedBox(
                  height: 14,
                ),
                InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: flag
                          ? [
                              BoxShadow(
                                offset: const Offset(0, -23),
                                color: Colors.white.withOpacity(0.8),
                                blurRadius: 3,
                                spreadRadius: 3,
                              ),
                            ]
                          : null,
                    ),
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          flag ? "Read more" : "Read less",
                          style: const TextStyle(
                              color: Colors.pinkAccent, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      flag = !flag;
                    });
                  },
                ),
              ],
            ),
    );
  }
}
