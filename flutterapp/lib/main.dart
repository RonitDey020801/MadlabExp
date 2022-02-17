import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import "package:datetime_picker_formfield/datetime_picker_formfield.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form Validation Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Form Validation Demo'),
        ),
        body: const MyCustomForm(),
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final _formkey = GlobalKey<FormState>();
  final format = DateFormat("dd-MM-yyyy");

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: const InputDecoration(
                icon: Icon(Icons.person),
                hintText: 'Enter your name',
                labelText: 'Name'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
                icon: Icon(Icons.phone),
                hintText: 'Enter your phone number',
                labelText: 'Phone'),
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter((RegExp(r'[0-9]')), allow: true)
            ],
            validator: (value) {
              if (value == null || value.isEmpty || value.length < 10) {
                return 'Please enter a valid phone number';
              }
              return null;
            },
          ),
          DateTimeField(
              decoration: const InputDecoration(
                  icon: Icon(Icons.calendar_today),
                  hintText: 'Enter your date of birth',
                  labelText: 'DOB'),
              format: format,
              onShowPicker: (context, currentValue) {
                return showDatePicker(
                    context: context,
                    initialDate: currentValue ?? DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2100));
              }),
          ElevatedButton(
              onPressed: () {
                if (_formkey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Processing data")));
                }
              },
              child: const Text('Submit')),
        ],
      ),
    );
  }
}
