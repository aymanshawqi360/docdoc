import 'package:flutter/material.dart';

class EmptyPage extends StatelessWidget {
  const EmptyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Empty Page"),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          "This is an empty page.",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
