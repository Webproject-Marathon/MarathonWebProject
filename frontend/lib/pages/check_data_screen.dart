import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:marathon/components/bottom_navigation_bar_with_timer.dart';

class CheckDataScreen extends StatelessWidget {
  const CheckDataScreen({super.key});

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
          leadingWidth: 120,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home');
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
                  maxHeight: 280,
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
                              Navigator.pushNamed(context, '/login');
                            },
                            child: const Text('Я участвовал ранее',
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
                              Navigator.pushNamed(context, '/runner_reg');
                            },
                            child: const Text('Я новый участник',
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
                    onPressed: () {},
                    child: const Text('Login',
                        style: TextStyle(fontSize: 20, color: Colors.black))),
              ),
            ));
      }));
}
