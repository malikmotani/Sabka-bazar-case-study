import 'package:flutter/material.dart';

class AppSolidCircleButton extends StatelessWidget {
  final IconData iconData;
  final Function onPressed;
  final double size;

  const AppSolidCircleButton({
    Key? key,
    required this.iconData,
    required this.onPressed,
    this.size = 30,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: Size(size, size),
      child: ClipOval(
        child: Material(
          type: MaterialType.circle,
          color: Colors.pink,
          child: Center(
            child: IconButton(
              icon: Icon(
                iconData,
                size: 15,
              ),
              color: Colors.white,
              onPressed: () => onPressed(),
            ),
          ),
        ),
      ),
    );
  }
}
