import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Blago extends StatelessWidget {
  const Blago ({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PageState(),
      child: BlagoMenu(),
    );
  }
}
class PageState extends ChangeNotifier {}
class BlagoMenu extends StatefulWidget {
  const BlagoMenu({key}) : super(key: key);

  @override
  State<BlagoMenu> createState() => _BlagoMenu();
}

class _BlagoMenu extends State<BlagoMenu> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 0.05 * MediaQuery.of(context).size.width),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        'Управление благотворительными организациями',
                        style: TextStyle(
                            fontSize: 30,
                            color: Color.fromARGB(255, 87, 87, 87)),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              bottom: 0.01 * MediaQuery.of(context).size.width),
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
                                EdgeInsets.symmetric(
                                    horizontal: 0.02 *
                                        MediaQuery.of(context).size.width,
                                    vertical: 0.03 *
                                        MediaQuery.of(context).size.height),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, '/add_blago');
                            },
                            child: Text('+ Добавить новую организацию',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 87, 87, 87))),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.05),
                child: DataTable(
                  dataRowColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.selected))
                      return Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.08);
                    return Color.fromARGB(
                        255, 215, 215, 215); // Use the default value.
                  }),
                  headingRowColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    return Colors.grey; // Цвет для заголовков столбцов
                  }),
                  border: TableBorder.all(width: 1, color: Colors.black87),
                  columns: [
                    DataColumn(label: Text('Лого')),
                    DataColumn(label: Text('Наименование')),
                    DataColumn(label: Text('Описание')),
                    DataColumn(label: Text('Edit')),
                  ],
                  rows: List.generate(
                    dataFromDatabase.length,
                    (index) => DataRow(cells: [
                      DataCell(
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(dataFromDatabase[index].logo),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      DataCell(Text(dataFromDatabase[index].name)),
                      DataCell(Text(dataFromDatabase[index].info)),
                      DataCell(IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          Navigator.pushNamed(context,
                              '/add_blago'); // Добавьте здесь код для обработки нажатия на кнопку редактирования
                        },
                      )),
                    ]),
                  ),
                ),
              ),
            ],
          ),
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
      ),
    );
  }
}

// Пример модели данных
class Organization {
  String logo;
  String name;
  String info;

  Organization({required this.logo, required this.name, required this.info});
}

// Пример данных из базы данных (ваша выгрузка из базы данных)
List<Organization> dataFromDatabase = [
  Organization(
    logo: 'https://www.pngjoy.com/pngl/450/26790750_bonzi-buddy-png.png',
    name: 'Название организации 1',
    info: 'Информация об организации 1',
  ),
  Organization(
    logo: 'https://www.pngjoy.com/pngl/450/26790750_bonzi-buddy-png.png',
    name: 'Название организации 2',
    info: 'Информация об организации 2',
  ),
  // Здесь можно добавить больше элементов
];
