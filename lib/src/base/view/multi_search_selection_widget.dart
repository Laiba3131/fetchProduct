import 'package:flutter/material.dart';

class SearchDcreen extends StatefulWidget {
  const SearchDcreen({super.key});

  @override
  State<SearchDcreen> createState() => _SearchDcreenState();
}

class _SearchDcreenState extends State<SearchDcreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Multiple Search Selection"),
      ),
    );
  }
}
