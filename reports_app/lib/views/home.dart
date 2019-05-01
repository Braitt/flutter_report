import 'package:flutter/material.dart';
import '../widgets/text_content_card.dart';
import '../widgets/vertical_page_view.dart';

class HomeView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  double _horizontalViewPortionFraction = 0.8;
  double _verticalViewPortFraction = 0.8;

  final List<List<Map<String, String>>> jason = [
    [
      {'text': 'Gatuno 1 botate'},
      {'text': 'Gatuno 2 botate'}
    ],
    [
      {'text': 'Gatuno 3 botate'},
      {'text': 'Gatuno 4 botate'}
    ],
    [
      {'text': 'Gatuno 5 botate'}
    ]
  ];

  PageController _horizontalPageController;

  int _currentHorizontalPage = 0;

  double page = 2.0;

  @override
  void initState() {
    super.initState();
    _horizontalPageController = PageController(
        initialPage: _currentHorizontalPage,
        viewportFraction: _horizontalViewPortionFraction);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text('Home'),
        elevation: 0.0,
      ),
      body: _buildPageView(context),
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
        children: jason.map((verticalContent) {
          return VerticalPageView(texts: verticalContent);
        }).toList(),
      ),
    );
  }
}
