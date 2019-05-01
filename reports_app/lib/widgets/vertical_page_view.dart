import 'package:flutter/material.dart';

import './text_content_card.dart';

class VerticalPageView extends StatefulWidget {
  final List<Map<String, String>> texts;

  VerticalPageView({@required this.texts});

  @override
  State<StatefulWidget> createState() {
    return _VerticalPageViewState();
  }
}

class _VerticalPageViewState extends State<VerticalPageView> {
  double _verticalViewPortFraction = 0.8;

  PageController _verticalPageController;

  int _currentVerticalPage = 0;

  @override
  void initState() {
    super.initState();
    _verticalPageController = PageController(
        initialPage: _currentVerticalPage,
        viewportFraction: _verticalViewPortFraction);
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
        scrollDirection: Axis.vertical,
        controller: _verticalPageController,
        onPageChanged: (pageIndex) {
          _currentVerticalPage = pageIndex;
        },
        children: widget.texts.map((Map<String, dynamic> cardContent) {
          if (cardContent.containsKey('text')) {
            return TextContentCard.fromJson(cardContent);
          }
        }).toList());
  }
}
