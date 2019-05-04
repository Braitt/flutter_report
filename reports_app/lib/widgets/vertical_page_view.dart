import 'package:flutter/material.dart';

import './text_content_card.dart';

class VerticalPageView extends StatefulWidget {
  final List<Map<String, String>> texts;
  final String title;

  VerticalPageView({@required this.texts, @required this.title});

  factory VerticalPageView.fromJson(Map<String, dynamic> parsedJson) {
    List<dynamic> content = parsedJson['content'];
    List<Map<String, String>> parsedContent = [];
    for (Map<String, dynamic> val in content){
      Map<String, String> parsedInnerVal = val.cast<String, String>();
      parsedContent.add(parsedInnerVal);
    }
    
    return VerticalPageView(texts: parsedContent, title: parsedJson["title"]);
  }


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
              child: Center(child: Text(widget.title)),
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
