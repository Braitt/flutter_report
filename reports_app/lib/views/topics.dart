import 'package:flutter/material.dart';
import 'package:vertical_tabs/vertical_tabs.dart';

class TopicsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                       child: Center(child: Icon(Icons.settings, size: sizeForIcons, color: colorForIcons,)),
                    ),
                    Tab(
                      child: Center(child: Icon(Icons.error_outline, size: sizeForIcons, color: colorForIcons,)),
                    ),
                    Tab(
                       child: Center(child: Icon(Icons.phone, size: sizeForIcons, color: colorForIcons,)),
                    ),
                    Tab(
                       child: Center(child: Icon(Icons.memory, size: sizeForIcons, color: colorForIcons,)),
                    ),
                    Tab(
                       child: Center(child: Icon(Icons.signal_cellular_4_bar, size: sizeForIcons, color: colorForIcons,)),
                    ),
                    Tab(
                       child: Center(child: Icon(Icons.multiline_chart, size: sizeForIcons, color: colorForIcons,)),
                    ),
                    Tab(
                       child: Center(child: Icon(Icons.edit, size: sizeForIcons, color: colorForIcons,)),
                    )
                  ],
                  contents: <Widget>[
                    tabsContent('Flutter',
                        'Change page by scrolling content is disabled in settings. Changing contents pages is only available via tapping on tabs'),
                    tabsContent('Dart'),
                    tabsContent('Javascript'),
                    tabsContent('NodeJS'),
                    Container(
                        color: Colors.black12,
                        child: ListView.builder(
                            itemCount: 10,
                            itemExtent: 100,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.all(10),
                                color: Colors.white30,
                              );
                            })),
                    tabsContent('HTML 5'),
                    Container(
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
                            })),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget tabsContent(String caption, [String description = '']) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(20),
      color: Colors.black12,
      child: Column(
        children: <Widget>[
          Text(
            caption,
            style: TextStyle(fontSize: 25),
          ),
          Divider(
            height: 20,
            color: Colors.black45,
          ),
          Text(
            description,
            style: TextStyle(fontSize: 15, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}
