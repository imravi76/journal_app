import 'package:flutter/material.dart';

class DummyTab extends StatefulWidget {
  const DummyTab({super.key});

  @override
  State<DummyTab> createState() => _DummyTabState();
}

class _DummyTabState extends State<DummyTab> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text("Dummy Tab"),),);
  }
}
