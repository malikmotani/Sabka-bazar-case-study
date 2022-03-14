import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sabka_bazar/bloc/product/product_bloc.dart';
import 'package:sabka_bazar/bloc/product/product_state.dart';
import 'package:sabka_bazar/presentation/products/product_item/product_item.dart';

import '../../remote/mock_response.dart';
import '../../remote/models/product_model.dart';
import '../common/app_divider.dart';
import '../common/cart_action.dart';
import '../common/loading.dart';
import '../login/copyright/copyright_widget.dart';
import 'category/category_title_widget.dart';

class ProductListPage extends StatefulWidget {
  static const String routName = "/product_list";
  final String categoryName;
  final String categoryId;

  const ProductListPage({
    Key? key,
    required this.categoryName,
    required this.categoryId,
  }) : super(key: key);

  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  late ProductBloc _productBloc;

  @override
  void initState() {
    super.initState();
    _productBloc = BlocProvider.of<ProductBloc>(context);
    _productBloc.requestProducts();
    _checkCartCount();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.categoryName),
        actions: const [CartAction()],
      ),
      body: Column(
        children: [
          _getProducts(),
          const CopyrightWidget(),
        ],
      ),
    );
  }

  Widget _getProducts() {
    return BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
      if (state is ProductSuccessState) {
        return Expanded(child: _getProductListView(state.products));
      } else if (state is ProductLoadingState) {
        return const Expanded(
          child: CircleProgressBar(),
        );
      } else {
        return const Expanded(
          child: Center(
            child: Text(
              "No products available for this category",
            ),
          ),
        );
      }
    });
  }

  ListView _getProductListView(List<ProductModel> data) {
    return ListView.separated(
        separatorBuilder: (context, index) {
          return const AppDivider();
        },
        itemCount: data.length,
        itemBuilder: (context, index) {
          return ProductItem(productModel: data[index]);
        });
  }

  void _checkCartCount() {}

  List<ProductModel> _getMockProducts() {
    List<ProductModel> products = List.empty(growable: true);
    for (var element in MockResponse.products) {
      products.add(ProductModel.fromJson(element));
    }
    return products;
  }
}
