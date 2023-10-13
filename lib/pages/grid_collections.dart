// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GridCollections extends StatefulWidget {
  const GridCollections({super.key});

  @override
  State<GridCollections> createState() => _GridCollectionsState();
}

class _GridCollectionsState extends State<GridCollections> {


  Iterable<Card> _buildGridCards(List<Users> data) {
    Iterable<Card> cards = data.map((Users) {
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
                Text(Users.title),
                const SizedBox(height: 8.0),
                Text('UserId:${Users.userId} | Id: ${Users.id}')
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
      // body: GridView.count(
      //     crossAxisCount: 2,
      //     padding: const EdgeInsets.all(16.0),
      //     childAspectRatio: 8.0 / 9.0,
      //     children: _buildGridCards(10)),
    );
  }
}

Future<List<Users>> fetchUsers() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
  if (response.statusCode == 200) {
    List<dynamic> _parsedListJson = jsonDecode(response.body);
    List<Users> _itemsList = List<Users>.from(
        _parsedListJson.map<Users>((dynamic i) => Users.fromJson(i))).toList();
    return _itemsList;
  } else {
    throw Exception('Failed to load album');
  }
}


//Json Model Class
class Users {
  final int userId;
  final int id;
  final String title;

  const Users({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}