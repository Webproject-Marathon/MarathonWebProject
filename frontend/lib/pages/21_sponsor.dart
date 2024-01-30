import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:marathon/components/bottom_navigation_bar_with_timer.dart';

class SponsorView extends StatelessWidget {
  const SponsorView({super.key});

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
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Map<String, dynamic>> _data = [];
  String _sortBy = 'logo';

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
      if (_sortBy == 'logo') {
        return a['logo'].compareTo(b['logo']);
      } else if (_sortBy == 'name') {
        return a['name'].compareTo(b['name']);
      } else if (_sortBy == 'amount') {
        return a['amount'].compareTo(b['amount']);
      }
      return 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              'Просмотр споносоров',
              style: TextStyle(
                  fontSize: 30, color: Color.fromARGB(255, 87, 87, 87)),
              textAlign: TextAlign.center,
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 8.0),
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
                      DropdownMenuItem(child: Text('Логотипу'), value: 'logo'),
                      DropdownMenuItem(
                          child: Text('Наименованию'), value: 'name'),
                      DropdownMenuItem(child: Text('Сумме'), value: 'amount'),
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
          ),
          Text(
            'Благотварительные организации: ${_data.length}',
            style:
                TextStyle(fontSize: 20, color: Color.fromARGB(255, 87, 87, 87)),
          ),
          Text(
            'Всего спонсорских взносов: ${_calculateTotalAmount()}',
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
                    TableCell(child: Text('Логотип')),
                    TableCell(child: Text('Наименование')),
                    TableCell(child: Text('Сумма')),
                  ],
                ),
                for (var item in _data)
                  TableRow(
                    children: [
                      TableCell(child: Image.network(item['logo'])),
                      TableCell(child: Text(item['name'])),
                      TableCell(child: Text(item['amount'].toString())),
                    ],
                  ),
              ],
            ),
        ],
      ),
      bottomNavigationBar: const BottomNavigationBarWithTimer(),
    );
  }

  double _calculateTotalAmount() {
    double total = 0;
    for (var item in _data) {
      total += item['amount'];
    }
    return total;
  }
}
