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

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollBehavior(),
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.transparent,
            expandedHeight: 100.0,
            title: Padding(
              padding: EdgeInsets.only(top: 30.0),
              child: Center(child: Text('Info')),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
                widget.texts.map((Map<String, dynamic> cardContent) {
              return ContentCard.fromJson(cardContent);
            }).toList()),
          ),
        ],
      ),
    );
  }
}
