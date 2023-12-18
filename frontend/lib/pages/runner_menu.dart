import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RunnerMenuScreen extends StatelessWidget {
  const RunnerMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PageState(),
      child: const HomePage(),
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
      backgroundColor: Color.fromARGB(255, 87, 87, 87),
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Align(
          alignment: Alignment.centerLeft,
          child:
              SizedBox(
              width: 80,
              height: 35,
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 215, 215, 215)),
                  padding: MaterialStateProperty.all(EdgeInsets.all(5)),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                }, child: const Text('Назад', style: TextStyle(fontSize: 20,color: Colors.black))),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left:12, right: 12),
              child: 
                Text('MARATHON SKILLS 2023', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 25,color: Colors.white),)
            ),
            SizedBox(
            width: 80,
            height: 35,
            child: ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 215, 215, 215)),
                padding: MaterialStateProperty.all(EdgeInsets.all(5)),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              }, child: const Text('Logout', style: TextStyle(fontSize: 20,color: Colors.black))),
            ),
        ],
      ),
    ),
    body: SafeArea(
        child:Center(
          child: MediaQuery.of(context).size.width <= 800 ?
            Container(
              width: MediaQuery.of(context).size.width,
              child: Content1()
            )
            :
            Container(
              width: MediaQuery.of(context).size.width,
              child: Content2()
            ),
        )
    ),
    bottomNavigationBar: Container(
      padding: EdgeInsets.all(12),
      height: 50.0,
      color: Color.fromARGB(255, 87, 87, 87),
      child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('18 дней, 8 часов и 17 минут до старта марафона!', style: TextStyle(fontSize: 18,color: Colors.white),)
            ],
    ),
    ),
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
    Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return AnimatedContainer(
            duration: Duration(milliseconds: 500),
            color: Color.fromARGB(255, 255, 255, 255),
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 30.0, horizontal: 25.0
                ),
                constraints: BoxConstraints(
                  maxWidth: 600,
                  maxHeight: 900,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child:
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Меню бегуна', style: TextStyle(fontSize: 30,color: Color.fromARGB(255, 87, 87, 87))),
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
                          backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 233, 233, 233)),
                          padding: MaterialStateProperty.all(EdgeInsets.all(5))
                        ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/event_reg');
                            }, child: const Text('Регистрация на марафон', style: TextStyle(fontSize: 25,color: Colors.black))),
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
                          backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 233, 233, 233)),
                          padding: MaterialStateProperty.all(EdgeInsets.all(5))
                        ),
                          onPressed: () {}, child: const Text('Мои результаты', style: TextStyle(fontSize: 25,color: Colors.black))),
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
                          backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 233, 233, 233)),
                          padding: MaterialStateProperty.all(EdgeInsets.all(5))
                        ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/runner_edit');
                            }, child: const Text('Редактирование профиля', style: TextStyle(fontSize: 25,color: Colors.black))),
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
                          backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 233, 233, 233)),
                        ),
                          onPressed: () {}, child: const Text('Мой спонсор', style: TextStyle(fontSize: 25, color: Colors.black), textAlign: TextAlign.center)),
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
                        backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 233, 233, 233)),
                        padding: MaterialStateProperty.all(EdgeInsets.all(5))
                      ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/check');
                          }, child: const Text('Контакты', style: TextStyle(fontSize: 25,color: Colors.black))),
                  ),
                  ]
                )
              ),
            )
          );
        }
      )
   );
}

class Content2 extends StatefulWidget {
  const Content2({super.key});

  @override
  State<Content2> createState() => _Content2();
}

class _Content2 extends State<Content2> {
  @override
  Widget build(context) =>
    Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return AnimatedContainer(
            duration: Duration(milliseconds: 500),
            color: Color.fromARGB(255, 255, 255, 255),
            padding: constraints.maxHeight < 500 ? EdgeInsets.zero : EdgeInsets.zero ,
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 30.0, horizontal: 25.0
                ),
                constraints: BoxConstraints(
                  maxWidth: 800,
                  maxHeight: 600,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child:
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Меню бегуна', style: TextStyle(fontSize: 30,color: Color.fromARGB(255, 87, 87, 87))),
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
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 233, 233, 233)),
                                  padding: MaterialStateProperty.all(EdgeInsets.all(5))
                                ),
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/event_reg');
                                    }, child: const Text('Регистрация на марафон', style: TextStyle(fontSize: 25,color: Colors.black))),
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
                                  backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 233, 233, 233)),
                                  padding: MaterialStateProperty.all(EdgeInsets.all(5))
                                ),
                                  onPressed: () {Navigator.pushNamed(context, '/my_results');}, child: const Text('Мои результаты', style: TextStyle(fontSize: 25,color: Colors.black))),
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
                                  backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 233, 233, 233)),
                                  padding: MaterialStateProperty.all(EdgeInsets.all(5))
                                ),
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/runner_edit');
                                    }, child: const Text('Редактирование профиля', style: TextStyle(fontSize: 25,color: Colors.black))),
                            ),
                          ]
                        ),
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
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 233, 233, 233)),
                                ),
                                  onPressed: () {Navigator.pushNamed(context, '/my_sponsor');}, child: const Text('Мой спонсор', style: TextStyle(fontSize: 25, color: Colors.black), textAlign: TextAlign.center)),
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
                                backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 233, 233, 233)),
                                padding: MaterialStateProperty.all(EdgeInsets.all(5))
                              ),
                                onPressed: () {
                                  Navigator.pushNamed(context, '/check');
                                  }, child: const Text('Контакты', style: TextStyle(fontSize: 25,color: Colors.black))),
                          ),
                          SizedBox(
                              height: 105,
                            ),
                          ]
                        ),
                      ] 
                    )
                  ]
                )
              ),
            )
          );
        }
      )
   );
}
