import 'package:flutter/material.dart';

class PastRacesResult extends StatefulWidget {
  const PastRacesResult({super.key});

  @override
  State<PastRacesResult> createState() => _PastRacesResult();
}

class _PastRacesResult extends State<PastRacesResult> {
  final List<Map> _users = [
    {'id': 'Место', 'time': 'Время', 'name': 'Имя Бегуна', 'country': 'Страна'},
    {'id': 1, 'time': '2h 27m 14s','name': 'John', 'country': 'BRA'},
    {'id': 2, 'time': '2h 27m 13s','name': 'Bob', 'country': 'ETH'},
    {'id': 3, 'time': '2h 37m 14s','name': 'Trump', 'country': 'USA'},
    {'id': 4, 'time': '2h 28m 14s','name': 'Joe Biden', 'country': 'ETH'},
    {'id': 5, 'time': '3h 27m 14s','name': 'Superman', 'country': 'ARG'}
  ];

  @override
  Widget build(BuildContext context) {
    bool isScreenWide = MediaQuery.sizeOf(context).width >= 1000;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 87, 87, 87),
        automaticallyImplyLeading: false,
        title: Row(
            children: <Widget>[
              Padding(
              padding: EdgeInsets.only(right: 40),
              child:
                  SizedBox(
                  width: 90,
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
              const Text('MARATHON SKILLS 2023', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30,color: Colors.white))
            ],
          ),
      ),
      body:
        Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 20),
              child: Column(
                children: [
                  FittedBox(
                    fit: BoxFit.contain,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Padding(
                          padding: EdgeInsets.only(bottom: 40, top: 10),
                          child:Text('Результаты прошлых гонок', style: TextStyle(fontSize: 30,color: Color.fromARGB(255, 92, 92, 92)),),
                        ),
                        Flex(
                          direction: isScreenWide ? Axis.horizontal : Axis.vertical,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IntrinsicHeight (
                              child: Row(
                                mainAxisSize:MainAxisSize.min,
                                children: [
                                  const Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget> [
                                      Text('Марафон:', style: TextStyle(fontSize: 20,color: Color.fromARGB(255, 87, 87, 87))),
                                      Text('Дистанция:', style: TextStyle(fontSize: 20,color: Color.fromARGB(255, 87, 87, 87)))
                                    ],
                                  ),
                                  const SizedBox(width: 20,),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(vertical: 5.0),
                                        child: SizedBox(
                                            width: 200,
                                            child: TextFormField(
                                                validator: (value) {
                                                  if (value == null || value.isEmpty) {return '!';}
                                                  return null;
                                                }
                                            )
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Padding(
                                        padding: const EdgeInsets.all(1.0),
                                          child: SizedBox(
                                              width: 200,
                                              child: TextFormField(
                                                  validator: (value) {
                                                    if (value == null || value.isEmpty) {return '!';}
                                                    return null;
                                                  }
                                              )
                                          )
                                      ), //name
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: isScreenWide ? 50 : 0),
                            IntrinsicHeight (
                              child: Row(
                                mainAxisSize:MainAxisSize.min,
                                children: [
                                  const Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget> [
                                      Text('Пол:', style: TextStyle(fontSize: 20,color: Color.fromARGB(255, 87, 87, 87))),
                                      Text('Категория:', style: TextStyle(fontSize: 20,color: Color.fromARGB(255, 87, 87, 87)))
                                    ],
                                  ),
                                  const SizedBox(width: 20,),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(vertical: 5.0),
                                        child: SizedBox(
                                            width: 200,
                                            child: TextFormField(
                                                validator: (value) {
                                                  if (value == null || value.isEmpty) {return '!';}
                                                  return null;
                                                }
                                            )
                                        )
                                      ),
                                      const SizedBox(height: 5),
                                      Padding(
                                          padding: const EdgeInsets.all(1.0),
                                          child: SizedBox(
                                              width: 200,
                                              child: TextFormField(
                                                  validator: (value) {
                                                    if (value == null || value.isEmpty) {return '!';}
                                                    return null;
                                                  }
                                              )
                                          )
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: isScreenWide ? 50 : 0, height: isScreenWide ? 0 : 20),
                            SizedBox(
                              width: 90,
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
                                  }, child: const Text('Поиск', style: TextStyle(fontSize: 20,color: Colors.black))),
                            )
                          ]
                        ),
                        SizedBox(height: isScreenWide ? 0 : 20),
                        Flex(
                          direction: isScreenWide ? Axis.horizontal : Axis.vertical,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 15, right: 40, top: 20),
                              child: RichText(
                                text: const TextSpan(
                                  style: TextStyle(fontSize: 23.0, color: Color.fromARGB(255, 53, 53, 53)),
                                  children: <TextSpan>[
                                    TextSpan(text: 'Всего бегунов:  ', style: TextStyle(fontWeight: FontWeight.bold)),
                                    TextSpan(text: '1234'),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 15, right: 40, top: 20),
                              child: RichText(
                                text: const TextSpan(
                                  style: TextStyle(fontSize: 23.0, color: Color.fromARGB(255, 53, 53, 53)),
                                  children: <TextSpan>[
                                    TextSpan(text: 'Всего бегунов финишировало:  ', style: TextStyle(fontWeight: FontWeight.bold)),
                                    TextSpan(text: '1198'),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 15, top: 20),
                              child: RichText(
                                text: const TextSpan(
                                  style: TextStyle(fontSize: 23.0, color: Color.fromARGB(255, 53, 53, 53)),
                                  children: <TextSpan>[
                                    TextSpan(text: 'Среднее время:  ', style: TextStyle(fontWeight: FontWeight.bold)),
                                    TextSpan(text: '4h 02m 10s'),
                                  ],
                                ),
                              ),
                            ),
                          ]
                        ),
                      ]
                    ),
                  ),
                  PastRacesTable(users: _users)
                ],
              ),
            ),
          ),
        ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(12),
        height: 50.0,
        color: Color.fromARGB(255, 87, 87, 87),
        child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Text('18 дней, 8 часов и 17 минут до старта марафона!', style: TextStyle(fontSize: 18,color: Colors.white),)
              ],
      ),
    ),
    );
  }
}


