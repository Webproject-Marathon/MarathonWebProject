import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:marathon/components/bottom_navigation_bar_with_timer.dart';

class AddUser extends StatelessWidget {
  const AddUser({super.key});

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
                child: MediaQuery.of(context).size.width <= 800
                    ? ListView(children: [
                        Column(children: [
                          Container(
                              width: MediaQuery.of(context).size.width,
                              height: 130,
                              child: PageText()),
                          Container(
                              width: MediaQuery.of(context).size.width,
                              height: 250,
                              child: Context1()),
                          Container(
                              width: MediaQuery.of(context).size.width,
                              height: 220,
                              child: Context2()),
                          Container(
                              width: MediaQuery.of(context).size.width,
                              height: 100,
                              child: Buttons()),
                        ])
                      ])
                    : ListView(children: [
                        Column(children: [
                          Container(
                              width: MediaQuery.of(context).size.width,
                              height: 150,
                              child: PageText()),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  height: 280,
                                  child: Context1()),
                              Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  height: 250,
                                  child: Context2()),
                            ],
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width,
                              height: 100,
                              child: Buttons()),
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
                      maxWidth: 320,
                      maxHeight: 250,
                    ),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 252, 252, 252),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text('Email:     ',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Color.fromARGB(255, 66, 65, 65))),
                              SizedBox(
                                  width: 200,
                                  height: 30,
                                  child: TextFormField(
                                      decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                          fillColor: Colors.white,
                                          filled: true),
                                      validator: (value) {}))
                            ]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text('Имя:     ',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Color.fromARGB(255, 66, 65, 65))),
                              SizedBox(
                                  width: 200,
                                  height: 30,
                                  child: TextFormField(
                                      decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                          fillColor: Colors.white,
                                          filled: true),
                                      validator: (value) {}))
                            ]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text('Фамилия:     ',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Color.fromARGB(255, 66, 65, 65))),
                              SizedBox(
                                  width: 200,
                                  height: 30,
                                  child: TextFormField(
                                      decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                          fillColor: Colors.white,
                                          filled: true),
                                      validator: (value) {}))
                            ]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text('Роль:     ',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Color.fromARGB(255, 66, 65, 65))),
                              SizedBox(
                                  width: 200,
                                  height: 30,
                                  child: TextFormField(
                                      decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                          fillColor: Colors.white,
                                          filled: true),
                                      validator: (value) {}))
                            ])
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
                    maxHeight: 200,
                  ),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 252, 252, 252),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Новый пароль',
                          style: TextStyle(
                              fontSize: 30,
                              color: Color.fromARGB(255, 92, 92, 92)),
                          textAlign: TextAlign.center),
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                        Text('Пароль:     ',
                            style: TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(255, 66, 65, 65))),
                        SizedBox(
                            width: 200,
                            height: 30,
                            child: TextFormField(
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    fillColor: Colors.white,
                                    filled: true),
                                validator: (value) {}))
                      ]),
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                        Text('Повтор пароля:     ',
                            style: TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(255, 66, 65, 65))),
                        SizedBox(
                            width: 200,
                            height: 30,
                            child: TextFormField(
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    fillColor: Colors.white,
                                    filled: true),
                                validator: (value) {}))
                      ])
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
                    padding: constraints.maxHeight < 500
                        ? EdgeInsets.all(30)
                        : EdgeInsets.zero,
                    constraints: BoxConstraints(
                      maxWidth: 800,
                      maxHeight: 130,
                    ),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 252, 252, 252),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Редактирование пользователя',
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

class Buttons extends StatefulWidget {
  const Buttons({super.key});

  @override
  State<Buttons> createState() => _Buttons();
}

class _Buttons extends State<Buttons> {
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
                      maxWidth: 350,
                      maxHeight: 100,
                    ),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 252, 252, 252),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 150,
                          height: 35,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                backgroundColor: MaterialStateProperty.all(
                                    Color.fromARGB(255, 215, 215, 215)),
                                padding: MaterialStateProperty.all(
                                    EdgeInsets.all(5)),
                              ),
                              onPressed: () {},
                              child: const Text('Сохранить',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black))),
                        ),
                        SizedBox(
                          width: 150,
                          height: 35,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                backgroundColor: MaterialStateProperty.all(
                                    Color.fromARGB(255, 215, 215, 215)),
                                padding: MaterialStateProperty.all(
                                    EdgeInsets.all(5)),
                              ),
                              onPressed: () {},
                              child: const Text('Отмена',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black))),
                        )
                      ],
                    ))));
      }));
}
