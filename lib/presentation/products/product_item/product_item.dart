import 'package:flutter/material.dart';

import '../../../remote/models/product_model.dart';
import '../../cart/cart_page.dart';
import '../../common/app_solid_button.dart';

class ProductItem extends StatelessWidget {
  final ProductModel productModel;

  const ProductItem({Key? key, required this.productModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            productModel.name.toString(),
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Image.asset(
                productModel.imageURL.toString(),
                width: 150,
                height: 150,
              ),
              SizedBox(height: 30),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                      margin: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                      color: Colors.grey.shade200,
                      child: Text(
                        productModel.description.toString(),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: AppSolidButton(
                          text: "Buy Now @ MRP Rs." +
                              productModel.price.toString(),
                          onPressed: () => {
                                Navigator.pushNamed(
                                    context, CartPage.routName)
                              }),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  void _checkCartCount() {}
}
