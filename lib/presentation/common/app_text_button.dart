import 'package:flutter/material.dart';

class AppTextButton extends StatelessWidget {
  final Function onPressed;
  final String text;

  const AppTextButton({
    required this.text,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onPressed(),
      child: Text(
        text,
        style: const TextStyle(color: Colors.pink),
      ),
    );
  }
}
