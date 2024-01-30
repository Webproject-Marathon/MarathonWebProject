import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:marathon/components/bottom_navigation_bar_with_timer.dart';

class ConfirmSponsorScreen extends StatelessWidget {
  const ConfirmSponsorScreen({super.key});

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
          child: Container(
              width: MediaQuery.of(context).size.width, child: Content()),
        )),
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
                  maxHeight: 700,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Спасибо за вашу спонсорскую поддержку!',
                        style: TextStyle(
                            fontSize: 30,
                            color: Color.fromARGB(255, 87, 87, 87)),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                          'Спасибо за поддержку бегуна в Marathon Skills 2023!',
                          style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 87, 87, 87)),
                          textAlign: TextAlign.center),
                      Text(
                          'Ваше пожертвование пойдет в его благотворительную организцию',
                          style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 87, 87, 87)),
                          textAlign: TextAlign.center),
                      Text('Иван Прудов(204) из Russia',
                          style: TextStyle(
                              fontSize: 40,
                              color: Color.fromARGB(255, 87, 87, 87)),
                          textAlign: TextAlign.center),
                      SizedBox(
                        height: 10,
                      ),
                      Text('\$50',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 50,
                              color: Color.fromARGB(255, 87, 87, 87))),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 120,
                        height: 35,
                        child: ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all(
                                  Color.fromARGB(255, 222, 222, 222)),
                              padding:
                                  MaterialStateProperty.all(EdgeInsets.all(5)),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, '/runner_menu');
                            },
                            child: const Text('Назад',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black))),
                      ),
                    ]),
              ),
            ));
      }));
}
