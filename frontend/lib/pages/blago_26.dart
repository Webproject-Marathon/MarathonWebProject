import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:marathon/components/bottom_navigation_bar_with_timer.dart';

class Blago extends StatelessWidget {
  const Blago({super.key});

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
        bottomNavigationBar: const BottomNavigationBarWithTimer(),
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
    name: 'Свет в Темноте',
    info: 'Организация, посвященная предоставлению света в жизни тех, кто находится в темноте бедности. Мы поддерживаем образовательные программы и обеспечиваем средства для тех, кто мечтает о лучшем будущем.',
  ),
  Organization(
    logo: 'https://www.pngjoy.com/pngl/450/26790750_bonzi-buddy-png.png',
    name: 'Сердце к Сердцу',
    info: 'Мы стремимся создать дружелюбное и поддерживающее сообщество для тех, кто сталкивается с трудностями в жизни. Наша организация предоставляет эмоциональную поддержку и ресурсы для того, чтобы каждое сердце чувствовало тепло и заботу.',
  ),
  // Здесь можно добавить больше элементов
];
