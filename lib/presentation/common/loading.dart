import 'package:flutter/material.dart';

class CircleProgressBar extends StatelessWidget {
  const CircleProgressBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
