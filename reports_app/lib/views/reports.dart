import 'package:flutter/material.dart';

class ReportsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          tabs: [
            Tab(icon: Icon(Icons.directions_car), text: "App 1",),
            Tab(icon: Icon(Icons.directions_transit), text: "App 2",),
            Tab(icon: Icon(Icons.directions_bike), text: "App 3",),
          ],
        ),
        title: Text('Tabs Demo'),
      ),
      body: TabBarView(
        children: [
          Icon(Icons.directions_car),
          Icon(Icons.directions_transit),
          Icon(Icons.directions_bike),
        ],
      ),
    );
  }
}
