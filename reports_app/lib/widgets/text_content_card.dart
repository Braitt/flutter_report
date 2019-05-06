import 'package:flutter/material.dart';

import '../views/topics.dart';

class ContentCard extends StatelessWidget {
  final String text;
  final String image;
  final String circularImage;
  final String subtitle;
  final String refs;

  ContentCard(
      {this.text, this.image, this.circularImage, this.subtitle, this.refs});

  factory ContentCard.fromJson(Map<String, dynamic> parsedJson) {
    return ContentCard(
      text: parsedJson['text'],
      image: parsedJson['image'],
      circularImage: parsedJson['circularImage'],
      subtitle: parsedJson['subtitle'],
      refs: parsedJson['refs'],
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
          borderRadius: BorderRadius.circular(deviceHeight * 0.02),
        ),
        elevation: 5,
        margin: EdgeInsets.all(deviceHeight * 0.01),
      );
    } else {
      return Card(
        elevation: 2.0,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(deviceHeight * 0.02))),
        margin: EdgeInsets.all(deviceHeight * 0.01),
        child: Padding(
          padding: EdgeInsets.all(deviceHeight * 0.025),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              subtitle != null
                  ? Text(
                      subtitle,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: deviceHeight * 0.02),
                    )
                  : Container(),
              subtitle != null && text != null
                  ? SizedBox(
                      height: deviceHeight * 0.01,
                    )
                  : Container(),
              text == null ? Container() : Text(text),
              text != null && circularImage != null
                  ? SizedBox(
                      height: deviceHeight * 0.01,
                    )
                  : Container(),
              text != null && image != null
                  ? SizedBox(
                      height: deviceHeight * 0.01,
                    )
                  : Container(),
              image == null
                  ? Container()
                  : Container(
                      padding: EdgeInsets.all(
                          text == null ? 0 : deviceHeight * 0.02),
                      child: Image.asset(image),
                    ),
              circularImage == null
                  ? Container()
                  : Container(
                      padding: EdgeInsets.all(
                          text == null ? 0 : deviceHeight * 0.02),
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        backgroundImage: Image.asset(circularImage).image,
                        radius: deviceHeight * 0.12,
                      ),
                    ),
              refs != null
                  ? Align(
                      child: IconButton(
                        icon: Icon(Icons.more_horiz),
                        onPressed: () {
                          showModalBottomSheet<void>(
                              context: context,
                              builder: (BuildContext context) {
                                return new Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    new ListTile(
                                      leading: new Icon(Icons.music_note),
                                      title: new Text('Music'),
                                      onTap: () {},
                                    ),
                                    new ListTile(
                                      leading: new Icon(Icons.photo_album),
                                      title: new Text('Photos'),
                                      onTap: () {},
                                    ),
                                    new ListTile(
                                      leading: new Icon(Icons.videocam),
                                      title: new Text('Video'),
                                      onTap: () {},
                                    ),
                                  ],
                                );
                              });
                        },
                      ),
                      alignment: FractionalOffset(0.5, 1),
                    )
                  : Container(),
            ],
          ),
        ),
      );
    }
  }
}
