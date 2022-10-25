import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import "package:cv_generator/model/user_data.dart";

class CostumeAlertDialogue extends StatefulWidget {
  String buttonTitle, instituteType, occupationType;
  UserData user = UserData();

  CostumeAlertDialogue({
    super.key,
    required BuildContext context,
    required this.buttonTitle,
    required this.instituteType,
    required this.occupationType,
  });

  @override
  State<CostumeAlertDialogue> createState() => _CostumeAlertDialogueState();
}

class _CostumeAlertDialogueState extends State<CostumeAlertDialogue> {
  @override
  Widget build(BuildContext context) {
    TextEditingController instituteTypeController = TextEditingController();
    TextEditingController occupationTypeController = TextEditingController();
    TextEditingController fromController = TextEditingController();
    TextEditingController toController = TextEditingController();
    return TextButton.icon(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              actions: <Widget>[
                TextButton.icon(
                  onPressed: () {
                    setState(() {
                      widget.user.addExperience(
                        instituteName: instituteTypeController.text,
                        occupation: occupationTypeController.text,
                        fromDate: fromController.text,
                        toDate: toController.text,
                      );
                      Navigator.pop(context);
                    });
                    print(widget.user.experienceList);
                  },
                  icon: const Icon(Icons.add),
                  label: const Text("Add"),
                ),
              ],
              content: SizedBox(
                width: 600,
                height: 400,
                child: Form(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: occupationTypeController,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 5),
                            label: Text(widget.occupationType),
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: instituteTypeController,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 5),
                            label: Text(widget.instituteType),
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [Text("From"), Text("To")],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 100,
                            child: TextFormField(
                              controller: fromController,
                              onTap: () async {
                                DateTime? fromDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1990),
                                  lastDate: DateTime.now(),
                                );
                                if (fromDate != null) {
                                  debugPrint(fromDate.toString());
                                  String formatedToDate =
                                      DateFormat('yyyy-MM-dd').format(fromDate);
                                  setState(() {
                                    fromController.text = formatedToDate;
                                  });
                                }
                              },
                              readOnly: true,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 5),
                                label: Text("Pick From"),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Text(
                            "-",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 100,
                            child: TextFormField(
                              controller: toController,
                              onTap: () async {
                                // ignore: unused_local_variable
                                DateTime? toDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1990),
                                  lastDate: DateTime.now(),
                                );
                                if (toDate != null) {
                                  debugPrint(toDate.toString());
                                  // ignore: unused_local_variable
                                  String formatedToDate =
                                      DateFormat('yyyy-MM-dd').format(toDate);
                                  setState(() {
                                    toController.text = formatedToDate;
                                  });
                                }
                              },
                              readOnly: true,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 5),
                                label: Text("Pick To"),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
      icon: const Icon(Icons.add),
      label: Text(widget.buttonTitle),
    );
  }
}
