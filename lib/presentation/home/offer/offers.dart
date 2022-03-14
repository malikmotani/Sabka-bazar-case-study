import 'package:flutter/material.dart';
import 'package:page_indicator/page_indicator.dart';

import '../../../remote/models/offer_model.dart';


class OffersWidget extends StatelessWidget {
  final List<OfferModel> offers;
  final PageController _controller = PageController();

  OffersWidget({Key? key, required this.offers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageIndicatorContainer(
      child: PageView(
        children: _getOfferImageWidget(context, offers),
        controller: _controller,
      ),
      align: IndicatorAlign.bottom,
      length: offers.length,
      indicatorSpace: 15.0,
      indicatorColor: Colors.black12,
      indicatorSelectorColor: Colors.black,
      shape: IndicatorShape.circle(size: 8),
    );
  }

  List<Image> _getOfferImageWidget(
      BuildContext context, List<OfferModel> snapshot) {
    return snapshot
        .map((model) => Image.asset(
              model.bannerImageUrl.toString(),
              width: (MediaQuery.of(context).size.width),
            ))
        .toList();
  }
}
