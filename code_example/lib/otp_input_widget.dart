import 'package:flutter/material.dart';

class OtpInput extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;

  const OtpInput(
    this.controller, {
    Key? key,
    required this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 50,
      child: TextField(
        style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
        textCapitalization: TextCapitalization.characters,
        // autofocus: autoFocus,
        textAlign: TextAlign.center,
        keyboardType: keyboardType,
        controller: controller,
        maxLength: 1,
        cursorColor: Theme.of(context).primaryColor,
        decoration: const InputDecoration(
            border: OutlineInputBorder(),
            counterText: '',
            hintStyle: TextStyle(color: Colors.grey, fontSize: 20.0)),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
  }
}
