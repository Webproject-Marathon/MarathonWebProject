import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

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
                    Navigator.pushNamed(context, '/home');
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
                  SizedBox(height: 15,),
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
                  SizedBox(height: 15,),
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
