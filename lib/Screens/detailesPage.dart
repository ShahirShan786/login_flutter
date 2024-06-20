import 'package:flutter/material.dart';

class DetailesPage extends StatelessWidget {
  String? Name;
  String? Time;

  DetailesPage({
    this.Name,
    Time
    
    });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        title: Text(Name!),
      ),
      body: Center(
        child: Text(Time!)
      ),
    );
  }
}
