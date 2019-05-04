import 'package:flutter/material.dart';

class ReportsView extends StatelessWidget {

  final String topicKey;

  ReportsView(this.topicKey);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        bottomNavigationBar: TabBar(
          tabs: [
            Tab(
              icon: Icon(Icons.directions_car),
              text: "App 1",
            ),
            Tab(
              icon: Icon(Icons.directions_transit),
              text: "App 2",
            ),
            Tab(
              icon: Icon(Icons.directions_bike),
              text: "App 3",
            ),
          ],
        ),
        appBar: AppBar(
          title: Text('Reports'),
        ),
        body: TabBarView(
          children: [
            Icon(Icons.directions_car),
            Icon(Icons.directions_transit),
            Icon(Icons.directions_bike),
          ],
        ),
      ),
    );
  }
}
