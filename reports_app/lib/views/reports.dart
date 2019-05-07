import 'package:flutter/material.dart';

import '../widgets/vertical_page_view.dart';

class ReportsView extends StatefulWidget {
  final Map _data;

  ReportsView(this._data);

  @override
  State<StatefulWidget> createState() => _ReportsViewState();
}

class _ReportsViewState extends State<ReportsView> {
  double _horizontalViewPortionFraction = 0.8;
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
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        bottomNavigationBar: TabBar(
          tabs: [
            Tab(
              icon: Icon(Icons.school),
              text: "2T2000S",
            ),
            Tab(
              icon: Icon(Icons.star),
              text: "SpaceX-Go",
            )
          ],
        ),
        appBar: AppBar(
          title: Text('Reports'),
        ),
        body: TabBarView(
          children: [
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                    Colors.white,
                    Color(int.parse(widget._data['color']))
                  ])),
              child: _buildPageView(context, 1),
            ),
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                    Colors.white,
                    Color(int.parse(widget._data['color']))
                  ])),
              child: _buildPageView(context, 2),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPageView(BuildContext context, int numTab) {
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
        children: widget._data == null
            ? [Container()]
            : widget._data['content' + numTab.toString()]
                .map((verticalContent) {
                  return VerticalPageView.fromJson(verticalContent);
                })
                .toList()
                .cast<Widget>(),
      ),
    );
  }
}
