import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Peliculas en Cine'),
        elevation: 0,
      ),
      body: Center(
        child: Container(
          child: Text('Home Page'),
        ),
      ),
    );
  }
}
