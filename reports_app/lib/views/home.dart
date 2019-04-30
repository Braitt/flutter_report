import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        bottomOpacity: 0.0,
        toolbarOpacity: 0.0,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: _buildCards(),
    );
  }

  Widget _buildCards() {
    return Text('gatitow');
  }
}
