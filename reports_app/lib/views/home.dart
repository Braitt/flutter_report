import 'package:flutter/material.dart';

import '../utils/json_parser.dart';
import '../widgets/vertical_page_view.dart';
import './topics.dart';

class HomeView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  double _horizontalViewPortionFraction = 0.8;

  List<Map<String, dynamic>> _parsedJson;
  Map _parsedTopicsJson;
  Map _parsedReportsJson;

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
        _parsedJson = parseContentJson(data);
      });
    });

    DefaultAssetBundle.of(context)
        .loadString('assets/content/topics.json')
        .then((data) {
      setState(() {
        _parsedTopicsJson = parseContentTopicsJson(data);
      });
    });

    DefaultAssetBundle.of(context)
        .loadString('assets/content/reports.json')
        .then((data) {
      setState(() {
        _parsedReportsJson = parseContentReportsJson(data);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text('Home'),
        elevation: 2.0,
      ),
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Theme.of(context).cardColor,
                Theme.of(context).backgroundColor
              ])),
          child: Stack(
            children: <Widget>[
              _buildPageView(context),
              Align(
                child: SizedBox(
                  width: 70,
                  height: 70,
                  child: FloatingActionButton(
                    child: Icon(Icons.line_weight),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return TopicsView(_parsedTopicsJson, _parsedReportsJson);
                          },
                        ),
                      );
                    },
                    backgroundColor: Theme.of(context).buttonColor,
                  ),
                ),
                alignment: FractionalOffset(0.9, 0.95),
              )
            ],
          )),
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
        children: _parsedJson == null
            ? [Text('')]
            : _parsedJson.map((verticalContent) {
                return VerticalPageView.fromJson(verticalContent);
              }).toList(),
      ),
    );
  }
}
