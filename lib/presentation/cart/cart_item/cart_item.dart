import 'package:flutter/material.dart';

import '../../../remote/models/cart_model.dart';
import '../../common/cart_quantity_button.dart';

class CartItem extends StatelessWidget {
  final CartModel cartModel;

  const CartItem({Key? key, required this.cartModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 20, 0, 20),
            child: Image.asset(
              cartModel.imageURL.toString(),
              height: 100,
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(5, 10, 10, 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cartModel.name.toString(),
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      AppSolidCircleButton(
                        iconData: Icons.remove,
                        onPressed: () => {},
                      ),
                      const SizedBox(width: 10),
                      Text(
                        cartModel.qty.toString(),
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 10),
                      AppSolidCircleButton(
                        iconData: Icons.add,
                        onPressed: () => {},
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'X',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "Rs.${cartModel.price.toString()}",
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "Rs.${((cartModel.price ?? 0) * (cartModel.qty ?? 1)).toString()}",
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
