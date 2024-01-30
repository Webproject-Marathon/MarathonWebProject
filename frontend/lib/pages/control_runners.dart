import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:marathon/components/bottom_navigation_bar_with_timer.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;



class ControlRunners extends StatelessWidget {
  const ControlRunners({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RunnersModel(),
      child: const HomePage(),
    );
  }
}

class RunnersModel extends ChangeNotifier {
  static List<Map<dynamic, dynamic>> orderingList = [
    {'label': 'имя', 'value': 'registration__runner__user__first_name'},
    {'label': 'фамилия', 'value': 'registration__runner__user__last_name'},
    {'label': 'email', 'value': 'registration__runner__user__email'},
    {'label': 'статус регистрации', 'value': 'registration__registration_status__status'},
  ];

  String? orderingDropdownValue;


  int totalRunners = 0;
  // Initialize runnersTable with mock data
  // to show it while actual data is loading from database.
  List<Map> runnersTable = [
    {'name': 'Имя', 'last_name': 'Фамилия', 'email': 'Email', 'status': 'Статус', 'space': ''},
    {'name': 'First', 'last_name': 'Runner', 'email': 'first@runner.com', 'status': 'Оплата подтверждена', 'space': ''},
    {'name': 'Second', 'last_name': 'Runner', 'email': 'second@runner.com', 'status': 'Оплата подтверждена', 'space': ''},
    {'name': 'Third', 'last_name': 'Runner', 'email': 'third@runner.com', 'status': 'Оплата подтверждена', 'space': ''},
    {'name': 'Fourth', 'last_name': 'Runner', 'email': 'fourth@runner.com', 'status': 'Оплата подтверждена', 'space': ''},
    {'name': 'Fourth', 'last_name': 'Runner', 'email': 'fourth@runner.com', 'status': 'Оплата подтверждена', 'space': ''},
  ];


  void getRunnersData() async {

    var uri = 'http://127.0.0.1:8000/runner-management/';
    if (orderingDropdownValue != null) {
      uri += '?ordering=${orderingDropdownValue}';
    }

    var request = http.MultipartRequest('GET', Uri.parse(uri));
    var response = await http.Client().send(request);
    if (response.statusCode != 200) {
      print('/runner-management/ request error! ${response.reasonPhrase}');
      return;
    }
    var responseData = await response.stream.bytesToString();
    var jsonResponse = json.decode(responseData);

    runnersTable.clear();
    // Add table header.
    runnersTable.add({
      'name': 'Имя',
      'last_name': 'Фамилия',
      'email': 'Email',
      'status': 'Статус',
      'space': ''},
    );
    // Fill the table.
    for (var runner in jsonResponse['results']) {
      runnersTable.add({
        'name': runner['runner_first_name'],
        'last_name': runner['runner_last_name'],
        'email': runner['runner_email'],
        'status': runner['registration_status'],
        'space': ''
      });
    }

    totalRunners = jsonResponse["count"];
    notifyListeners();
  }
}


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    RunnersModel runnersModel = Provider.of<RunnersModel>(context, listen: false);
    runnersModel.getRunnersData();
  }

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
                  Navigator.pushNamed(context, '/coordinator_menu');
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
          ListView(
            children: [
              Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    child: PageText()
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 250,
                    child: Context1()
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 250,
                    child: Context2()
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 350,
                    child: Context3()
                  ),
                ]
              )
            ]
          )
          : 
          ListView(
            children: [
              Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    child: PageText()
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width/2,
                        height: 280,
                        child: Context1()
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width/2,
                        height: 280,
                        child: Context2()
                      ),
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 350,
                    child: Context3()
                  ),
                ]
              )
            ]
          )
        )
    ),
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
                  maxWidth: 380,
                  maxHeight: 230,
                ),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 252, 252, 252),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Сортировка и фильтрация', style: TextStyle(fontSize: 25,color: Color.fromARGB(255, 87, 87, 87)),textAlign: TextAlign.center),
                    Row( 
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('Статус:     ', style: TextStyle(fontSize: 20,color: Color.fromARGB(255, 66, 65, 65))),
                        SizedBox(
                          width: 200,
                          height: 30,
                          child: TextFormField(
                              decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              fillColor: Colors.white,
                              filled: true),
                              validator: (value) {})
                        )
                      ]
                    ),
                    Row( 
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('Дистанция:     ', style: TextStyle(fontSize: 20,color: Color.fromARGB(255, 66, 65, 65))),
                        SizedBox(
                          width: 200,
                          height: 30,
                          child: TextFormField(
                              decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              fillColor: Colors.white,
                              filled: true),
                              validator: (value) {})
                        )
                      ]
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text('Сортировка:     ', style: TextStyle(fontSize: 20,color: Color.fromARGB(255, 66, 65, 65))),
                          GenericDropdownMenu(list: RunnersModel.orderingList)
                        ]
                    )
                  ],
                )
              )
            )
          );
        }
      )
   );
}

