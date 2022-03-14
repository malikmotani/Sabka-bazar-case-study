import 'package:flutter/material.dart';

import '../cart/cart_page.dart';

class CartAction extends StatelessWidget {
  const CartAction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (() => Navigator.pushNamed(context, CartPage.routName)),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Icon(
            Icons.shopping_cart_sharp,
            size: 40,
            color: Colors.grey.shade200,
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              padding: const EdgeInsets.all(2.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.green,
              ),
              constraints: const BoxConstraints(
                minWidth: 16,
                minHeight: 16,
              ),
              child: const Text(
                "1",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
