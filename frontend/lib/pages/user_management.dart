import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:marathon/components/bottom_navigation_bar_with_timer.dart';


class UserManagementHomeScreen extends StatelessWidget {
  const UserManagementHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PageState(),
      child: const UserManagementScreen(),
    );
  }
}

class PageState extends ChangeNotifier {
  String roleFilter = "";
  String columnFilter = "";
  String searchFilter = "";

  void updateSearch(value){
    searchFilter = value;
    notifyListeners();
  }

  void updateDropdownMenuValue(value){
    if (SelectFromDBFormsState.columnList.contains(value)) {
      columnFilter = value;
    }
    else if (SelectFromDBFormsState.roleList.contains(value)) {
      roleFilter = value;
    }
    notifyListeners();
  }
}


class UserManagementScreen extends StatefulWidget {
  const UserManagementScreen({super.key});

  @override
  State<UserManagementScreen> createState() => UserManagementScreenState();
}

class UserManagementScreenState extends State<UserManagementScreen> {
  @override
  Widget build(BuildContext context) {
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
      body: const Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Управление пользователями',
                  style: TextStyle(fontSize: 30, color: Color.fromRGBO(91, 91, 91, 1)),
                ),
                SelectFromDBForms(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavigationBarWithTimer(),
    );
  }
}


class SelectFromDBForms extends StatefulWidget {
  const SelectFromDBForms({super.key});

  @override
  SelectFromDBFormsState createState() => SelectFromDBFormsState();
}

class SelectFromDBFormsState extends State<SelectFromDBForms> {
  final _formKey = GlobalKey<FormState>();
  final _searchController = TextEditingController();

  static final roleList = ['Бегун', 'Координатор', 'Спонсор'];
  static final columnList = ['Имя', 'Фамилия', 'Email', 'Роль']; //заменить на данные бд

