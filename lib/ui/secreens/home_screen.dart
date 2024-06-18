import 'package:flutter/material.dart';
import 'package:myapp/ui/widgets/ai_widget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Aplikasi AI Sederhana')),
      body: AIWidget(),
    );
  }
}