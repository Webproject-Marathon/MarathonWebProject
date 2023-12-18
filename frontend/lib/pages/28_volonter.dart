import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ManageVolonteer extends StatelessWidget {
  const ManageVolonteer ({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PageState(),
      child: MyHomePage(),
    );
  }
}
class PageState extends ChangeNotifier {}

class MyHomePage extends StatefulWidget {
  @override
  Volonter createState() => Volonter();
}

class Volonter extends State<MyHomePage> {
  List<Map<String, dynamic>> _data = [];
  String _sortBy = 'FirstName';

  Future<void> _getData() async {
    final response = await http.get(Uri.https('example.com', '/api/data'));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      setState(() {
        _data = List<Map<String, dynamic>>.from(jsonData);
        _sortData();
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _sortData() {
    _data.sort((a, b) {
      if (_sortBy == 'FirstName') {
        return a['FirstName'].compareTo(b['FirstName']);
      } else if (_sortBy == 'LastName') {
        return a['LastName'].compareTo(b['LastName']);
      } else if (_sortBy == 'CountryName') {
        return a['CountryName'].compareTo(b['CountryName']);
      } else if (_sortBy == 'Gender') {
        return a['Gender'].compareTo(b['Gender']);
      }
      return 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              'Управление волонтерами',
              style: TextStyle(
                  fontSize: 30, color: Color.fromARGB(255, 87, 87, 87)),
              textAlign: TextAlign.center,
            ),
          ),
          Center(
              child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // выравнивание по центру
            children: [
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.center, // выравнивание по центру
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 8.0),
                    child: Text(
                      'Сортировать по',
                      style: TextStyle(
                          fontSize: 20, color: Color.fromARGB(255, 87, 87, 87)),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: DropdownButton<String>(
                      value: _sortBy,
                      items: [
                        DropdownMenuItem(
                            child: Text('Фамилии',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black)),
                            value: 'FirstName'),
                        DropdownMenuItem(
                            child: Text('Имени',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black)),
                            value: 'LastName'),
                        DropdownMenuItem(
                            child: Text('Стране',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black)),
                            value: 'CountryName'),
                        DropdownMenuItem(
                            child: Text('Полу',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black)),
                            value: 'Gender'),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _sortBy = value ?? "default value";
                          _sortData();
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20), // отступ между столбцами
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.center, // выравнивание по центру
                children: [
                  Text(
                    'Загрузка',
                    style: TextStyle(
                        fontSize: 20, color: Color.fromARGB(255, 87, 87, 87)),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(width: 10), // отступ между текстом и кнопкой
                  ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 215, 215, 215)),
                      padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                    ),
                    onPressed: () {Navigator.pushNamed(context, '/load_volunteer');},
                    child: Text(
                      'Загрузка волонтеров',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),
                ],
              ),
              // Дополнительный контент
            ],
          )),
          Text(
            'Всего волонтеров: ${_data.length}',
            style:
                TextStyle(fontSize: 20, color: Color.fromARGB(255, 87, 87, 87)),
          ),
          if (_data.isEmpty)
            Center(child: CircularProgressIndicator())
          else
            Table(
              border: TableBorder.all(width: 1, color: Colors.black87),
              children: [
                TableRow(
                  children: [
                    TableCell(child: Text('Фамилия')),
                    TableCell(child: Text('Имя')),
                    TableCell(child: Text('Страна')),
                    TableCell(child: Text('Пол')),
                  ],
                ),
                for (var item in _data)
                  TableRow(
                    children: [
                      TableCell(child: Text(item['FirstName'])),
                      TableCell(child: Text(item['LastName'])),
                      TableCell(child: Text(item['CountryName'])),
                      TableCell(child: Text(item['Gender'])),
                    ],
                  ),
              ],
            ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(12),
        height: 50.0,
        color: Color.fromARGB(255, 87, 87, 87),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              '18 дней, 8 часов и 17 минут до старта марафона!',
              style: TextStyle(fontSize: 18, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
