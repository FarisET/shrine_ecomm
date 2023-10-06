// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class GridCollections extends StatefulWidget {
  const GridCollections({super.key});

  @override
  State<GridCollections> createState() => _GridCollectionsState();
}

class _GridCollectionsState extends State<GridCollections> {
  List<Card> _buildGridCards(int count) {
    List<Card> cards = List.generate(count, (int index) {
      return Card(
        clipBehavior: Clip.antiAlias,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          AspectRatio(
            aspectRatio: 11.0 / 7.0,
            child: Image.asset('assets/diamond.png'),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('title'),
                const SizedBox(height: 8.0),
                Text('Secondary Text')
              ],
            ),
          )
        ]),
      );
    });
    return cards;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SHRINE'),
        leading: IconButton(
            icon: const Icon(Icons.menu, semanticLabel: 'menu'),
            onPressed: () {}),
        actions: [
          IconButton(
              onPressed: () {
                // print('search button');
              },
              icon: const Icon(
                Icons.search,
                semanticLabel: 'search',
              )),
          IconButton(
              onPressed: () {
                //   print('filter button');
              },
              icon: const Icon(
                Icons.filter,
                semanticLabel: 'filter',
              ))
        ],
      ),
      body: GridView.count(
          crossAxisCount: 2,
          padding: const EdgeInsets.all(16.0),
          childAspectRatio: 8.0 / 9.0,
          children: _buildGridCards(10)),
    );
  }
}
