import 'package:flutter/material.dart';
import 'package:marathon/components/bottom_navigation_bar_with_timer.dart';


class MyResultsScreen extends StatefulWidget {
  const MyResultsScreen({super.key});

  @override
  State<MyResultsScreen> createState() => _MyResultsScreen();
}

class _MyResultsScreen extends State<MyResultsScreen> {
  final List<Map> _users = [
    {'marathon': 'Марафон', 'distance': 'Дистанция', 'time': 'Время', 'overall_place': 'Общее место', 'category_place': 'Место по категории'},
    {'marathon': '2023 Japan', 'distance': '42km Full Marathon', 'time': '2h 27m 14s', 'overall_place': '#598', 'category_place': '#104'},
    {'marathon': '2022 New York', 'distance': '21km Half Marathon', 'time': '1h 35m 42s', 'overall_place': '#225', 'category_place': '#45'},
    {'marathon': '2021 Berlin', 'distance': '10km Road Race', 'time': '48m 17s', 'overall_place': '#72', 'category_place': '#15'},
    {'marathon': '2020 Paris', 'distance': '5km Charity Run', 'time': '25m 50s', 'overall_place': '#33', 'category_place': '#7'}

  ];

  @override
  Widget build(BuildContext context) {
    bool isScreenWide = MediaQuery.of(context).size.width >= 1000;

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 120,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/admin_menu');
            },
            style: ButtonStyle(
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(204, 204, 204, 1)),
              padding: MaterialStateProperty.all(const EdgeInsets.all(5)),
            ),
            child: const Text(
                'Назад',
                style: TextStyle(color: Colors.black, fontSize: 18)
            ),
          ),
        ),
        title: const Text(
          "MARATHON SKILLS 2023",
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30, color: Colors.white,),
        ),
        actions: [
          Padding(
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
                  backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(204, 204, 204, 1)),
                  padding: MaterialStateProperty.all(const EdgeInsets.all(5)),
                  fixedSize: MaterialStateProperty.all(const Size.fromWidth(120))
              ),
              child: const Text(
                  'Log out',
                  style: TextStyle(color: Colors.black, fontSize: 18)
              ),
            ),
          ),
        ],
        backgroundColor: const Color.fromRGBO(82, 82, 82, 1),
      ),
      body:
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(bottom: 40, top: 10),
                  child:Text('Мои результаты', style: TextStyle(fontSize: 30,color: Color.fromARGB(255, 92, 92, 92)),),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Это - список всех ваших прошлых результатов гонки Marathon Skills.', style: TextStyle(fontSize: 22, color: Color.fromARGB(255, 87, 87, 87)),textAlign: TextAlign.center),
                    Text('Общее место сравнивает всех бегунов.', style: TextStyle(fontSize: 22,color: Color.fromARGB(255, 87, 87, 87)),textAlign: TextAlign.center),
                    Padding(
                      padding: EdgeInsets.only(bottom: 30),
                      child: Text('Место по категории сравнивает бегунов одного пола и категории.', style: TextStyle(fontSize: 22,color: Color.fromARGB(255, 87, 87, 87)),textAlign: TextAlign.center),
                    ),
                  ],
                ),
                Flex(
                  direction: isScreenWide ? Axis.horizontal : Axis.vertical,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20, right: 40),
                      child: RichText(
                        text: const TextSpan(
                          style: TextStyle(fontSize: 23.0, color: Color.fromARGB(255, 53, 53, 53)),
                          children: <TextSpan>[
                            TextSpan(text: 'Пол:  ', style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(text: 'мужской'),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: RichText(
                        text: const TextSpan(
                          style: TextStyle(fontSize: 23.0, color: Color.fromARGB(255, 53, 53, 53)),
                          children: <TextSpan>[
                            TextSpan(text: 'Возрастная категория:  ', style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(text: '18-29'),
                          ],
                        ),
                      ),
                    ),
                  ]
                ),
                ResultTable(users: _users)
              ]

      ),
          ),
        ),
      bottomNavigationBar: const BottomNavigationBarWithTimer(),
    );
  }
}

class ResultTable extends StatelessWidget {
  const ResultTable({
    super.key,
    required List<Map> users,
  }) : _users = users;

  final List<Map> _users;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Table(
          columnWidths: const {
            0: FixedColumnWidth(200),
            1: FixedColumnWidth(250),
            2: FixedColumnWidth(150),
            3: FixedColumnWidth(150),
            4: FixedColumnWidth(150),
          },
          children: _users.map((user) {
            return TableRow(children: [
              Container(
                  padding: const EdgeInsets.all(15),
                  child:_users.indexOf(user) == 0
                      ? Text(user['marathon'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20))
                      : Text(user['marathon'])),
              Container(
                  padding: const EdgeInsets.all(15),
                  child:_users.indexOf(user) == 0
                      ? Text(user['distance'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20))
                      : Text(user['distance'])),
              Container(
                  padding: const EdgeInsets.all(15),
                  child:_users.indexOf(user) == 0
                      ? Text(user['time'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20))
                      : Text(user['time'])),
              Container(
                  padding: const EdgeInsets.all(15),
                  child:_users.indexOf(user) == 0
                      ? Text(user['overall_place'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20))
                      : Text(user['overall_place'])),
              Container(
                  padding: const EdgeInsets.all(15),
                  child:_users.indexOf(user) == 0
                      ? Text(user['category_place'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20))
                      : Text(user['category_place'])),
            ]);
          }).toList()
        ),
      ),
              );
  }
}