import 'package:flutter/material.dart';

class SignInUp extends StatefulWidget {
  const SignInUp({Key? key}) : super(key: key);

  @override
  State<SignInUp> createState() => _SignInUpState();
}

class _SignInUpState extends State<SignInUp> with TickerProviderStateMixin {
  TabController? con;

  @override
  void initState() {
    con = TabController(vsync: this, length: 2);
    super.initState();
  }

  Padding inputfield({String? label, String? hint}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
      child: TextField(
        decoration: InputDecoration(labelText: label, hintText: hint),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          titleSpacing: 4,
          title: TabBar(
            controller: con,
            labelStyle: const TextStyle(
              fontSize: 0,
            ),
            unselectedLabelStyle: const TextStyle(
              fontSize: 14,
            ),
            tabs: const [
              Tab(
                icon: Icon(
                  Icons.login,
                ),
                text: 'Sign In',
              ),
              Tab(
                icon: Icon(Icons.app_registration),
                text: 'Sign Up',
              ),
            ],
          ),
        ),
        body: Container(
          color: Colors.white,
          child: TabBarView(
            controller: con,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'PLTS',
                    style: TextStyle(fontSize: 24, color: Colors.blue),
                  ),
                  Stack(
                    children: <Widget>[
                      Flexible(
                        child: Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.symmetric(
                            vertical: 100,
                            horizontal: 10,
                          ),
                          padding: const EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.blue,
                              width: 3,
                            ),
                            borderRadius: BorderRadius.circular(5),
                            shape: BoxShape.rectangle,
                          ),
                          child: Column(
                            children: [
                              inputfield(
                                label: 'Email',
                                hint: 'Enter your email',
                              ),
                              inputfield(
                                label: 'password',
                                hint: 'Enter your password',
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 24.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    MaterialButton(
                                      color: Colors.blue,
                                      onPressed: () {},
                                      child: const Text(
                                        'Sign in',
                                        style: TextStyle(),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: MaterialButton(
                                        onPressed: () {},
                                        child: const Text(
                                          'forgot password',
                                          style: TextStyle(),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                          left: 30,
                          top: 92,
                          child: Container(
                            color: Colors.white,
                            padding: const EdgeInsets.only(
                              bottom: 5,
                              left: 2,
                              right: 2,
                            ),
                            child: const Text(
                              'Sign In',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                          )),
                    ],
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'PLTS',
                    style: TextStyle(fontSize: 24, color: Colors.blue),
                  ),
                  Stack(
                    children: <Widget>[
                      Flexible(
                        child: Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.symmetric(
                            vertical: 100,
                            horizontal: 10,
                          ),
                          padding: const EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.blue,
                              width: 3,
                            ),
                            borderRadius: BorderRadius.circular(5),
                            shape: BoxShape.rectangle,
                          ),
                          child: Column(
                            children: [
                              inputfield(
                                label: 'Email',
                                hint: 'Enter your email',
                              ),
                              inputfield(
                                label: 'password',
                                hint: 'Enter your password',
                              ),
                              inputfield(
                                label: 'password Confirmation',
                                hint: 'Enter your password again',
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 24.0),
                                child: MaterialButton(
                                  color: Colors.blue,
                                  onPressed: () {},
                                  child: const Text(
                                    'Sign Up',
                                    style: TextStyle(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                          left: 30,
                          top: 92,
                          child: Container(
                            color: Colors.white,
                            padding: const EdgeInsets.only(
                              bottom: 5,
                              left: 2,
                              right: 2,
                            ),
                            child: const Text(
                              'Create new Account',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                          )),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
