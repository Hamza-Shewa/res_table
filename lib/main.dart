import 'package:demo/admin_landing.dart';
import 'package:demo/landing.dart';
import 'package:demo/res_table/res_table.dart';
import 'package:demo/sign-in-up.dart';
import 'package:flutter/material.dart';

import 'res_table/cell.dart';

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
      //home: const Landing(),
      // home: const AdminLanding(),
      home: const MyHomePage(title: 'My App'),
      //home: const SignInUp(),
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
                  ListTile(
                    leading: CircleAvatar(
                      child: Text(
                        'A',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      radius: 30,
                    ),
                    title: const Text('Ahmed'),
                    subtitle: const Text('job title'),
                  ),
                  const navButtons('Home'),
                  const navButtons('Employee Management'),
                  const navButtons('Management page 3'),
                  const navButtons('Management page 4'),
                  const navButtons('Settings'),
                  const Spacer(),
                  const navButtons('SignOut'),
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
                    child: const navButtons('add new employee'),
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
                        SizedBox(
                          width: (6 * 200) + (10 * 2 * 6),
                          child: ExpansionTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            title: Row(
                              children: [
                                Cell(text: 'name $i'),
                                Cell(text: 'age $i'),
                                Cell(text: 'city $i'),
                                Cell(text: 'national $i'),
                                //cell('gender $i'),
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: TextButton(
                                    style: ButtonStyle(
                                        fixedSize: MaterialStateProperty.all(
                                          const Size(200, 60),
                                        ),
                                        backgroundColor:
                                            MaterialStateProperty.resolveWith(
                                                (states) {
                                          if (states.contains(
                                              MaterialState.hovered)) {
                                            return Colors.lightBlue[200];
                                          }
                                          return Colors.white54;
                                        })),
                                    onPressed: () {
                                      print('edited');
                                    },
                                    child: const Icon(
                                      Icons.edit,
                                      color: Colors.green,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: TextButton(
                                    style: ButtonStyle(
                                        fixedSize: MaterialStateProperty.all(
                                          const Size(200, 60),
                                        ),
                                        backgroundColor:
                                            MaterialStateProperty.resolveWith(
                                                (states) {
                                          if (states.contains(
                                              MaterialState.hovered)) {
                                            return Colors.lightBlue[200];
                                          }
                                          return Colors.white54;
                                        })),
                                    onPressed: () {
                                      print('deleted');
                                    },
                                    child: const Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 2,
                                          color:
                                              Colors.black54.withOpacity(0.2),
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 4),
                                      height: 80,
                                      width: 200,
                                      child: ListTile(
                                        title: const Text('license number\n'),
                                        isThreeLine: true,
                                        subtitle: Text('license $i'),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 4),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 2,
                                          color:
                                              Colors.black54.withOpacity(0.2),
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      height: 80,
                                      width: 200,
                                      child: ListTile(
                                        title: const Text('phone number\n'),
                                        subtitle: Text('00218$i'),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 4),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 2,
                                          color:
                                              Colors.black54.withOpacity(0.2),
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      height: 80,
                                      width: 200,
                                      child: ListTile(
                                        title: const Text('place of birth\n'),
                                        subtitle: Text('place of birth $i'),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
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

class navButtons extends StatelessWidget {
  const navButtons(
    this.text, {
    Key? key,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: TextButton(
        style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(
              const Size(200, 60),
            ),
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.hovered)) {
                return Colors.lightBlue[200];
              }
              return Colors.white54;
            })),
        onPressed: () {
          print('1');
        },
        child: Text(
          text,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }
}
