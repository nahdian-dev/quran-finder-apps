import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error Screen'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text("Page Error!"),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Back to Homepage!"),
            ),
          ],
        ),
      ),
    );
  }
}
