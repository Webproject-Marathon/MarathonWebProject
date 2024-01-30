import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:marathon/components/bottom_navigation_bar_with_timer.dart';
import 'package:marathon/classes/SessionData.dart';
import 'package:marathon/components/auth_checker.dart';


class AdminMenuScreen extends StatelessWidget {
  const AdminMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthCheckerWidget(
      isAllowed: SessionData.isUserAdmin(),
      child: ChangeNotifierProvider(
        create: (context) => PageState(),
        child: const HomePage(),
      ),
    );
  }
}

class PageState extends ChangeNotifier {}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(context) => Scaffold(
        appBar: AppBar(
          leadingWidth: 120,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/check');
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all(
                    const Color.fromRGBO(204, 204, 204, 1)),
                padding: MaterialStateProperty.all(const EdgeInsets.all(5)),
              ),
              child: const Text('Назад',
                  style: TextStyle(color: Colors.black, fontSize: 18)),
            ),
          ),
          title: const Text(
            "MARATHON SKILLS 2023",
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 30,
              color: Colors.white,
            ),
          ),
          backgroundColor: const Color.fromRGBO(82, 82, 82, 1),
        ),
        body: SafeArea(
            child: Center(
                child: MediaQuery.of(context).size.width <= 800
                    ? ListView(children: [
                        Column(children: [
                          Container(
                              width: MediaQuery.of(context).size.width,
                              height: 130,
                              child: PageText()),
                          Container(
                              width: MediaQuery.of(context).size.width,
                              height: 800,
                              child: Context2())
                        ])
                      ])
                    : ListView(children: [
                        Column(children: [
                          Container(
                              width: MediaQuery.of(context).size.width,
                              height: 150,
                              child: PageText()),
                          Container(
                              width: MediaQuery.of(context).size.width,
                              height: 460,
                              child: Context1())
                        ])
                      ]))),
        bottomNavigationBar: const BottomNavigationBarWithTimer(),
      );
}

class Context1 extends StatefulWidget {
  const Context1({super.key});

  @override
  State<Context1> createState() => _Context1();
}

class _Context1 extends State<Context1> {
  @override
  Widget build(context) =>
      Scaffold(body: LayoutBuilder(builder: (context, constraints) {
        return AnimatedContainer(
            duration: Duration(milliseconds: 500),
            color: Color.fromARGB(255, 252, 252, 252),
            child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                    constraints: BoxConstraints(
                      maxWidth: 800,
                      maxHeight: 400,
                    ),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 252, 252, 252),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 350,
                              height: 80,
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Color.fromARGB(
                                                  255, 233, 233, 233)),
                                      padding: MaterialStateProperty.all(
                                          EdgeInsets.all(5))),
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, '/user_management');
                                  },
                                  child: const Text('Пользователи',
                                      style: TextStyle(
                                          fontSize: 25, color: Colors.black))),
                            ),
                            SizedBox(
                              width: 25,
                            ),
                            SizedBox(
                              width: 350,
                              height: 80,
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Color.fromARGB(
                                                  255, 233, 233, 233)),
                                      padding: MaterialStateProperty.all(
                                          EdgeInsets.all(5))),
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, '/manage_volonteer');
                                  },
                                  child: const Text('Волонтеры',
                                      style: TextStyle(
                                          fontSize: 25, color: Colors.black))),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 350,
                              height: 80,
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Color.fromARGB(
                                                  255, 233, 233, 233)),
                                      padding: MaterialStateProperty.all(
                                          EdgeInsets.all(5))),
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, '/control_charity');
                                  },
                                  child: const Text(
                                    'Благотворительные организации',
                                    style: TextStyle(
                                        fontSize: 25, color: Colors.black),
                                    textAlign: TextAlign.center,
                                  )),
                            ),
                            SizedBox(
                              width: 25,
                            ),
                            SizedBox(
                              width: 350,
                              height: 80,
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Color.fromARGB(
                                                  255, 233, 233, 233)),
                                      padding: MaterialStateProperty.all(
                                          EdgeInsets.all(5))),
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/inventory');
                                  },
                                  child: const Text('Интвентарь',
                                      style: TextStyle(
                                          fontSize: 25, color: Colors.black))),
                            ),
                          ],
                        ),
                      ],
                    ))));
      }));
}

class Context2 extends StatefulWidget {
  const Context2({super.key});

  @override
  State<Context2> createState() => _Context2();
}

class _Context2 extends State<Context2> {
  @override
  Widget build(context) =>
      Scaffold(body: LayoutBuilder(builder: (context, constraints) {
        return AnimatedContainer(
            duration: Duration(milliseconds: 500),
            color: Color.fromARGB(255, 252, 252, 252),
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                  constraints: BoxConstraints(
                    maxWidth: 400,
                    maxHeight: 400,
                  ),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 252, 252, 252),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        width: 350,
                        height: 80,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                backgroundColor: MaterialStateProperty.all(
                                    Color.fromARGB(255, 233, 233, 233)),
                                padding: MaterialStateProperty.all(
                                    EdgeInsets.all(5))),
                            onPressed: () {
                              Navigator.pushNamed(context, '/user_management');
                            },
                            child: const Text('Пользователи',
                                style: TextStyle(
                                    fontSize: 25, color: Colors.black))),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      SizedBox(
                        width: 350,
                        height: 80,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                backgroundColor: MaterialStateProperty.all(
                                    Color.fromARGB(255, 233, 233, 233)),
                                padding: MaterialStateProperty.all(
                                    EdgeInsets.all(5))),
                            onPressed: () {},
                            child: const Text('Волонтеры',
                                style: TextStyle(
                                    fontSize: 25, color: Colors.black))),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      SizedBox(
                        width: 350,
                        height: 80,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                backgroundColor: MaterialStateProperty.all(
                                    Color.fromARGB(255, 233, 233, 233)),
                                padding: MaterialStateProperty.all(
                                    EdgeInsets.all(5))),
                            onPressed: () {},
                            child: const Text(
                              'Благотворительные организации',
                              style:
                                  TextStyle(fontSize: 25, color: Colors.black),
                              textAlign: TextAlign.center,
                            )),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      SizedBox(
                        width: 350,
                        height: 80,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                backgroundColor: MaterialStateProperty.all(
                                    Color.fromARGB(255, 233, 233, 233)),
                                padding: MaterialStateProperty.all(
                                    EdgeInsets.all(5))),
                            onPressed: () {},
                            child: const Text('Инвентарь',
                                style: TextStyle(
                                    fontSize: 25, color: Colors.black))),
                      ),
                    ],
                  )),
            ));
      }));
}

class PageText extends StatefulWidget {
  const PageText({super.key});

  @override
  State<PageText> createState() => _PageText();
}

class _PageText extends State<PageText> {
  @override
  Widget build(context) =>
      Scaffold(body: LayoutBuilder(builder: (context, constraints) {
        return AnimatedContainer(
            duration: Duration(milliseconds: 500),
            color: Color.fromARGB(255, 252, 252, 252),
            child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                    padding: constraints.maxHeight < 500
                        ? EdgeInsets.all(30)
                        : EdgeInsets.zero,
                    constraints: BoxConstraints(
                      maxWidth: 800,
                      maxHeight: 150,
                    ),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 252, 252, 252),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Меню администратора',
                          style: TextStyle(
                              fontSize: 30,
                              color: Color.fromARGB(255, 92, 92, 92)),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ))));
      }));
}
