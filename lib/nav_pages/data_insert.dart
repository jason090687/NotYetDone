import 'package:flutter/material.dart';
import '../components/insert_tile.dart';

class MyInsertPages extends StatelessWidget {
  const MyInsertPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            const Text(
              "Post your Boarding Houses!",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 20),
            MyInsertTile(),
          ],
        ),
      ),
    );
  }
}
