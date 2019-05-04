import 'package:flutter/material.dart';

import '../views/topics.dart';

class ContentCard extends StatelessWidget {
  final String text;
  final String image;
  final String circularImage;

  ContentCard({this.text, this.image, this.circularImage});

  factory ContentCard.fromJson(Map<String, dynamic> parsedJson) {
    return ContentCard(
      text: parsedJson['text'],
      image: parsedJson['image'],
      circularImage: parsedJson['circularImage'],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (image != null && text == null && circularImage == null) {
      return Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Image.asset(
          image,
          fit: BoxFit.fill,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 5,
        margin: EdgeInsets.all(10),
      );
    } else {
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
              image == null
                  ? Container()
                  : Container(
                      padding: EdgeInsets.all(text == null ? 0 : 20.0),
                      child: Image.asset(image),
                    ),
              circularImage == null
                  ? Container()
                  : Container(
                      padding: EdgeInsets.all(text == null ? 0 : 20.0),
                      child: CircleAvatar(
                        backgroundImage: Image.asset(circularImage).image,
                        radius: 120.0,
                      ),
                    ),
            ],
          ),
        ),
      );
    }
  }
}
