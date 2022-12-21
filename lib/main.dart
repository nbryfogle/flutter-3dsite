import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: Home()));
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[600],
        body: Center(
            child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey[900]!,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey[800]),
                margin: const EdgeInsets.all(100),
                child: const PrintForm())));
  }
}

class PrintForm extends StatefulWidget {
  const PrintForm({
    Key? key,
  }) : super(key: key);

  @override
  State<PrintForm> createState() => _PrintFormState();
}

class _PrintFormState extends State<PrintForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void validateAndSave() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("iwefnwef")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Padding(
              padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              child: Text("Order a 3D Print!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                  ))),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field is required.';
                  }
                  return null;
                },
                style: const TextStyle(
                  color: Colors.white,
                ),
                decoration: getFormDecoration('Full Name')),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: TextFormField(
                decoration: getFormDecoration('Student Email'),
                validator: (value) {
                  if (!value!.endsWith('@students.carboncti.org')) {
                    return 'That is not a student email!';
                  }
                  return null;
                },
              )),
          ElevatedButton(
            onPressed: validateAndSave,
            child: const Text(
              'Submit!',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}

InputDecoration getFormDecoration(String label) {
  return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: Colors.white),
      border: const OutlineInputBorder(),
      focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueGrey)),
      enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white)));
}
