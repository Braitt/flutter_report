import 'package:flutter/material.dart';
import '../widgets/contentCard.dart';

class HomeView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  double _horizontalViewPortionFraction = 0.8;
  double _verticalViewPortFraction = 0.8;

  PageController _horizontalPageController;
  PageController _verticalPageController;

  int _currentHorizontalPage = 0;
  int _currentVerticalPage = 0;

  @override
  void initState() {
    super.initState();
    _horizontalPageController = PageController(
        initialPage: _currentHorizontalPage,
        viewportFraction: _horizontalViewPortionFraction);
    _verticalPageController = PageController(
        initialPage: _currentVerticalPage,
        viewportFraction: _verticalViewPortFraction);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        toolbarOpacity: 0.0,
        elevation: 0.0,
      ),
      body: _buildPageView(context),
    );
  }

  Widget _buildPageView(BuildContext context) {
    return PageView(
      controller: _horizontalPageController,
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      onPageChanged: (page) {
        _currentHorizontalPage = page;
      },
      reverse: true,
      children: <Widget>[
        PageView(
          scrollDirection: Axis.vertical,
          controller: _verticalPageController,
          children: <Widget>[
            ContentCard(),
            ContentCard(),
          ],
        ),
        PageView(
          scrollDirection: Axis.vertical,
          controller: _verticalPageController,
          children: <Widget>[
            ContentCard(),
          ],
        ),
        PageView(
          scrollDirection: Axis.vertical,
          controller: _verticalPageController,
          children: <Widget>[
            ContentCard(),
          ],
        ),
      ],
    );
  }
}
