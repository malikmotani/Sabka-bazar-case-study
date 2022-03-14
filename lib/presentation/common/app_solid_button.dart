import 'package:flutter/material.dart';
import 'package:sabka_bazar/presentation/common/extenstions.dart';

class AppSolidButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  final double borderRadius;
  final IconData buttonImage;
  final bool isImageOnly;

  const AppSolidButton({
    this.text = '',
    required this.onPressed,
    this.borderRadius = 0.0,
    this.buttonImage = Icons.remove,
    this.isImageOnly = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          ),
        ),
      ),
      onPressed: () => onPressed(),
      child: _getChildWidget(),
    );
  }

  Widget _getChildWidget() {
    return isImageOnly
        ? Icon(
            buttonImage,
            color: Colors.white,
          )
        : Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Text(text.toTitleCase()),
          );
  }
}
