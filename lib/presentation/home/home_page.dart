import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sabka_bazar/bloc/home/category_bloc.dart';
import 'package:sabka_bazar/bloc/home/category_event.dart';
import 'package:sabka_bazar/bloc/home/category_state.dart';
import 'package:sabka_bazar/bloc/offer/offer_bloc.dart';
import 'package:sabka_bazar/bloc/offer/offer_event.dart';
import 'package:sabka_bazar/bloc/offer/offer_state.dart';
import 'package:sabka_bazar/presentation/home/category/category_item.dart';
import 'package:sabka_bazar/presentation/home/offer/offers.dart';
import '../../remote/models/category_model.dart';
import '../../remote/models/offer_model.dart';
import '../common/app_divider.dart';
import '../common/app_solid_button.dart';
import '../common/cart_action.dart';
import '../common/loading.dart';
import '../login/copyright/copyright_widget.dart';
import '../products/product_list_page.dart';

class HomePage extends StatefulWidget {
  static const String routName = "/home";

  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  late PageController _controller;
  late OfferBloc _offerBloc;
  late CategoryBloc _categoryBloc;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
    _offerBloc = BlocProvider.of<OfferBloc>(context);
    _categoryBloc = BlocProvider.of<CategoryBloc>(context);

    _offerBloc.add(FetchOffers());
    _categoryBloc.add(FetchCategories());
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: Image.asset(
            'assets/images/logo_small.png',
          ),
        ),
        leadingWidth: 90,
        actions: const [CartAction()],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 180.0,
            child: BlocBuilder<OfferBloc, OfferState>(
              builder: (context, state) {
                if (state is OfferLoadingState) {
                  return const CircleProgressBar();
                } else if (state is OfferSuccessState) {
                  return buildOfferList(state.offers);
                } else {
                  return Container();
                }
              },
            ),
          ),
          const AppDivider(),
          Expanded(
            child: BlocBuilder<CategoryBloc, CategoryState>(
              builder: (context, state) {
                if (state is CategoryLoadingState) {
                  return const CircleProgressBar();
                } else if (state is CategorySuccessState) {
                  return _getCategoryListView(state.categories);
                } else {
                  return _emptyCategory();
                }
              },
            ),
          ),
          const CopyrightWidget(),
        ],
      ),
    );
  }

  Widget buildOfferList(List<OfferModel> snapshot) {
    return OffersWidget(offers: snapshot);
  }

  Widget buildCategoryList(AsyncSnapshot<List<CategoryModel>> snapshot) {
    return _getCategoryListView(snapshot.data!);
  }

  Widget _getCategoryListView(List<CategoryModel> snapshot) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return const AppDivider();
      },
      itemCount: snapshot.length,
      itemBuilder: (context, index) {
        return CategoryItem(
            direction: index % 2 == 0 ? TextDirection.ltr : TextDirection.rtl,
            categoryModel: snapshot[index]);
      },
    );
  }

  Widget _emptyCategory() {
    return Column(
      children: [
        Expanded(child: Container()),
        const Text(
          "No categories found",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          "Checkout latest out new arrivals",
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
              text: "Continue",
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProductListPage(
                    categoryId: "0",
                    categoryName: "New Arrivals",
                  ),
                ),
              ),
              borderRadius: 5,
            ),
          ),
        ),
      ],
    );
  }
}