  @override
  Widget build(BuildContext context) {
    var pageState = context.watch<PageState>();
    bool isScreenWide = MediaQuery.sizeOf(context).width >= 1000;

    return Form(
      key: _formKey,
      child: Center(
        child: Column(
          children: [
            Flex(
              direction: isScreenWide ? Axis.horizontal : Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    SizedBox(height: isScreenWide ? 0 : 25),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(242, 242, 242, 1),
                        side: const BorderSide(width: 1.0, color: Color.fromRGBO(150, 150, 150, 1)),
                      ),
                      onPressed: () { Navigator.pushNamed(context, '/add_user'); },
                      child: const Text(
                          '+ Добавление нового',
                          style: TextStyle(color: Colors.black, fontSize: 16)
                      ),
                    ),
                  ],
                ),
                Column(
                    children: [
                      const SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IntrinsicHeight (
                          child: Row(
                            mainAxisSize:MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget> [
                                      Text ("Фильтр по ролям:", style: TextStyle(fontSize: 16),),
                                      Text ("Сортировать по:", style: TextStyle(fontSize: 16),),
                                      Text ("Поиск:", style: TextStyle(fontSize: 16),),
                                      SizedBox(height: 20),
                                    ],
                              ),
                              const SizedBox(width: 10,),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RegDropdownMenu(list: roleList, hint: "Все роли",),
                                  const SizedBox(height: 5),
                                  RegDropdownMenu(list: columnList, hint: "Имени"),
                                  const SizedBox(height: 5),
                                  SizedBox(
                                    width: 180,
                                    child: TextFormField(
                                      controller: _searchController,
                                      validator: (value) { return null; },
                                      decoration: const InputDecoration(
                                          hintText: "Поиск",
                                          hintStyle: TextStyle(fontStyle: FontStyle.italic),
                                          isDense: true,
                                          contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                                          border: OutlineInputBorder(),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(width: 1.0, color: Color.fromRGBO(150, 150, 150, 1)),
                                          )
                                      ),
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                      backgroundColor: const Color.fromRGBO(242, 242, 242, 1),
                                      side: const BorderSide(width: 1.0, color: Color.fromRGBO(150, 150, 150, 1)),
                                    ),
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        //магия какая-то
                                      }
                                    },
                                    child: const Text(
                                        'Обновить',
                                        style: TextStyle(color: Colors.black, fontSize: 16)
                                    ),
                                  ), //кнопка обновления
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                ),
              ],
            ), //верхний ряд
            SizedBox(height: isScreenWide ? 0 : 15),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    textAlign: TextAlign.left,
                    text: const TextSpan(
                      style: TextStyle(fontSize: 16.0, color: Colors.black,),
                      children: <TextSpan>[
                        TextSpan(text: 'Всего пользователей: ', style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: '...'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  UserTable(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class UserTable extends StatelessWidget {
  UserTable({
    super.key,
  });

  // findMax (List<Map> list) {
  //   List maxLenList = [];
  //   for (var i = 0; i < list.length; i++) {
  //     var maxElement = list[i].entries.reduce(
  //         (a, b) => (a.value.toString().length >= b.value.toString().length) ? a : b
  //     );
  //     maxLenList.add(maxElement.value.toString().length);
  //   }
  //   return maxLenList;
  // }

  final List<Map> userList = [
    {'name': 'Имя', 'last_name': 'Фамилия', 'email': 'Email', 'role': 'Роль', 'button': ''},
    {'name': 'Павел', 'last_name': 'Зиновьев', 'email': 'zine@yandex.ru', 'role': 'Координатор', 'button': ''},
    {'name': 'Андрей', 'last_name': 'Сущенко', 'email': 'suschenkoaa@mail.ru', 'role': 'Бегун', 'button': ''},
    {'name': 'Василина', 'last_name': 'Мелихова', 'email': 'melikhova.va@dvfu.ru', 'role': 'Бегун', 'button': ''},
    {'name': 'Оно', 'last_name': 'Йоко', 'email': 'realonoyoko@gmail.com', 'role': 'Спонсор', 'button': ''},
  ];

  @override
  Widget build(BuildContext context) {
    //var maxLenList = findMax(userList);

    return Table(
      border: TableBorder.all(width: 1.0, color: const Color.fromRGBO(101, 101, 101, 1)),
      columnWidths: const {
          0: FixedColumnWidth(200),
          1: FixedColumnWidth(200),
          2: FixedColumnWidth(200),
          3: FixedColumnWidth(150),
          4: FixedColumnWidth(100),
      },
      children: userList.map((user) {
        return TableRow(children: [
          TableCell(
            // verticalAlignment: user['name'].toString().length != maxLenList[userList.indexOf(user)]
            //     ? TableCellVerticalAlignment.fill : TableCellVerticalAlignment.top,
            child: Container(
                color: userList.indexOf(user) == 0 ? const Color.fromRGBO(165, 165, 165, 1)
                     : userList.indexOf(user) % 2 == 0 ?
                       const Color.fromRGBO(225, 225, 225, 1) : const Color.fromRGBO(240, 240, 240, 1),
                padding: const EdgeInsets.all(15),
                child: userList.indexOf(user) == 0
                    ? Text(user['name'].toString(), style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold))
                    : Text(user['name'].toString(), style: const TextStyle(fontSize: 16.0))),
          ),
          TableCell(
            // verticalAlignment: user['last_name'].toString().length != maxLenList[userList.indexOf(user)]
            //     ? TableCellVerticalAlignment.fill : TableCellVerticalAlignment.top,
            child: Container(
                color: userList.indexOf(user) == 0 ? const Color.fromRGBO(165, 165, 165, 1)
                     : userList.indexOf(user) % 2 == 0 ?
                       const Color.fromRGBO(225, 225, 225, 1) : const Color.fromRGBO(240, 240, 240, 1),
                padding: const EdgeInsets.all(15),
                child: userList.indexOf(user) == 0
                    ? Text(user['last_name'], style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold))
                    : Text(user['last_name'], style: const TextStyle(fontSize: 16.0))),
          ),
          TableCell(
            // verticalAlignment: user['email'].toString().length != maxLenList[userList.indexOf(user)]
            //     ? TableCellVerticalAlignment.fill : TableCellVerticalAlignment.top,
            child: Container(
                color: userList.indexOf(user) == 0 ? const Color.fromRGBO(165, 165, 165, 1)
                     : userList.indexOf(user) % 2 == 0 ?
                       const Color.fromRGBO(225, 225, 225, 1) : const Color.fromRGBO(240, 240, 240, 1),
                padding: const EdgeInsets.all(15),
                child: userList.indexOf(user) == 0
                    ? Text(user['email'], style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold))
                    : Text(user['email'], style: const TextStyle(fontSize: 16.0))),
          ),
          TableCell(
            // verticalAlignment: user['role'].toString().length != maxLenList[userList.indexOf(user)]
            //     ? TableCellVerticalAlignment.fill : TableCellVerticalAlignment.top,
            child: Container(
                color: userList.indexOf(user) == 0 ? const Color.fromRGBO(165, 165, 165, 1)
                     : userList.indexOf(user) % 2 == 0 ?
                       const Color.fromRGBO(225, 225, 225, 1) : const Color.fromRGBO(240, 240, 240, 1),
                padding: const EdgeInsets.all(15),
                child: userList.indexOf(user) == 0
                    ? Text(user['role'], style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold))
                    : Text(user['role'], style: const TextStyle(fontSize: 16.0))),
          ),
          TableCell(
            // verticalAlignment: user['button'].toString().length != maxLenList[userList.indexOf(user)]
            //     ? TableCellVerticalAlignment.fill : TableCellVerticalAlignment.top,
            child: Container(
                color: userList.indexOf(user) == 0 ? const Color.fromRGBO(165, 165, 165, 1)
                     : userList.indexOf(user) % 2 == 0 ?
                       const Color.fromRGBO(225, 225, 225, 1) : const Color.fromRGBO(240, 240, 240, 1),
                padding: const EdgeInsets.all(8),
                child: userList.indexOf(user) == 0 ? const SizedBox(width: 50, height: 33)
                     : const Padding(padding: EdgeInsets.all(2.0), child: EditButton(),)),
          )
        ]);
      }).toList(),
    );
  }
}

class EditButton extends StatelessWidget {
  const EditButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: const Color.fromRGBO(242, 242, 242, 1),
        side: const BorderSide(width: 1.0, color: Color.fromRGBO(150, 150, 150, 1)),
      ),
      onPressed: () { Navigator.pushNamed(context, '/home'); },
      child: const Text(
          'Edit',
          style: TextStyle(color: Colors.black, fontSize: 16)
      ),
    );
  }
}


class RegDropdownMenu extends StatelessWidget {
  static const defaultList = [''];
  static const defaultHint = "";

  final List<String> list;
  final String hint;

  const RegDropdownMenu({
    super.key,
    this.list = defaultList,
    this.hint = defaultHint,
  });

  @override
  Widget build(BuildContext context) {
    var pageState = context.watch<PageState>();
    final curList = list;
    final curHint = hint;

    return DropdownMenu<String>(
      width: 180,
      textStyle: const TextStyle(fontSize: 16),
      hintText: curHint,
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(fontStyle: FontStyle.italic),
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
        pageState.updateDropdownMenuValue(value);
      },
      dropdownMenuEntries: curList.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(
          value: value,
          label: value,
          style: const ButtonStyle(
              textStyle: MaterialStatePropertyAll(TextStyle(fontSize: 16))
          ),
        );
      }).toList(),
    );
  }
}
