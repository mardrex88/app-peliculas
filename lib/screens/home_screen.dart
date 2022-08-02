import 'package:flutter/material.dart';

import 'package:app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Peliculas en Cine'),
          backgroundColor: Colors.lightGreen,
          elevation: 0,
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                //   showSearch(context: context, delegate: DataSearch());
              },
            ),
          ],
        ),
        body: Column(
          children: [CardSwiper()],
        ));
  }
}
