import 'dart:convert';

import 'package:flutter/material.dart';

class GridViewWithSeeMoreButton extends StatefulWidget {
  final List<dynamic> list;
  final Color textColor;

  const GridViewWithSeeMoreButton(
      {Key? key, required this.list, required this.textColor})
      : super(key: key);

  @override
  _GridViewWithSeeMoreButtonState createState() =>
      _GridViewWithSeeMoreButtonState();
}

class _GridViewWithSeeMoreButtonState extends State<GridViewWithSeeMoreButton> {
  int length = 0;
  // String secondHalf = '';
  //final splitter = const LineSplitter();
  late bool flag;

  @override
  void initState() {
    super.initState();

    if (widget.list.length > 8) {
      length = 8;
      flag = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
      child: widget.list.length <= 8
          ? GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 100,
                  childAspectRatio: 1.5,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              itemCount: widget.list.length,
              itemBuilder: (BuildContext ctx, index) {
                return Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: widget.textColor.withOpacity(0.05),
                      border: Border.all(
                          color: Colors.black.withOpacity(0.2), width: 1),
                      borderRadius: const BorderRadius.all(Radius.circular(8))),
                  child: Text(
                    widget.list[index].description!.content!,
                    textAlign: TextAlign.center,
                    maxLines: 3,
                    style: TextStyle(
                        color: widget.textColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                );
              })
          : Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 100,
                            childAspectRatio: 1.5,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10),
                    itemCount: length,
                    itemBuilder: (BuildContext ctx, index) {
                      return Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: widget.textColor.withOpacity(0.05),
                            border: Border.all(
                                color: Colors.black.withOpacity(0.2)),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8))),
                        child: Text(
                          widget.list[index].description!.content!,
                          textAlign: TextAlign.center,
                          maxLines: 3,
                          style: TextStyle(
                              color: widget.textColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                      );
                    }),
                const SizedBox(
                  height: 14,
                ),
                InkWell(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        !flag ? "See all" : "See less",
                        style: const TextStyle(
                            color: Colors.pinkAccent, fontSize: 18),
                      ),
                    ],
                  ),
                  onTap: () {
                    setState(() {
                      if (flag) {
                        flag = false;
                        length = 8;
                      } else {
                        flag = true;
                        length = widget.list.length;
                      }
                    });
                  },
                ),
              ],
            ),
    );
  }
}
