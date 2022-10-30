

import 'package:flutter/material.dart';

void main() {
  runApp(const SampleApp());
}

class SampleApp extends StatelessWidget {
  const SampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Sign up here"),
        ),
        body: const SignUpDialogue(),
      ),
    );
  }
}

class SignUpDialogue extends StatefulWidget {
  const SignUpDialogue({Key? key}) : super(key: key);

  @override
  State<SignUpDialogue> createState() => _SignUpDialogueState();
}

class _SignUpDialogueState extends State<SignUpDialogue> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Full Name',
            ),
          ),
        ),

    Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
      decoration: InputDecoration(
      border: OutlineInputBorder(),
      hintText: 'Your Email Address',

      ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
      decoration: InputDecoration(
      border: OutlineInputBorder(),
      hintText: 'Password- Must Contain 8 Characters',

      ),
      ),
    ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Confirm Your Password',

            ),
          ),
        ),
        ElevatedButton(onPressed:  null, child: Text('Signup'))
      ],
    );
  }
}
