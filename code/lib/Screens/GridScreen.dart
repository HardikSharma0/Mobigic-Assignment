import 'package:flutter/material.dart';

class GridScreen extends StatefulWidget {
  final int m;
  final int n;

  const GridScreen({
    Key? key,
    required this.m,
    required this.n,
  }) : super(key: key);

  @override
  State<GridScreen> createState() => _GridScreenState();
}

class _GridScreenState extends State<GridScreen> {
  get m => widget.m;
  get n => widget.n;
  List<String> alphabets = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.amberAccent.shade100,
          child: GridView.builder(
              itemCount: m * n,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: m,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
              ),
              itemBuilder: (context, index) => Container(
                    color: Colors.white,
                  ))),
    );
  }
}