class PastRacesTable extends StatelessWidget {
  const PastRacesTable({
    super.key,
    required List<Map> users,
  }) : _users = users;

  final List<Map> _users;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(25),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Table(
          columnWidths: const {
            0: FixedColumnWidth(75),
            1: FixedColumnWidth(180),
            2: FixedColumnWidth(500),
            3: FixedColumnWidth(180)
          },
          children: _users.map((user) {
            return TableRow(children: [
              Container(
                  color: _users.indexOf(user) == 0
                      ? Color.fromARGB(255, 147, 147, 147)
                      : _users.indexOf(user) % 2 == 0
                      ? Color.fromARGB(255, 183, 183, 183)
                      : Color.fromARGB(255, 205, 205, 205),
                  padding: const EdgeInsets.all(15),
                  child:_users.indexOf(user) == 0
                      ? Text(user['id'].toString(), style: TextStyle(fontWeight: FontWeight.bold))
                      : Text(user['id'].toString())),
              Container(
                  color: _users.indexOf(user) == 0
                      ? Color.fromARGB(255, 147, 147, 147)
                      : _users.indexOf(user) % 2 == 0
                      ? Color.fromARGB(255, 183, 183, 183)
                      : Color.fromARGB(255, 205, 205, 205),
                  padding: const EdgeInsets.all(15),
                  child: _users.indexOf(user) == 0
                      ? Text(user['time'], style: TextStyle(fontWeight: FontWeight.bold))
                      : Text(user['time'])),
              Container(
                  color: _users.indexOf(user) == 0
                      ? Color.fromARGB(255, 147, 147, 147)
                      : _users.indexOf(user) % 2 == 0
                      ? Color.fromARGB(255, 183, 183, 183)
                      : Color.fromARGB(255, 205, 205, 205),
                  padding: const EdgeInsets.all(15),
                  child: _users.indexOf(user) == 0
                      ? Text(user['name'], style: TextStyle(fontWeight: FontWeight.bold))
                      : Text(user['name'])),
              Container(
                  color: _users.indexOf(user) == 0
                      ? Color.fromARGB(255, 147, 147, 147)
                      : _users.indexOf(user) % 2 == 0
                      ? Color.fromARGB(255, 183, 183, 183)
                      : Color.fromARGB(255, 205, 205, 205),
                  padding: const EdgeInsets.all(15),
                  child: _users.indexOf(user) == 0
                      ? Text(user['country'], style: TextStyle(fontWeight: FontWeight.bold))
                      : Text(user['country']))
            ]);
          }).toList(),
          border: TableBorder.all(width: 2, color: Color.fromARGB(255, 41, 41, 41)),
        ),
      ),
    );
  }
}