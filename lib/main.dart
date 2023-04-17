import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Forms')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              child: Text(
                'Working with forms',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              ),
              alignment: Alignment.center,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a value';
                      } else {
                        return null;
                      }
                    },
                  ),
                ],
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Proceeding Checkout...")));
                  }
                },
                child: Text("Submit"))
          ],
        ),
      ),
    );
  }
}
