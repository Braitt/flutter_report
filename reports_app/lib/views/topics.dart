import 'package:flutter/material.dart';
import 'package:vertical_tabs/vertical_tabs.dart';
import 'dart:io';
import 'dart:convert';
import './reports.dart';

class TopicsView extends StatelessWidget {
  final contentRoute = "assets/content/topics.json";
  final Map data;

  TopicsView([this.data]);

  @override
  Widget build(BuildContext context) {
    new File(contentRoute)
        .readAsString()
        .then((fileContents) => jsonDecode(fileContents))
        .then((jsonData) {
      print(jsonData);
    });

    double deviceWidth = MediaQuery.of(context).size.width;
    double sizeForIcons = deviceWidth * 0.07;
    Color colorForIcons = Colors.grey.shade700;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Theme.of(context).primaryColor,
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
                        Icons.edit,
                        size: sizeForIcons,
                        color: colorForIcons,
                      )),
                    ),
                    Tab(
                      child: Center(
                          child: Icon(
                        Icons.battery_charging_full,
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
                        Icons.storage,
                        size: sizeForIcons,
                        color: colorForIcons,
                      )),
                    )
                  ],
                  contents: <Widget>[
                    tabsContent('Flutter', context),
                    tabsContent('Dart', context),
                    tabsContent('Javascript', context),
                    tabsContent('NodeJS', context),
                    /* Container(
                        color: Colors.black12,
                        child: ListView.builder(
                            itemCount: 10,
                            itemExtent: 100,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.all(10),
                                color: Colors.white30,
                              );
                            })), */
                    tabsContent('HTML 5', context),
                    /*  Container(
                        color: Colors.black12,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 10,
                            itemExtent: 100,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.all(10),
                                color: Colors.white30,
                              );
                            })), */
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
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          Text(
            "Performance",
            style: TextStyle(fontSize: 25),
          ),
          Divider(
            height: 20,
            color: Colors.black45,
          ),
          Text(
            "xd",
            style: TextStyle(fontSize: 15, color: Colors.black87),
          ),
          Expanded(child: Container()),
          Container(
              width: 400,
              child: RaisedButton(color: Colors.teal.shade200, child: Text("DETAILS", style: TextStyle(color: Colors.white)), onPressed: () {
                Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return ReportsView();
                          },
                        ),
                      );
              }))
        ],
      ),
    );
  }
}
