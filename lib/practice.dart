import 'package:flutter/material.dart';

class PracticePage extends StatelessWidget {
  const PracticePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Elevated Button Practice"),
      ),

      body: Center(
        child: ElevatedButton(
          onPressed: () {
            print("Button was clicked!");
          },
          child: const Text("Click Me"),
        ),
      ),
    );
  }


}