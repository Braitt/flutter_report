import 'package:flutter/material.dart';
import '../views/topics.dart';
import '../views/reports.dart';

class TextContentCard extends StatelessWidget {
  final String text;

  TextContentCard({@required this.text});

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
