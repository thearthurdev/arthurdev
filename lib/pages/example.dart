import 'package:arthurdev/widgets/custom_scrollbar.dart';
import 'package:flutter/material.dart';

class Example extends StatefulWidget {
  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView.builder(
            controller: _scrollController,
            itemCount: 100,
            itemBuilder: (BuildContext context, int i) {
              return ListTile(
                title: Text('List Item $i'),
              );
            },
          ),
          CustomScrollbar(scrollController: _scrollController),
        ],
      ),
    );
  }
}
