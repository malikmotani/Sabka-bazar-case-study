import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sabka_bazar/bloc/cart/cart_bloc.dart';
import 'package:sabka_bazar/bloc/cart/cart_event.dart';
import 'package:sabka_bazar/bloc/cart/cart_state.dart';
import 'package:sabka_bazar/presentation/common/loading.dart';
import '../../remote/models/cart_model.dart';
import '../../remote/models/product_model.dart';
import '../common/app_divider.dart';
import '../common/app_solid_button.dart';
import '../common/shadow_container.dart';
import 'cart_item/cart_item.dart';

class CartPage extends StatefulWidget {
  static const String routName = "/cart_screen";
  final ProductModel? productFromProductList;

  const CartPage({Key? key, this.productFromProductList}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late CartBloc _cartBloc;

  @override
  void initState() {
    super.initState();
    _cartBloc = BlocProvider.of<CartBloc>(context);
    _cartBloc.add(FetchCart());
  }

  @override
  Widget build(BuildContext context) {
    return _populateCart();
  }

  Widget _emptyCart() {
    return Column(
      children: [
        Expanded(child: Container()),
        const Text(
          "No items in your cart",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          "Your favourite items are just a click away",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        Expanded(child: Container()),
        Padding(
          padding: const EdgeInsets.all(20),
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              minWidth: double.infinity,
              minHeight: 50.0,
            ),
            child: AppSolidButton(
              text: "Start Shopping",
              onPressed: () => Navigator.pop(context),
              borderRadius: 5,
            ),
          ),
        ),
      ],
    );
  }

  Widget _populateCart() {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoadingState) {
            return const CircleProgressBar();
          } else if (state is CartSuccessState) {
            final cartItem = state.cartItems;
            if (cartItem.isEmpty) {
              return _emptyCart();
            } else {
              return Column(
                children: [
                  _getTopContainer(cartItem),
                  _getBottomContainer(cartItem)
                ],
              );
            }
          } else {
            return _emptyCart();
          }
        },
      ),
    );
  }

  Flexible _getTopContainer(List<CartModel> cartItems) {
    return Flexible(
      child: Column(
        children: [
          _getSpace(),
          _getMyCart(cartItems),
          _getSpace(),
          _getItemListWidget(cartItems),
          _getSpace(),
          _getLowestPriceView()
        ],
      ),
    );
  }

  ShadowContainer _getBottomContainer(List<CartModel> cartItems) {
    return ShadowContainer(
      child: Column(
        children: [
          const SizedBox(height: 15),
          const Text(
            "Promo code can be applied on payment page",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 15),
          SizedBox(
            width: (MediaQuery.of(context).size.width),
            height: 60,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: TextButton(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.zero),
                  shape: MaterialStateProperty.all(
                    const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                  ),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.pink.shade800),
                ),
                onPressed: () => {
                  /*cartBloc.clear.add("clear"),
                  AppUtilClass.saveCartCount(0),
                  AppUtilClass.showSnackBar(
                    context,
                    'Order is placed Successfully',
                    2,
                  ),*/
                  Navigator.pop(context)
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Row(
                    children: [
                      const Text(
                        "Proceed to Checkout",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Expanded(child: Container()),
                      Text(
                        "Rs. ${_getTotalCart(cartItems)}",
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Icon(Icons.arrow_forward_ios, size: 15),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Expanded _getItemListWidget(List<CartModel> cartItems) {
    return Expanded(
      child: ListView.separated(
          itemBuilder: (context, index) =>
              CartItem(cartModel: cartItems[index]),
          separatorBuilder: (context, index) => const AppDivider(),
          itemCount: cartItems.length),
    );
  }

  Container _getMyCart(List<CartModel> cartItems) {
    return Container(
      width: (MediaQuery.of(context).size.width),
      height: 65,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Text(
              "My Cart",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 5),
          Text(
            _getNumberOfItemCart(cartItems),
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontSize: 16,
            ),
          )
        ],
      ),
    );
  }

  Padding _getLowestPriceView() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Container(
        height: 90,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Image.asset(
                "assets/images/lowest_price.png",
              ),
            ),
            const SizedBox(width: 20),
            const Flexible(
              child: Text(
                "You won't find it cheaper anywhere",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getNumberOfItemCart(List<CartModel> cartItems) {
    var numberOfItemsCart = "(1 item)";
    if (cartItems.length > 1) {
      numberOfItemsCart = "(${cartItems.length} items)";
    }
    //AppUtilClass.saveCartCount(cartList.length);
    return numberOfItemsCart;
  }

  String _getTotalCart(List<CartModel> cartItems) {
    var sum = 0;
    for (var e in cartItems) {
      sum += ((e.qty ?? 1) * (e.price ?? 0));
    }
    return sum.toString();
  }

  SizedBox _getSpace() {
    return const SizedBox(height: 20);
  }
}
