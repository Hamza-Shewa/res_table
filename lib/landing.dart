import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Landing extends StatefulWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> with TickerProviderStateMixin {
  TabController? con;
  TextEditingController con1 = TextEditingController();
  TextEditingController con2 = TextEditingController();
  TextEditingController con3 = TextEditingController();
  TextEditingController con4 = TextEditingController();
  TextEditingController con5 = TextEditingController();

  @override
  void initState() {
    con = TabController(vsync: this, length: 4);
    con1.text = 'Hamza Abushhiwa';
    con2.text = '23';
    con3.text = 'iraqi';
    con4.text = 'O-';
    con5.text = DateTime.now().toString();

    super.initState();
  }

  Widget field(String label, TextEditingController con) {
    return Padding(
      padding: const EdgeInsets.all(
        8,
      ),
      child: TextField(
        enabled: false,
        controller: con,
        decoration: InputDecoration(
          label: Text(
            label,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          titleSpacing: 4,
          centerTitle: true,
          title: const Text('Driver\' PLTS'),
        ),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(
                25,
              ),
              topRight: Radius.circular(
                25,
              ),
            ),
          ),
          child: TabBar(
            controller: con,
            indicatorColor: Colors.red,
            overlayColor: MaterialStateProperty.all(Colors.white,),
            labelStyle: const TextStyle(
              fontSize: 0,
            ),
            labelColor: Colors.white,
            unselectedLabelStyle: const TextStyle(
              fontSize: 11,
            ),
            tabs: const [
              Tab(
                icon: Icon(
                  Icons.home_outlined,
                ),
                text: 'Home',
              ),
              Tab(
                icon: Icon(
                  Icons.notifications,
                ),
                text: 'Notification',
              ),
              Tab(
                icon: Icon(
                  Icons.app_registration,
                ),
                text: 'Information',
              ),
              Tab(
                icon: Icon(
                  Icons.settings,
                ),
                text: 'Settings',
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: con,
          children: [            
            Center(
              child: QrImage(
                data: 'http://it.classhub.ly',
                size: MediaQuery.of(context).size.width * 0.9,
                gapless: true,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    const SizedBox(
                      height: 40,
                      child: Divider(
                        color: Colors.blue,
                        thickness: 2,
                        height: 2,
                      ),
                    ),
                    Positioned(
                      left: 30,
                      top: 0,
                      child: Container(
                        alignment: Alignment.center,
                        height: 35,
                        color: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 5,
                        ),
                        child: const Text(
                          'Updates',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.all(
                    8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.lightBlueAccent,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Notifications',
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(color: Colors.white),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 8,
                        ),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(
                              25,
                            ),
                            bottomRight: Radius.circular(
                              25,
                            ),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Header:',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(),
                            ),
                            Text(
                              'Notification content goes here',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(),
                            ),
                            Divider(
                              height: 10,
                              thickness: 2,
                              color: Colors.lightBlueAccent,
                            ),
                            Text(
                              'Header:',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(),
                            ),
                            Text(
                              'Notification content goes here',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(),
                            ),
                            Divider(
                              height: 10,
                              thickness: 2,
                              color: Colors.lightBlueAccent,
                            ),
                            Text(
                              'Header:',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(),
                            ),
                            Text(
                              'Notification content goes here',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(
                    8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Alerts',
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(color: Colors.white),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 8,
                        ),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(
                              25,
                            ),
                            bottomRight: Radius.circular(
                              25,
                            ),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Header:',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(),
                            ),
                            Text(
                              'alert content goes here',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(),
                            ),
                            Divider(
                              height: 10,
                              thickness: 2,
                              color: Colors.orangeAccent,
                            ),
                            Text(
                              'Header:',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(),
                            ),
                            Text(
                              'alert content goes here',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(),
                            ),
                            Divider(
                              height: 10,
                              thickness: 2,
                              color: Colors.orangeAccent,
                            ),
                            Text(
                              'Header:',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(),
                            ),
                            Text(
                              'alert content goes here',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    const SizedBox(
                      height: 40,
                      child: Divider(
                        color: Colors.blue,
                        thickness: 2,
                        height: 2,
                      ),
                    ),
                    Positioned(
                      left: 30,
                      top: 0,
                      child: Container(
                        alignment: Alignment.center,
                        height: 35,
                        color: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 5,
                        ),
                        child: const Text(
                          'Information',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 8.0,
                    ),
                    child: MaterialButton(
                      color: Colors.blue,
                      onPressed: () {},
                      child: const Text(
                        'Update Info',
                      ),
                    ),
                  ),
                ),
                field('name', con1),
                field('age', con2),
                field('nationality', con3),
                field('Blood Type', con4),
                field('License Expiracy', con5),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    const SizedBox(
                      height: 40,
                      child: Divider(
                        color: Colors.blue,
                        thickness: 2,
                        height: 2,
                      ),
                    ),
                    Positioned(
                      left: 30,
                      top: 0,
                      child: Container(
                        alignment: Alignment.center,
                        height: 35,
                        color: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 5,
                        ),
                        child: const Text(
                          'Settings',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Dark Theme',
                      ),
                      Switch(
                        value: false,
                        onChanged: (v) {},
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                MaterialButton(
                  color: Colors.blue,
                  colorBrightness: Brightness.dark,
                  onPressed: () {},
                  child: const Text(
                    'Sign Out',
                  ),
                )
              ],
            ),
          ],
        ));
  }
}
