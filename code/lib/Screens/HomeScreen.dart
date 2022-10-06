import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobigic/Screens/GridScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _validater = false;
  bool _validatec = false;
  TextEditingController row = TextEditingController();
  TextEditingController column = TextEditingController();
  late int rows;
  late int columns;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.amberAccent.shade100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                'Rows',
                style: TextStyle(
                    wordSpacing: 5,
                    color: Colors.black87,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              TextField(
                  maxLength: 1,
                  decoration: InputDecoration(
                      errorText:
                          _validater ? 'This Field can\'t be Empty' : null,
                      hintText: 'Enter the Number'),
                  controller: row,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  keyboardType: TextInputType.number),
              const Text(
                'Columns',
                style: TextStyle(
                    wordSpacing: 5,
                    color: Colors.black87,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              TextField(
                  maxLength: 1,
                  decoration: InputDecoration(
                    errorText: _validatec ? 'This Field Can\'t Be Empty' : null,
                    hintText: 'Enter the Number ',
                  ),
                  controller: column,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  keyboardType: TextInputType.number),
              FloatingActionButton.extended(
                onPressed: () {
                  setState(() {
                    column.text.isEmpty
                        ? _validatec = true
                        : _validatec = false;
                    row.text.isEmpty ? _validater = true : _validater = false;
                  });
                  rows = int.parse(row.text);
                  columns = int.parse(column.text);

                  if (rows == 0 || columns == 0) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text(
                        'Please Enter Values Between 1-9',
                        style: TextStyle(color: Colors.red),
                      ),
                    ));
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                GridScreen(m: rows, n: columns)));
                  }
                },
                extendedPadding: const EdgeInsets.all(50),
                elevation: 10,
                label: const Icon(Icons.add),
              ),
            ],
          )),
    );
  }
}
