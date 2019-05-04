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

    double deviceHeight = MediaQuery.of(context).size.height;

    if (image != null && text == null && circularImage == null) {
      return Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Image.asset(
          image,
          fit: BoxFit.fill,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(deviceHeight* 0.02),
        ),
        elevation: 5,
        margin: EdgeInsets.all(deviceHeight* 0.01),
      );
    } else {
      return Card(
        elevation: 2.0,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(deviceHeight* 0.02))),
        margin: EdgeInsets.all(deviceHeight* 0.01),
        child: Padding(
          padding: EdgeInsets.all(deviceHeight* 0.025),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              text == null ? Text('') : Text(text),
              text != null && circularImage != null ? SizedBox(height: deviceHeight*0.01,) : Container(),
              text != null && image != null ? SizedBox(height: deviceHeight*0.01,) : Container(),
              image == null
                  ? Container()
                  : Container(
                      padding: EdgeInsets.all(text == null ? 0 : deviceHeight* 0.02),
                      child: Image.asset(image),
                    ),
              circularImage == null
                  ? Container()
                  : Container(
                      padding: EdgeInsets.all(text == null ? 0 : deviceHeight* 0.02),
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        backgroundImage: Image.asset(circularImage).image,
                        radius: deviceHeight* 0.12,
                      ),
                    ),
            ],
          ),
        ),
      );
    }
  }
}
