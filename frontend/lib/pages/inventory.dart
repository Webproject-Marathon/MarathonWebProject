import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InventoryScreen extends StatelessWidget {
  const InventoryScreen({super.key});

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
                  Navigator.pushNamed(context, '/admin_menu');
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
                    height: 500,
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
  final List<Map> _id = [
    {'set': 'Комплект', 'A': 'Тип A', 'B': 'Тип B', 'C': 'Тип C', 'need': 'Необходимо', 'last': 'Остаток'},
    {'set': 'Выбрало данный вариант', 'A': '123', 'B': '123', 'C': '123', 'need': 'Сумма', 'last': 'Остаток'},
  ];
  final List<Map> _content = [
    {'set': 'Номер', 'A': '123', 'B': '123', 'C': '123', 'need': 'Сумма', 'last': 'Остаток'},
    {'set': 'RFID бр-т', 'A': '123', 'B': '123', 'C': '123', 'need': 'Сумма', 'last': 'Остаток'},
    {'set': 'Бейсболка', 'A': 'X', 'B': '123', 'C': '123', 'need': 'Сумма', 'last': 'Остаток'},
    {'set': 'Бут. воды', 'A': 'X', 'B': '123', 'C': '123', 'need': 'Сумма', 'last': 'Остаток'},
    {'set': 'Футболка', 'A': 'X', 'B': 'X', 'C': '123', 'need': 'Сумма', 'last': 'Остаток'},
    {'set': 'Сув. букл.', 'A': 'X', 'B': 'X', 'C': '123', 'need': 'Сумма', 'last': 'Остаток'},
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
              alignment: Alignment.topCenter,
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: 950,
                  maxHeight: 500,
                ),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 252, 252, 252),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row( 
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Всего зарегистрировано бегунов на марафон:     ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18,color: Color.fromARGB(255, 53, 53, 53)),textAlign: TextAlign.center,),
                        Text('123', style: TextStyle(fontSize: 18,color: Color.fromARGB(255, 53, 53, 53))),
                      ]
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Table(
                        columnWidths: const {
                          0: FixedColumnWidth(200),
                          1: FixedColumnWidth(150),
                          2: FixedColumnWidth(150),
                          3: FixedColumnWidth(150),
                          4: FixedColumnWidth(150),
                          5: FixedColumnWidth(150)
                        },
                        children: _id.map((id) {
                          return TableRow(children: [
                            Container(
                                color: _id.indexOf(id) == 0
                                    ? Color.fromARGB(255, 183, 183, 183)
                                    : _id.indexOf(id) % 2 == 0
                                    ? Color.fromARGB(255, 205, 205, 205)
                                    : Color.fromARGB(255, 227, 227, 227),
                                padding: const EdgeInsets.all(15),
                                child:_id.indexOf(id) == 0
                                    ? Text(id['set'], style: TextStyle(fontWeight: FontWeight.bold))
                                    : Text(id['set'])),
                            Container(
                                color: _id.indexOf(id) == 0
                                    ? Color.fromARGB(255, 183, 183, 183)
                                    : _id.indexOf(id) % 2 == 0
                                    ? Color.fromARGB(255, 205, 205, 205)
                                    : Color.fromARGB(255, 227, 227, 227),
                                padding: const EdgeInsets.all(15),
                                child:_id.indexOf(id) == 0
                                    ? Text(id['A'], style: TextStyle(fontWeight: FontWeight.bold))
                                    : SizedBox(
                                        width: 50,
                                        height: 30,
                                        child:Text(id['A'])
                                      )),
                            Container(
                                color: _id.indexOf(id) == 0
                                    ? Color.fromARGB(255, 183, 183, 183)
                                    : _id.indexOf(id) % 2 == 0
                                    ? Color.fromARGB(255, 205, 205, 205)
                                    : Color.fromARGB(255, 227, 227, 227),
                                padding: const EdgeInsets.all(15),
                                child:_id.indexOf(id) == 0
                                    ? Text(id['B'], style: TextStyle(fontWeight: FontWeight.bold))
                                    : SizedBox(
                                        width: 50,
                                        height: 30,
                                        child:Text(id['B'])
                                      )),
                            Container(
                                color: _id.indexOf(id) == 0
                                    ? Color.fromARGB(255, 183, 183, 183)
                                    : _id.indexOf(id) % 2 == 0
                                    ? Color.fromARGB(255, 205, 205, 205)
                                    : Color.fromARGB(255, 227, 227, 227),
                                padding: const EdgeInsets.all(15),
                                child:_id.indexOf(id) == 0
                                    ? Text(id['C'], style: TextStyle(fontWeight: FontWeight.bold))
                                    : SizedBox(
                                        width: 50,
                                        height: 30,
                                        child:Text(id['C'])
                                      )),
                            Container(
                                color: _id.indexOf(id) == 0
                                    ? Color.fromARGB(255, 183, 183, 183)
                                    : _id.indexOf(id) % 2 == 0
                                    ? Color.fromARGB(255, 205, 205, 205)
                                    : Color.fromARGB(255, 227, 227, 227),
                                padding: const EdgeInsets.all(15),
                                child:_id.indexOf(id) == 0
                                    ? Text(id['need'], style: TextStyle(fontWeight: FontWeight.bold))
                                    : SizedBox(
                                        width: 50,
                                        height: 30,
                                        child:Text(id['need'])
                                      )),
                            Container(
                                color: _id.indexOf(id) == 0
                                    ? Color.fromARGB(255, 183, 183, 183)
                                    : _id.indexOf(id) % 2 == 0
                                    ? Color.fromARGB(255, 205, 205, 205)
                                    : Color.fromARGB(255, 227, 227, 227),
                                padding: const EdgeInsets.all(15),
                                child:_id.indexOf(id) == 0
                                    ? Text(id['last'], style: TextStyle(fontWeight: FontWeight.bold))
                                    : SizedBox(
                                        width: 50,
                                        height: 30,
                                        child:Text(id['last'])
                                      ))
                          ]);
                        }).toList(),
                        border: TableBorder.all(width: 2, color: Color.fromARGB(255, 41, 41, 41)),
                      ),
                    ),
                    Text('Состав комплекта', style: TextStyle(fontSize: 25,color: Color.fromARGB(255, 92, 92, 92)),textAlign: TextAlign.center,),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Table(
                        columnWidths: const {
                          0: FixedColumnWidth(200),
                          1: FixedColumnWidth(150),
                          2: FixedColumnWidth(150),
                          3: FixedColumnWidth(150),
                          4: FixedColumnWidth(150),
                          5: FixedColumnWidth(150)
                        },
                        children: _content.map((id) {
                          return TableRow(children: [
                            Container(
                                color: _content.indexOf(id) == 0
                                    ? Color.fromARGB(255, 183, 183, 183)
                                    : _content.indexOf(id) % 2 == 0
                                    ? Color.fromARGB(255, 205, 205, 205)
                                    : Color.fromARGB(255, 227, 227, 227),
                                padding: const EdgeInsets.all(15),
                                child:_content.indexOf(id) == 0
                                    ? Text(id['set'], style: TextStyle(fontWeight: FontWeight.bold))
                                    : Text(id['set'])),
                            Container(
                                color: _content.indexOf(id) == 0
                                    ? Color.fromARGB(255, 183, 183, 183)
                                    : _content.indexOf(id) % 2 == 0
                                    ? Color.fromARGB(255, 205, 205, 205)
                                    : Color.fromARGB(255, 227, 227, 227),
                                padding: const EdgeInsets.all(15),
                                child:_content.indexOf(id) == 0
                                    ? Text(id['A'], style: TextStyle(fontWeight: FontWeight.bold))
                                    : Text(id['A'])),
                            Container(
                                color: _content.indexOf(id) == 0
                                    ? Color.fromARGB(255, 183, 183, 183)
                                    : _content.indexOf(id) % 2 == 0
                                    ? Color.fromARGB(255, 205, 205, 205)
                                    : Color.fromARGB(255, 227, 227, 227),
                                padding: const EdgeInsets.all(15),
                                child:_content.indexOf(id) == 0
                                    ? Text(id['B'], style: TextStyle(fontWeight: FontWeight.bold))
                                    : Text(id['B'])),
                            Container(
                                color: _content.indexOf(id) == 0
                                    ? Color.fromARGB(255, 183, 183, 183)
                                    : _content.indexOf(id) % 2 == 0
                                    ? Color.fromARGB(255, 205, 205, 205)
                                    : Color.fromARGB(255, 227, 227, 227),
                                padding: const EdgeInsets.all(15),
                                child:_content.indexOf(id) == 0
                                    ? Text(id['C'], style: TextStyle(fontWeight: FontWeight.bold))
                                    : Text(id['C'])),
                            Container(
                                color: _content.indexOf(id) == 0
                                    ? Color.fromARGB(255, 183, 183, 183)
                                    : _content.indexOf(id) % 2 == 0
                                    ? Color.fromARGB(255, 205, 205, 205)
                                    : Color.fromARGB(255, 227, 227, 227),
                                padding: const EdgeInsets.all(15),
                                child:_content.indexOf(id) == 0
                                    ? Text(id['need'], style: TextStyle(fontWeight: FontWeight.bold))
                                    : Text(id['need'])),
                            Container(
                                color: _content.indexOf(id) == 0
                                    ? Color.fromARGB(255, 183, 183, 183)
                                    : _content.indexOf(id) % 2 == 0
                                    ? Color.fromARGB(255, 205, 205, 205)
                                    : Color.fromARGB(255, 227, 227, 227),
                                padding: const EdgeInsets.all(15),
                                child:_content.indexOf(id) == 0
                                    ? Text(id['last'], style: TextStyle(fontWeight: FontWeight.bold))
                                    : Text(id['last']))
                          ]);
                        }).toList(),
                        border: TableBorder.all(width: 2, color: Color.fromARGB(255, 41, 41, 41)),
                      ),
                    ),
                  ],
                )
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
                  Text('Инвентарь', style: TextStyle(fontSize: 30,color: Color.fromARGB(255, 92, 92, 92)),textAlign: TextAlign.center,)
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
  final List<Map> _dialog = [
    {'set': 'Наименование','last': 'Остаток', 'need': 'Необходимо','order': 'Надо заказть'},
    {'set': 'Номер','last': '', 'need': '','order': ''},
    {'set': 'RFID бр-т','last': '', 'need': '','order': ''},
    {'set': 'Бейсболка','last': '', 'need': '','order': ''},
    {'set': 'Бут. воды','last': '', 'need': '','order': ''},
    {'set': 'Футболка','last': '', 'need': '','order': ''},
    {'set': 'Сув. букл.','last': '', 'need': '','order': ''},
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
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
                        onPressed: () {
                        _showDialog(context, 'Точка 1');
                        },
                        child: const Text('Отчет', style: TextStyle(fontSize: 20,color: Colors.black),textAlign: TextAlign.center,)),
                    ),
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
                        child: const Text('Поступление', style: TextStyle(fontSize: 20,color: Colors.black),textAlign: TextAlign.center,)),
                  ),
                  ],
                )
              )
            )
          );
        }
      )
   );
   void _showDialog(BuildContext context, String pointName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Отчет', textAlign: TextAlign.center,),
          content: Padding(
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Table(
                columnWidths: const {
                  0: FixedColumnWidth(200),
                  1: FixedColumnWidth(150),
                  2: FixedColumnWidth(150),
                  3: FixedColumnWidth(150)
                },
                children: _dialog.map((id) {
                  return TableRow(children: [
                    Container(
                        color: _dialog.indexOf(id) == 0
                            ? Color.fromARGB(255, 183, 183, 183)
                            : _dialog.indexOf(id) % 2 == 0
                            ? Color.fromARGB(255, 205, 205, 205)
                            : Color.fromARGB(255, 227, 227, 227),
                        padding: const EdgeInsets.all(15),
                        child:_dialog.indexOf(id) == 0
                            ? Text(id['set'], style: TextStyle(fontWeight: FontWeight.bold))
                            : Text(id['set'])),
                    Container(
                        color: _dialog.indexOf(id) == 0
                            ? Color.fromARGB(255, 183, 183, 183)
                            : _dialog.indexOf(id) % 2 == 0
                            ? Color.fromARGB(255, 205, 205, 205)
                            : Color.fromARGB(255, 227, 227, 227),
                        padding: const EdgeInsets.all(15),
                        child:_dialog.indexOf(id) == 0
                            ? Text(id['last'], style: TextStyle(fontWeight: FontWeight.bold))
                            : Text(id['last'])),
                    Container(
                        color: _dialog.indexOf(id) == 0
                            ? Color.fromARGB(255, 183, 183, 183)
                            : _dialog.indexOf(id) % 2 == 0
                            ? Color.fromARGB(255, 205, 205, 205)
                            : Color.fromARGB(255, 227, 227, 227),
                        padding: const EdgeInsets.all(15),
                        child:_dialog.indexOf(id) == 0
                            ? Text(id['need'], style: TextStyle(fontWeight: FontWeight.bold))
                            : Text(id['need'])),
                    Container(
                        color: _dialog.indexOf(id) == 0
                            ? Color.fromARGB(255, 183, 183, 183)
                            : _dialog.indexOf(id) % 2 == 0
                            ? Color.fromARGB(255, 205, 205, 205)
                            : Color.fromARGB(255, 227, 227, 227),
                        padding: const EdgeInsets.all(15),
                        child:_dialog.indexOf(id) == 0
                            ? Text(id['order'], style: TextStyle(fontWeight: FontWeight.bold))
                            : Text(id['order']))
                  ]);
                }).toList(),
                border: TableBorder.all(width: 2, color: Color.fromARGB(255, 41, 41, 41)),
              ),
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.all(10),
              child: SizedBox(
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
                  onPressed: () {},
                  child: const Text('Печать', style: TextStyle(fontSize: 20,color: Colors.black),textAlign: TextAlign.center,)),
              ) 
            ),
          ],
        );
      },
    );
  }
}


