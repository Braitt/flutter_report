import 'package:flutter/material.dart';
import 'package:vertical_tabs/vertical_tabs.dart';
import './reports.dart';

class TopicsView extends StatelessWidget {
  final Map _data;
  final Map _reportsData;

  TopicsView(this._data, this._reportsData);

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
                  selectedTabBackgroundColor: Colors.grey.shade200,
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
                        Icons.sd_storage,
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
                        Icons.wifi,
                        size: sizeForIcons,
                        color: colorForIcons,
                      )),
                    ),
                    Tab(
                      child: Center(
                          child: Icon(
                        Icons.code,
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
    Map reportData = _reportsData[key];

    return Container(
      margin: EdgeInsets.all(deviceWidth * 0.03),
      padding: EdgeInsets.all(deviceWidth * 0.03),
      child: Column(
        children: <Widget>[
          Center(
            child: Text(
              data['title'],
              style: TextStyle(fontSize: deviceWidth * 0.07),
              textAlign: TextAlign.center,
            ),
          ),
          Divider(
            height: deviceWidth * 0.08,
            color: Colors.black45,
          ),
          data['description'] != null
              ? Text(
                  data['description'],
                  style: TextStyle(
                      fontSize: deviceWidth * 0.03, color: Colors.black87),
                  textAlign: TextAlign.justify,
                )
              : Container(),
          SizedBox(
            height: deviceWidth * 0.04,
          ),
          data['strategy'] != null
              ? Text(
                  "Strategy",
                  style: TextStyle(
                      fontSize: deviceWidth * 0.03,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                )
              : Container(),
          SizedBox(
            height: deviceWidth * 0.02,
          ),
          data['strategy'] != null
              ? Text(
                  data['strategy'],
                  style: TextStyle(
                      fontSize: deviceWidth * 0.03, color: Colors.black87),
                  textAlign: TextAlign.justify,
                )
              : Container(),
          SizedBox(
            height: deviceWidth * 0.04,
          ),
          data['results'] != null
              ? Text(
                  "Results",
                  style: TextStyle(
                      fontSize: deviceWidth * 0.03,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                )
              : Container(),
          SizedBox(
            height: deviceWidth * 0.02,
          ),
          data['results'] != null
              ? Text(
                  data['results'],
                  style: TextStyle(
                      fontSize: deviceWidth * 0.03, color: Colors.black87),
                  textAlign: TextAlign.justify,
                )
              : Container(),
          data['image'] != null ? Image.asset(data['image']) : Container(),
          Expanded(child: Container()),
          Container(
              width: deviceWidth * 0.7,
              child: RaisedButton(
                  color: Color(int.parse(reportData['color'])),
                  child: Text("DETAILS", style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return ReportsView(reportData);
                        },
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
