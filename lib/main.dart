import 'dart:io';
import 'dart:ui';

import 'package:demo/res_table/cell_button.dart';
import 'package:demo/res_table/expanded_cell.dart';
import 'package:demo/res_table/expanded_cell_child.dart';
import 'package:demo/res_table/res_table.dart';
import 'package:flutter/material.dart';

import 'res_table/cell.dart';
import 'res_table/nav_buttons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Management',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'My App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String text = 'signOut';

  update() {
    setState(() {
      text = 'signed out';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        elevation: 0,
      ),
      body: Flex(
        direction: Axis.horizontal,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              color: Colors.blue,
              child: Column(
                children: [
                  Flexible(
                    child: ListTile(
                      title: CircleAvatar(
                        child: Text(
                          'A',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        radius: 30,
                      ),
                      subtitle: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Test\n',
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            TextSpan(
                              text: 'Manager',
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const NavButtons('Home'),
                  const NavButtons('Employee Management'),
                  const NavButtons('Management page 3'),
                  const NavButtons('Management page 4'),
                  const NavButtons('Settings'),
                  const Spacer(),
                  NavButtons(text),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.topRight,
                    child: const NavButtons('add new employee'),
                  ),
                  ResTable(
                    header: const [
                      Cell(text: 'name'),
                      Cell(text: 'age'),
                      Cell(text: 'address'),
                      Cell(text: 'nationality'),
                      Cell(text: 'Edit'),
                      Cell(text: 'Delete'),
                    ],
                    children: [
                      for (int i = 0; i < 25; i++)
                        ExpandedCell(
                          title: [
                            Cell(text: 'name $i'),
                            Cell(text: 'age $i'),
                            Cell(text: 'city $i'),
                            Cell(text: 'national $i'),
                            CellButton(
                              child: const Icon(
                                Icons.edit,
                                color: Colors.green,
                              ),
                              onPressed: update,
                            ),
                            CellButton(
                              child: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                setState(
                                  () {
                                    text = 'deleted';
                                  },
                                );
                              },
                            ),
                          ],
                          children: [
                            ExpandedCellChild(
                              child: ListTile(
                                title: const Text('license number\n'),
                                isThreeLine: true,
                                subtitle: Text('license $i'),
                              ),
                            ),
                            ExpandedCellChild(
                                child: ListTile(
                              title: const Text('phone number\n'),
                              subtitle: Text('00218$i'),
                            )),
                            ExpandedCellChild(
                              child: ListTile(
                                title: const Text('place of birth\n'),
                                subtitle: Text('place of birth $i'),
                              ),
                            ),
                          ],
                        )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
