import 'package:flutter/material.dart';
import 'package:homesta/core/widgets/custom_app_bar_widget.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(text: 'Help Center'),
      body: Column(),
    );
  }
}