class Context2 extends StatefulWidget {
  const Context2({super.key});

  @override
  State<Context2> createState() => _Context2();
}

class _Context2 extends State<Context2> {
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
                  maxWidth: 400,
                  maxHeight: 400,
                ),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 252, 252, 252),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Выгрузка', style: TextStyle(fontSize: 25,color: Color.fromARGB(255, 87, 87, 87)),textAlign: TextAlign.center),
                    SizedBox(
                      width: 250,
                      height: 50,
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
                        child: const Text('Детальной информации\n (CSV)', style: TextStyle(fontSize: 20,color: Colors.black),textAlign: TextAlign.center,)),
                    ),
                    SizedBox(
                      width: 250,
                      height: 50,
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
                        child: const Text('E-mail список', style: TextStyle(fontSize: 20,color: Colors.black),textAlign: TextAlign.center,)),
                    ),
                    SizedBox(
                      width: 200,
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
                        child: const Text('Обновить', style: TextStyle(fontSize: 20,color: Colors.black),textAlign: TextAlign.center,)),
                    ) 
                  ],
                )
              ),
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
                  Text('Управление бегунами', style: TextStyle(fontSize: 30,color: Color.fromARGB(255, 92, 92, 92)),textAlign: TextAlign.center,)
                ],
                )
              )
            )
          );
        }
      )
   );
}

class Context3 extends StatefulWidget {
  const Context3({super.key});

  @override
  State<Context3> createState() => _Context3();
}

