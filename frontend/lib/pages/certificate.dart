import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:marathon/components/bottom_navigation_bar_with_timer.dart';

class CertificateScreen extends StatelessWidget {
  const CertificateScreen({super.key});

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
                child: ListView(children: [
          Column(children: [
            Container(
                width: MediaQuery.of(context).size.width,
                height: 45,
                child: Context1()),
            Container(
                width: MediaQuery.of(context).size.width,
                height: 575,
                child: Context2())
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
                    maxWidth: double.infinity,
                    maxHeight: 45,
                  ),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 252, 252, 252),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Container(
                      alignment: Alignment.topCenter,
                      width: double.infinity,
                      height: 45,
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 188, 188, 188)),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Padding(
                                padding: EdgeInsets.only(top: 5),
                                child: Text('Race event:',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Color.fromARGB(255, 59, 59, 59)),
                                    textAlign: TextAlign.center)),
                            Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, top: 6),
                                child: SizedBox(
                                    width: 150,
                                    height: 30,
                                    child: TextFormField(
                                        decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            fillColor: Colors.white,
                                            filled: true),
                                        validator: (value) {}))),
                          ])),
                )));
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
              alignment: Alignment.center,
              child: Container(
                  constraints: BoxConstraints(
                    maxWidth: 800,
                    maxHeight: 575,
                  ),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 252, 252, 252),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                          alignment: Alignment.center,
                          width: 350,
                          height: 100,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 185, 56),
                            border: Border.all(
                                color: const Color.fromARGB(255, 156, 107, 16)),
                          ),
                          child: const Text('Logo',
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Color.fromARGB(255, 156, 107, 16)))),
                      Text(
                          'Поздравляем Имя Фамилия с участием в 42км полном марафоне.',
                          style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 81, 81, 81)),
                          textAlign: TextAlign.center),
                      Text(
                          'Ваши результаты: время 4:13:42 и занятое место 183!',
                          style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 81, 81, 81)),
                          textAlign: TextAlign.center),
                      Text('Сертификат участника',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 50,
                              color: Color.fromARGB(255, 92, 92, 92)),
                          textAlign: TextAlign.center),
                      Text('в',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Color.fromARGB(255, 81, 81, 81)),
                          textAlign: TextAlign.center),
                      Text('Marathon Skills 2023',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 45,
                              color: Color.fromARGB(255, 92, 92, 92)),
                          textAlign: TextAlign.center),
                      Text('Osaka, Japan',
                          style: TextStyle(
                              fontSize: 40,
                              color: Color.fromARGB(255, 92, 92, 92)),
                          textAlign: TextAlign.center),
                      Text(
                          'Вы также заработали \$1,300 для вашей благотворительной организации!',
                          style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 81, 81, 81)),
                          textAlign: TextAlign.center),
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
                alignment: Alignment.center,
                child: Container(
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
                        SizedBox(height: 15),
                        Text(
                          'Насколько долгий марафон?',
                          style: TextStyle(
                              fontSize: 30,
                              color: Color.fromARGB(255, 92, 92, 92)),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ))));
      }));
}
