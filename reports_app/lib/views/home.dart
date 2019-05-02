import 'package:flutter/material.dart';

import '../utils/json_parser.dart';
import '../widgets/vertical_page_view.dart';

class HomeView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  double _horizontalViewPortionFraction = 0.8;

  List<List<Map<String, String>>> _parsedJson;

  PageController _horizontalPageController;

  int _currentHorizontalPage = 0;

  double page = 2.0;

  @override
  void initState() {
    super.initState();
    _horizontalPageController = PageController(
        initialPage: _currentHorizontalPage,
        viewportFraction: _horizontalViewPortionFraction);
    DefaultAssetBundle.of(context)
        .loadString('assets/content/home.json')
        .then((data) {
      setState(() {
        _parsedJson = parseJson(data);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text('Home'),
        elevation: 0.0,
      ),
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.teal, Theme.of(context).cardColor])),
          child: _buildPageView(context)),
    );
  }

  Widget _buildPageView(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification) {
        if (notification is ScrollUpdateNotification) {
          page = _horizontalPageController.page;
        }
      },
      child: PageView(
        controller: _horizontalPageController,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        onPageChanged: (page) {
          _currentHorizontalPage = page;
        },
        reverse: true,
        children: _parsedJson == null
            ? [Text('')]
            : _parsedJson.map((verticalContent) {
                return VerticalPageView(texts: verticalContent);
              }).toList(),
      ),
    );
  }
}