class _Context3 extends State<Context3> {
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
              child: SingleChildScrollView(
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: 1000,
                    // maxHeight: 3500,
                  ),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 252, 252, 252),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Consumer<RunnersModel>(
                            builder: (context, runnersModel, child) {
                              return Text(
                                'Total runners: ${runnersModel.totalRunners}',
                                style: const TextStyle(fontSize: 20, color: Color.fromARGB(255, 53, 53, 53)),
                              );
                            },
                          ),
                        ],
                      ),
                      Consumer<RunnersModel>(
                        builder: (context, runnersModel, child) {
                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Table(
                              columnWidths: const {
                                0: FixedColumnWidth(200),
                                1: FixedColumnWidth(200),
                                2: FixedColumnWidth(200),
                                3: FixedColumnWidth(200),
                                4: FixedColumnWidth(100),
                              },
                              children: runnersModel.runnersTable.map((user) {
                                return TableRow(children: [
                                  Container(
                                    color: runnersModel.runnersTable.indexOf(user) == 0
                                        ? Color.fromARGB(255, 147, 147, 147)
                                        : runnersModel.runnersTable.indexOf(user) % 2 == 0
                                        ? Color.fromARGB(255, 183, 183, 183)
                                        : Color.fromARGB(255, 205, 205, 205),
                                    padding: const EdgeInsets.all(15),
                                    child: runnersModel.runnersTable.indexOf(user) == 0
                                        ? Text(user['name'].toString(), style: TextStyle(fontWeight: FontWeight.bold))
                                        : Text(user['name'].toString()),
                                  ),
                                  Container(
                                    color: runnersModel.runnersTable.indexOf(user) == 0
                                        ? Color.fromARGB(255, 147, 147, 147)
                                        : runnersModel.runnersTable.indexOf(user) % 2 == 0
                                        ? Color.fromARGB(255, 183, 183, 183)
                                        : Color.fromARGB(255, 205, 205, 205),
                                    padding: const EdgeInsets.all(15),
                                    child: runnersModel.runnersTable.indexOf(user) == 0
                                        ? Text(user['last_name'], style: TextStyle(fontWeight: FontWeight.bold))
                                        : Text(user['last_name']),
                                  ),
                                  Container(
                                    color: runnersModel.runnersTable.indexOf(user) == 0
                                        ? Color.fromARGB(255, 147, 147, 147)
                                        : runnersModel.runnersTable.indexOf(user) % 2 == 0
                                        ? Color.fromARGB(255, 183, 183, 183)
                                        : Color.fromARGB(255, 205, 205, 205),
                                    padding: const EdgeInsets.all(15),
                                    child: runnersModel.runnersTable.indexOf(user) == 0
                                        ? Text(user['email'], style: TextStyle(fontWeight: FontWeight.bold))
                                        : Text(user['email']),
                                  ),
                                  Container(
                                    color: runnersModel.runnersTable.indexOf(user) == 0
                                        ? Color.fromARGB(255, 147, 147, 147)
                                        : runnersModel.runnersTable.indexOf(user) % 2 == 0
                                        ? Color.fromARGB(255, 183, 183, 183)
                                        : Color.fromARGB(255, 205, 205, 205),
                                    padding: const EdgeInsets.all(15),
                                    child: runnersModel.runnersTable.indexOf(user) == 0
                                        ? Text(user['status'], style: TextStyle(fontWeight: FontWeight.bold))
                                        : Text(user['status']),
                                  ),
                                  Container(
                                    color: runnersModel.runnersTable.indexOf(user) == 0
                                        ? Color.fromARGB(255, 147, 147, 147)
                                        : runnersModel.runnersTable.indexOf(user) % 2 == 0
                                        ? Color.fromARGB(255, 183, 183, 183)
                                        : Color.fromARGB(255, 205, 205, 205),
                                    padding: const EdgeInsets.all(8),
                                    child: runnersModel.runnersTable.indexOf(user) == 0
                                        ? SizedBox(width: 50, height: 30)
                                        : SizedBox(
                                      width: 50,
                                      height: 30,
                                      child: ElevatedButton(
                                        style: ButtonStyle(
                                          shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(5),
                                            ),
                                          ),
                                          backgroundColor: MaterialStateProperty.all(
                                              Color.fromARGB(255, 215, 215, 215)),
                                          padding: MaterialStateProperty.all(EdgeInsets.all(5)),
                                        ),
                                        onPressed: () {
                                          Navigator.pushNamed(context, '/manage_runner');
                                        },
                                        child: const Text('edit', style: TextStyle(fontSize: 20, color: Colors.black)),
                                      ),
                                    ),
                                  ),
                                ]);
                              }).toList(),
                              border: TableBorder.all(width: 2, color: Color.fromARGB(255, 41, 41, 41)),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),

            )
          );
        }
      )
   );
}



class GenericDropdownMenu extends StatelessWidget {
  static const List<Map<dynamic, dynamic>> defaultList = [];
  final List<Map<dynamic, dynamic>> list;

  const GenericDropdownMenu({
    super.key,
    this.list = defaultList,
  });

  @override
  Widget build(BuildContext context) {
    var runnersModel = context.watch<RunnersModel>();
    final curList = list;

    return DropdownMenu<String>(
      textStyle: const TextStyle(fontSize: 16),
      inputDecorationTheme: InputDecorationTheme(
        constraints: const BoxConstraints.expand(height: 30),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(width: 1.0, color: Color.fromRGBO(150, 150, 150, 1)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(width: 1.0, color: Color.fromRGBO(150, 150, 150, 1)),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
      ),

      initialSelection: null,
      onSelected: (String? value) {
        runnersModel.orderingDropdownValue = value;
        runnersModel.getRunnersData();
      },
      dropdownMenuEntries: curList.map<DropdownMenuEntry<String>>((Map<dynamic, dynamic> map) {
        return DropdownMenuEntry<String>(
          value: map['value'],
          label: map['label'],
          style: const ButtonStyle(
              textStyle: MaterialStatePropertyAll(TextStyle(fontSize: 16))
          ),
        );
      }).toList(),
    );
  }
}
