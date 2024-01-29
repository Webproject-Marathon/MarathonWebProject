import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:marathon/components/bottom_navigation_bar_with_timer.dart';

class MainSystemScreen extends StatelessWidget {
  const MainSystemScreen({super.key});

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
          toolbarHeight: 140,
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Center(
            child: Column(
              children: const <Widget>[
                Text(
                  'MARATHON SKILLS 2023',
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 40,
                      color: Colors.white),
                ),
                Text(
                  'Находка, Россия',
                  style: TextStyle(
                      fontSize: 20, color: Color.fromARGB(255, 186, 186, 186)),
                ),
                Text(
                  'среда, 21 октября 2023',
                  style: TextStyle(
                      fontSize: 20, color: Color.fromARGB(255, 188, 188, 188)),
                )
              ],
            ),
          ),
        ),
        body: SafeArea(
            child: Center(
                child:
                    Stack(alignment: AlignmentDirectional.bottomEnd, children: [
          Container(width: MediaQuery.of(context).size.width, child: Content()),
          Container(height: 70, width: 110, child: LoginButton())
        ]))),
        bottomNavigationBar: const BottomNavigationBarWithTimer(),
      );
}

class Content extends StatefulWidget {
  const Content({super.key});

  @override
  State<Content> createState() => _Content();
}

class _Content extends State<Content> {
  @override
  Widget build(context) =>
      Scaffold(body: LayoutBuilder(builder: (context, constraints) {
        return AnimatedContainer(
            duration: Duration(milliseconds: 500),
            color: Color.fromARGB(255, 255, 255, 255),
            padding: constraints.maxHeight < 500
                ? EdgeInsets.zero
                : EdgeInsets.all(30.0),
            child: Center(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 25.0),
                constraints: BoxConstraints(
                  maxWidth: 600,
                  maxHeight: 380,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                              Navigator.pushNamed(context, '/check');
                            },
                            child: const Text('Я хочу стать бегуном',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black))),
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
                              Navigator.pushNamed(context, '/runner_sponsor');
                            },
                            child: const Text('Я хочу стать спонсором бегуна',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black))),
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
                              Navigator.pushNamed(context, '/info');
                            },
                            child: const Text('Я хочу узнать больше о событии',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black))),
                      ),
                    ]),
              ),
            ));
      }));
}

class LoginButton extends StatefulWidget {
  const LoginButton({super.key});

  @override
  State<LoginButton> createState() => _LoginButton();
}

class _LoginButton extends State<LoginButton> {
  @override
  Widget build(context) =>
      Scaffold(body: LayoutBuilder(builder: (context, constraints) {
        return AnimatedContainer(
            duration: Duration(milliseconds: 500),
            color: Color.fromARGB(255, 255, 255, 255),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
                padding: EdgeInsets.all(15),
                constraints: BoxConstraints(
                  maxWidth: 180,
                  maxHeight: 100,
                ),
                child: ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 215, 215, 215)),
                        padding: MaterialStateProperty.all(EdgeInsets.all(15)),
                        textStyle:
                            MaterialStateProperty.all(TextStyle(fontSize: 20))),
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: const Text('Login',
                        style: TextStyle(fontSize: 20, color: Colors.black))),
              ),
            ));
      }));
}
