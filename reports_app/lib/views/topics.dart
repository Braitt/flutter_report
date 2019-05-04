import 'package:flutter/material.dart';
import 'package:vertical_tabs/vertical_tabs.dart';
import 'dart:io';
import 'dart:convert';
import './reports.dart';

class TopicsView extends StatelessWidget {
  final Map _data;

  TopicsView(this._data);

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double sizeForIcons = deviceWidth * 0.07;
    Color colorForIcons = Colors.grey.shade700;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text('Topics', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                child: VerticalTabs(
                  selectedTabBackgroundColor: Colors.teal.shade100,
                  indicatorColor: Colors.blueGrey,
                  itemExtent: deviceWidth * 0.2,
                  contentScrollAxis: Axis.vertical,
                  tabsWidth: deviceWidth * 0.12,
                  tabs: <Tab>[
                    Tab(
                      child: Center(
                          child: Icon(
                        Icons.settings,
                        size: sizeForIcons,
                        color: colorForIcons,
                      )),
                    ),
                    Tab(
                      child: Center(
                          child: Icon(
                        Icons.storage,
                        size: sizeForIcons,
                        color: colorForIcons,
                      )),
                    ),
                    Tab(
                      child: Center(
                          child: Icon(
                        Icons.visibility,
                        size: sizeForIcons,
                        color: colorForIcons,
                      )),
                    ),
                    Tab(
                      child: Center(
                          child: Icon(
                        Icons.signal_cellular_4_bar,
                        size: sizeForIcons,
                        color: colorForIcons,
                      )),
                    ),
                    Tab(
                      child: Center(
                          child: Icon(
                        Icons.edit,
                        size: sizeForIcons,
                        color: colorForIcons,
                      )),
                    )
                  ],
                  contents: <Widget>[
                    tabsContent('performance', context),
                    tabsContent('storage', context),
                    tabsContent('rendering', context),
                    tabsContent('connectivity', context),
                    tabsContent('code', context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget tabsContent(String key, BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;

    Map data = _data[key];

    return Container(
      margin: EdgeInsets.all(deviceWidth * 0.03),
      padding: EdgeInsets.all(deviceWidth * 0.03),
      child: Column(
        children: <Widget>[
          Text(
            data['title'],
            style: TextStyle(fontSize: deviceWidth * 0.08),
          ),
          Divider(
            height: deviceWidth * 0.08,
            color: Colors.black45,
          ),
          Text(
            data['description'],
            style:
                TextStyle(fontSize: deviceWidth * 0.04, color: Colors.black87),
            textAlign: TextAlign.justify,
          ),
          SizedBox(
            height: deviceWidth * 0.05,
          ),
          Text(
            "Profiling strategy",
            style: TextStyle(
                fontSize: deviceWidth * 0.035,
                color: Colors.black87,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: deviceWidth * 0.01,
          ),
          Text(
            data['strategy'],
            style:
                TextStyle(fontSize: deviceWidth * 0.035, color: Colors.black87),
            textAlign: TextAlign.justify,
          ),
          SizedBox(
            height: deviceWidth * 0.05,
          ),
          Text(
            "Results",
            style: TextStyle(
                fontSize: deviceWidth * 0.035,
                color: Colors.black87,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: deviceWidth * 0.01,
          ),
          Text(
            data['comparison'],
            style:
                TextStyle(fontSize: deviceWidth * 0.035, color: Colors.black87),
            textAlign: TextAlign.justify,
          ),
          Expanded(child: Container()),
          Container(
              width: deviceWidth * 0.7,
              child: RaisedButton(
                  color: Colors.teal.shade200,
                  child: Text("DETAILS", style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return ReportsView(key);
                        },
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
