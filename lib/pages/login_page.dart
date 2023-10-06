// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscure = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SHRINE'),
        leading: IconButton(
            icon: const Icon(Icons.menu, semanticLabel: 'menu'),
            onPressed: () {
              //  print('Menu button');
            }),
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
                print('filter button');
              },
              icon: const Icon(
                Icons.filter,
                semanticLabel: 'filter',
              ))
        ],
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: ListView(children: [
          SizedBox(
            height: 80,
          ),
          Column(
            children: [
              Image.asset('assets/diamond.png'),
              SizedBox(
                height: 80,
              ),
              Text('Shrine'),
              SizedBox(
                height: 80,
              ),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  labelText: 'Username',
                ),
              ),
              SizedBox(
                height: 12,
              ),
              TextField(
                  obscureText: _isObscure,
                  decoration: InputDecoration(
                    filled: true,
                    labelText: 'Password',
                    suffixIcon: IconButton(
                      icon: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                    ),
                  )),
              OverflowBar(
                alignment: MainAxisAlignment.end,
                children: [
                  TextButton(onPressed: () {}, child: Text('CANCEL')),
                  ElevatedButton(onPressed: () {}, child: Text('NEXT'))
                ],
              )
            ],
          )
        ]),
      )),
    );
  }
}
