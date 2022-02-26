import 'package:demo/res_table/cell_button.dart';
import 'package:demo/res_table/expanded_cell.dart';
import 'package:demo/res_table/expanded_cell_child.dart';
import 'package:demo/res_table/res_table.dart';
import 'package:demo/theme/themes.dart';
import 'package:flutter/material.dart';

import 'res_table/cell.dart';
import 'res_table/nav_buttons.dart';
import 'theme/res_table.dart' as theme;

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
      theme: lightTheme,
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
      body: Container(
        color: theme.ResTable.light,
        child: Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  children: [
                    Flexible(
                      child: ListTile(
                        title: CircleAvatar(
                          backgroundColor: Theme.of(context).primaryColor,
                          child: Text(
                            'A',
                            style: Theme.of(context).textTheme.headline3,
                          ),
                          radius: 30,
                        ),
                        subtitle: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Test\n',
                                style: Theme.of(context).textTheme.headline5,
                              ),
                              TextSpan(
                                text: 'Manager',
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    NavButtons(
                      text: 'Home',
                      onPressed: () {},
                    ),
                    NavButtons(
                      text: 'Employee Management',
                      onPressed: () {},
                    ),
                    NavButtons(
                      text: 'Management page 3',
                      onPressed: () {},
                    ),
                    NavButtons(
                      text: 'Management page 4',
                      onPressed: () {},
                    ),
                    NavButtons(
                      text: 'Settings',
                      onPressed: () {},
                    ),
                    const Spacer(
                      flex: 3,
                    ),
                    NavButtons(
                      text: text,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 15,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.topRight,
                      child: NavButtons(
                        text: 'add new employee',
                        onPressed: () {},
                      ),
                    ),
                    ResTable(
                      padding: const EdgeInsets.all(5),
                      backgroundColor: Theme.of(context).primaryColorLight,
                      tableDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      header: [
                        Cell(
                          text: 'name',
                          textStyle: Theme.of(context).textTheme.headline4,
                        ),
                        Cell(
                          text: 'age',
                          textStyle: Theme.of(context).textTheme.headline4,
                        ),
                        Cell(
                          text: 'address',
                          textStyle: Theme.of(context).textTheme.headline4,
                        ),
                        Cell(
                          text: 'nationality',
                          textStyle: Theme.of(context).textTheme.headline4,
                        ),
                        Cell(
                          text: 'Edit',
                          textStyle: Theme.of(context).textTheme.headline4,
                        ),
                        Cell(
                          text: 'Delete',
                          textStyle: Theme.of(context).textTheme.headline4,
                        ),
                      ],
                      children: [
                        for (int i = 0; i < 25; i++)
                          ExpandedCell(
                            childPadding: const EdgeInsets.symmetric(vertical: 10),
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
                                  title: Text(
                                    'license number\n',
                                    style:
                                        Theme.of(context).textTheme.headline5,
                                  ),
                                  isThreeLine: true,
                                  subtitle: Text(
                                    'license $i',
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
                                ),
                              ),
                              ExpandedCellChild(
                                  child: ListTile(
                                title: Text(
                                  'phone number\n',
                                  style: Theme.of(context).textTheme.headline5,
                                ),
                                subtitle: Text(
                                  '00218$i',
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                              )),
                              ExpandedCellChild(
                                child: ListTile(
                                  title: Text(
                                    'place of birth\n',
                                    style:
                                        Theme.of(context).textTheme.headline5,
                                  ),
                                  subtitle: Text(
                                    'place of birth $i',
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
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
      ),
    );
  }
}
