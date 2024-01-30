import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:marathon/components/bottom_navigation_bar_with_timer.dart';

class ControlCharity extends StatelessWidget {
  const ControlCharity({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PageState(),
      child: const CharityOrganizationPage(),
    );
  }
}

class PageState extends ChangeNotifier {}

class CharityOrganization {
  String name;
  String description;
  File? logoImage;

  CharityOrganization(
      {required this.name, required this.description, this.logoImage});
}

class CharityOrganizationPage extends StatefulWidget {
  const CharityOrganizationPage({super.key});
  @override
  _CharityOrganizationPageState createState() =>
      _CharityOrganizationPageState();
}

class _CharityOrganizationPageState extends State<CharityOrganizationPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  File? _logoImage;

  Future<void> _selectLogoImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _logoImage = File(image.path);
      });
    }
  }

  void _saveOrganization() {
    String name = _nameController.text;
    String description = _descriptionController.text;

    // Save the organization to the database
    CharityOrganization newOrganization = CharityOrganization(
        name: name, description: description, logoImage: _logoImage);

    // Save the newOrganization to the database here

    // Clear the input fields and the selected image
    _nameController.clear();
    _descriptionController.clear();
    setState(() {
      _logoImage = null;
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
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        'Добавление/редактирование благотворительных организаций',
                        style: TextStyle(
                            fontSize: 30,
                            color: Color.fromARGB(255, 87, 87, 87)),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      'Наименование',
                      style: TextStyle(
                          fontSize: 20, color: Color.fromARGB(255, 87, 87, 87)),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'Наименование',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 1.0),
                    child: Text(
                      'Описание',
                      style: TextStyle(
                          fontSize: 20, color: Color.fromARGB(255, 87, 87, 87)),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    controller: _descriptionController,
                    decoration: InputDecoration(
                      labelText: 'Описание',
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 3,
                  ),
                  SizedBox(height: 16.0),
                  _logoImage != null
                      ? Image.file(
                          _logoImage!,
                          height: 100,
                        )
                      : Container(
                          height: 100,
                          color: Colors.grey[200],
                          child: Center(
                            child: Text('charity_logo.jpg'),
                          ),
                        ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 215, 215, 215)),
                        padding: MaterialStateProperty.all(EdgeInsets.all(15)),
                        textStyle: MaterialStateProperty.all(TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 87, 87, 87)))),
                    onPressed: _selectLogoImage,
                    child: Text('Просмотр'),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.min, // Выравнивание кнопок
                      children: <Widget>[
                        SizedBox(height: 16.0),
                        ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all(
                                  Color.fromARGB(255, 215, 215, 215)),
                              padding:
                                  MaterialStateProperty.all(EdgeInsets.all(15)),
                              textStyle: MaterialStateProperty.all(
                                  TextStyle(fontSize: 20))),
                          onPressed: _saveOrganization,
                          child: Text('Сохранить'),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.03,
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all(
                                  Color.fromARGB(255, 215, 215, 215)),
                              padding:
                                  MaterialStateProperty.all(EdgeInsets.all(15)),
                              textStyle: MaterialStateProperty.all(
                                  TextStyle(fontSize: 20))),
                          onPressed: _saveOrganization,
                          child: Text('Отмена'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigationBarWithTimer(),
    );
  }
}

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
