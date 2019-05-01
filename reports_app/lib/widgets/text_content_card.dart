import 'package:flutter/material.dart';

import '../views/topics.dart';

class TextContentCard extends StatelessWidget {
  final String text;
  final String image;

  TextContentCard({this.text, this.image});

  factory TextContentCard.fromJson(Map<String, dynamic> parsedJson) {
    if (parsedJson.containsKey('text') && parsedJson.containsKey('image')) {
      return TextContentCard(
          text: parsedJson['text'], image: parsedJson['image']);
    } else if (parsedJson.containsKey('text')) {
      return TextContentCard(text: parsedJson['text']);
    } else if (parsedJson.containsKey('image')) {
      return TextContentCard(text: parsedJson['image']);
    } else {
      // This should throw an exception in runtime
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      margin: EdgeInsets.all(10.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text),
            RaisedButton(
                child: Text('Details for topic'),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return TopicsView();
                      },
                    ),
                  ).then((_) {});
                })
          ],
        ),
      ),
    );
  }
}
