import 'package:flutter/material.dart';
class TrackOrderScreen extends StatelessWidget {
  const TrackOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Track Order")),
      body: const Center(child: Text("هنا صفحة تتبع الطلب")),
    );
  }
}
