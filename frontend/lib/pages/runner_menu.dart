import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:marathon/components/bottom_navigation_bar_with_timer.dart';
import 'package:marathon/components/auth_checker.dart';
import 'package:marathon/classes/SessionData.dart';

class RunnerMenuScreen extends StatelessWidget {
  const RunnerMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthCheckerWidget(
      isAllowed: SessionData.isUserRunner(),
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
              ? Container(
                  width: MediaQuery.of(context).size.width, child: Content1())
              : Container(
                  width: MediaQuery.of(context).size.width, child: Content2()),
        )),
        bottomNavigationBar: const BottomNavigationBarWithTimer(),
      );
}

class Content1 extends StatefulWidget {
  const Content1({super.key});

  @override
  State<Content1> createState() => _Content1();
}

class _Content1 extends State<Content1> {
  @override
  Widget build(context) =>
      Scaffold(body: LayoutBuilder(builder: (context, constraints) {
        return AnimatedContainer(
            duration: Duration(milliseconds: 500),
            color: Color.fromARGB(255, 255, 255, 255),
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 30.0, horizontal: 25.0),
                  constraints: BoxConstraints(
                    maxWidth: 600,
                    maxHeight: 900,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Меню бегуна',
                            style: TextStyle(
                                fontSize: 30,
                                color: Color.fromARGB(255, 87, 87, 87))),
                        SizedBox(
                          height: 10,
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
                              onPressed: () {
                                Navigator.pushNamed(context, '/event_reg');
                              },
                              child: const Text('Регистрация на марафон',
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.black))),
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
                              child: const Text('Мои результаты',
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.black))),
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
                              onPressed: () {
                                Navigator.pushNamed(context, '/runner_edit');
                              },
                              child: const Text('Редактирование профиля',
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.black))),
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
                              ),
                              onPressed: () {},
                              child: const Text('Мой спонсор',
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.black),
                                  textAlign: TextAlign.center)),
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
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Контакты'),
                                    content: Text(
                                        'Обращайтесь по номеру телефона: 89353859357'),
                                    actions: <Widget>[
                                      TextButton(
                                        child: Text('Закрыть'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: const Text('Контакты',
                                style: TextStyle(
                                    fontSize: 25, color: Colors.black)),
                          ),
                        )
                      ])),
            ));
      }));
}

class Content2 extends StatefulWidget {
  const Content2({super.key});

  @override
  State<Content2> createState() => _Content2();
}

class _Content2 extends State<Content2> {
  @override
  Widget build(context) =>
      Scaffold(body: LayoutBuilder(builder: (context, constraints) {
        return AnimatedContainer(
            duration: Duration(milliseconds: 500),
            color: Color.fromARGB(255, 255, 255, 255),
            padding:
                constraints.maxHeight < 500 ? EdgeInsets.zero : EdgeInsets.zero,
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 30.0, horizontal: 25.0),
                  constraints: BoxConstraints(
                    maxWidth: 800,
                    maxHeight: 600,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('Меню бегуна',
                            style: TextStyle(
                                fontSize: 30,
                                color: Color.fromARGB(255, 87, 87, 87))),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
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
                                              padding:
                                                  MaterialStateProperty.all(
                                                      EdgeInsets.all(5))),
                                          onPressed: () {
                                            Navigator.pushNamed(
                                                context, '/event_reg');
                                          },
                                          child: const Text(
                                              'Регистрация на марафон',
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  color: Colors.black))),
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
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                              ),
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      Color.fromARGB(
                                                          255, 233, 233, 233)),
                                              padding:
                                                  MaterialStateProperty.all(
                                                      EdgeInsets.all(5))),
                                          onPressed: () {
                                            Navigator.pushNamed(
                                                context, '/my_results');
                                          },
                                          child: const Text('Мои результаты',
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  color: Colors.black))),
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
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                              ),
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      Color.fromARGB(
                                                          255, 233, 233, 233)),
                                              padding:
                                                  MaterialStateProperty.all(
                                                      EdgeInsets.all(5))),
                                          onPressed: () {
                                            Navigator.pushNamed(
                                                context, '/runner_edit');
                                          },
                                          child: const Text(
                                              'Редактирование профиля',
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  color: Colors.black))),
                                    ),
                                  ]),
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
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
                                          ),
                                          onPressed: () {
                                            Navigator.pushNamed(
                                                context, '/my_sponsor');
                                          },
                                          child: const Text('Мой спонсор',
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  color: Colors.black),
                                              textAlign: TextAlign.center)),
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
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: Text('Контакты'),
                                                content: Text(
                                                    'По любым вопросам обращайтесь по номеру телефона: 8935385935'),
                                                actions: <Widget>[
                                                  TextButton(
                                                    child: Text('Закрыть'),
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                        child: const Text('Контакты',
                                            style: TextStyle(
                                                fontSize: 25,
                                                color: Colors.black)),
                                      ),
                                    ),
                                  ]),
                            ])
                      ])),
            ));
      }));
}
