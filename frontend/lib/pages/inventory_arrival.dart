import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InventoryArrival extends StatelessWidget {
  const InventoryArrival({super.key});

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
                  Navigator.pushNamed(context, '/inventory');
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
          child:
          ListView(
            children:[ 
              Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    child: PageText()
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 400,
                    child: Context1()
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: Buttons()
                  ),
                ]
              )
            ]
          )
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

class Context1 extends StatefulWidget {
  const Context1({super.key});

  @override
  State<Context1> createState() => _Context1();
}

class _Context1 extends State<Context1> {
  final List<Map> _users = [
    {'name': 'Наименование', 'arrival': 'Поступление'},
    {'name': 'Номер бегуна', 'arrival': ''},
    {'name': 'RFID браслет', 'arrival': ''},
    {'name': 'Бейсболка', 'arrival': ''},
    {'name': 'Бутылка воды', 'arrival': ''},
    {'name': 'Футболка', 'arrival': ''},
    {'name': 'Сувенирный буклет', 'arrival': ''},
  ];
  @override
  Widget build(context) =>
    Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return AnimatedContainer(
            duration: Duration(milliseconds: 500),
            color: Color.fromARGB(255, 252, 252, 252),
            child: Align(
              alignment: Alignment.center,
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: 700,
                  maxHeight: 400,
                ),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 252, 252, 252),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: 
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Table(
                      columnWidths: const {
                        0: FixedColumnWidth(200),
                        1: FixedColumnWidth(200)
                      },
                      children: _users.map((user) {
                        return TableRow(children: [
                          Container(
                              color: _users.indexOf(user) == 0
                                  ? Color.fromARGB(255, 183, 183, 183)
                                  : _users.indexOf(user) % 2 == 0
                                  ? Color.fromARGB(255, 205, 205, 205)
                                  : Color.fromARGB(255, 227, 227, 227),
                              padding: const EdgeInsets.all(15),
                              child:_users.indexOf(user) == 0
                                  ? Text(user['name'].toString(), style: TextStyle(fontWeight: FontWeight.bold))
                                  : Text(user['name'].toString())),
                          Container(
                              color: _users.indexOf(user) == 0
                                  ? Color.fromARGB(255, 183, 183, 183)
                                  : _users.indexOf(user) % 2 == 0
                                  ? Color.fromARGB(255, 205, 205, 205)
                                  : Color.fromARGB(255, 227, 227, 227),
                              padding: const EdgeInsets.all(15),
                              child: _users.indexOf(user) == 0
                                  ? Text(user['arrival'], style: TextStyle(fontWeight: FontWeight.bold))
                                  : Text(user['arrival'])),
                        ]);
                      }).toList(),
                      border: TableBorder.all(width: 2, color: Color.fromARGB(255, 41, 41, 41)),
                    ),
                  ),
              )
            )
          );
        }
      )
   );
}

class PageText extends StatefulWidget {
  const PageText({super.key});

  @override
  State<PageText> createState() => _PageText();
}

class _PageText extends State<PageText> {
  @override
  Widget build(context) =>
    Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return AnimatedContainer(
            duration: Duration(milliseconds: 500),
            color: Color.fromARGB(255, 252, 252, 252),
            child: Align(
              alignment: Alignment.center,
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: 800,
                  maxHeight: 40,
                ),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 252, 252, 252),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: 
                Column(children: [
                  Text('Поступление инвентаря', style: TextStyle(fontSize: 30,color: Color.fromARGB(255, 92, 92, 92)),textAlign: TextAlign.center,)
                ],
                )
              )
            )
          );
        }
      )
   );
}

class Buttons extends StatefulWidget {
  const Buttons({super.key});

  @override
  State<Buttons> createState() => _Buttons();
}

class _Buttons extends State<Buttons> {
  @override
  Widget build(context) =>
    Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
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
                child: 
                  SizedBox(
                    width: 150,
                    height: 40,
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
                      onPressed: () { Navigator.pushNamed(context, '/inventory_arrival'); },
                      child: const Text('Сохранить', style: TextStyle(fontSize: 20,color: Colors.black),textAlign: TextAlign.center,)),
                ),
              )
            )
          );
        }
      )
   );
}


