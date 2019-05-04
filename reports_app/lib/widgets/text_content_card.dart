import 'package:flutter/material.dart';

import '../views/topics.dart';

class ContentCard extends StatelessWidget {
  final String text;
  final String image;

  ContentCard({this.text, this.image});

  factory ContentCard.fromJson(Map<String, dynamic> parsedJson) {
    if (parsedJson.containsKey('text') && parsedJson.containsKey('image')) {
      return ContentCard(
          text: parsedJson['text'], image: parsedJson['image']);
    } else if (parsedJson.containsKey('text')) {
      return ContentCard(text: parsedJson['text']);
    } else if (parsedJson.containsKey('image')) {
      return ContentCard(image: parsedJson['image']);
    } else {
      // This should throw an exception in runtime
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      margin: EdgeInsets.all(10.0),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            text == null ? Text('') : Text(text),
            image == null ? Container() : Container(padding: EdgeInsets.all(text == null ? 0 : 20.0), child: Image.asset(image)),
          ],
        ),
      ),
    );
  }
}
