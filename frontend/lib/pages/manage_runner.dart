import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:marathon/classes/text_presets.dart';

class ManageRunnerHomeScreen extends StatelessWidget {
  const ManageRunnerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PageState(),
      child: const ManageRunnerScreen(),
    );
  }
}

class PageState extends ChangeNotifier {
  var pfpPath = "";
  var curGender = "";
  var curCountry = "";
}


class ManageRunnerScreen extends StatefulWidget {
  const ManageRunnerScreen({super.key});

  @override
  State<ManageRunnerScreen> createState() => ManageRunnerScreenState();
}

class ManageRunnerScreenState extends State<ManageRunnerScreen> {

  @override
  Widget build(BuildContext context) {
    bool isScreenWide = MediaQuery.of(context).size.width >= 900;

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 120,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/runner_menu');
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
      body: Center(
          child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Header(text: 'Редактирование профиля'),
                          const SizedBox(height: 15,),
                          Flex(
                            direction: isScreenWide ? Axis.horizontal : Axis.vertical,
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: IntrinsicHeight (
                                  child: Row(
                                    mainAxisSize:MainAxisSize.min,
                                    children: [
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: <Widget> [
                                          DefaultText(text: "Email:"),
                                          SizedBox(height: 5,),
                                          DefaultText(text: "Имя:"),
                                          SizedBox(height: 5,),
                                          DefaultText(text: "Фамилия:"),
                                          SizedBox(height: 5,),
                                          DefaultText(text: "Пол:"),
                                          SizedBox(height: 5,),
                                          DefaultText(text: "Дата рождения:"),
                                          SizedBox(height: 5,),
                                          DefaultText(text: "Страна:"),
                                          SizedBox(height: 5,),
                                          DefaultText(text: "Благотворит:"),
                                          SizedBox(height: 5,),
                                          DefaultText(text: "Пожертвовано:"),
                                          SizedBox(height: 5,),
                                          DefaultText(text: "Выбранный пакет:"),
                                          SizedBox(height: 5,),
                                          DefaultText(text: "Дистанция:"),
                                        ],
                                      ),
                                      SizedBox(width: 10,),
                                      Column(
                                         mainAxisSize: MainAxisSize.min,
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                         children: <Widget> [
                                           GreyText(text: "kurochkina@yandex.ru"),
                                           SizedBox(height: 5,),
                                           GreyText(text: "Ирина"),
                                           SizedBox(height: 5,),
                                           GreyText(text: "Курочкина"),
                                           SizedBox(height: 5,),
                                           GreyText(text: "женский"),
                                           SizedBox(height: 5,),
                                           GreyText(text: "1954-02-12"),
                                           SizedBox(height: 5,),
                                           GreyText(text: "Россия"),
                                           SizedBox(height: 5,),
                                           GreyText(text: "Фонд линейной алгебры"),
                                           SizedBox(height: 5,),
                                           GreyText(text: "5\$"),
                                           SizedBox(height: 5,),
                                           GreyText(text: "Пакет C"),
                                           SizedBox(height: 5,),
                                           GreyText(text: "Полный марафон"),
                                         ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 50, height: 25,),
                              ReducedImageForm(),
                              SizedBox(width: 50, height: 25,),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: RegistrationStatusCheck(),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Flex(
                            direction: isScreenWide ? Axis.horizontal : Axis.vertical,
                            mainAxisSize:MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: Color.fromRGBO(242, 242, 242, 1),
                                  side: BorderSide(width: 1.0, color: Color.fromRGBO(150, 150, 150, 1)),
                                ),
                                onPressed: () {
                                  Navigator.pushNamed(context, '/certificate');
                                },
                                child: const Text(
                                  'Показ сертификата',
                                  style: TextStyle(fontSize: 16, color: Colors.black),
                                ),
                              ),
                              const SizedBox(width: 10, height: 5),
                              OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: const Color.fromRGBO(242, 242, 242, 1),
                                  side: const BorderSide(width: 1.0, color: Color.fromRGBO(150, 150, 150, 1)),
                                ),
                                onPressed: () {
                                  Navigator.pushNamed(context, '/certificate');
                                },
                                child: const Text(
                                  'Печать бейджа',
                                  style: TextStyle(fontSize: 16, color: Colors.black),
                                ),
                              ),
                              const SizedBox(width: 10, height: 5),
                              OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: const Color.fromRGBO(242, 242, 242, 1),
                                  side: const BorderSide(width: 1.0, color: Color.fromRGBO(150, 150, 150, 1)),
                                ),
                                onPressed: () {
                                  Navigator.pushNamed(context, '/runner_edit');
                                },
                                child: const Text(
                                  'Редактирование профиля',
                                  style: TextStyle(fontSize: 16, color: Colors.black),
                                ),
                              ),
                            ]
                          ),
                          //SizedBox(height: MediaQuery.sizeOf(context).height * 0.15,),
                        ]
                      ),
                ),
              ),
            ),
        ),

      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(12),
        height: 50.0,
        color: const Color.fromRGBO(82, 82, 82, 1),
        child: Text(
            'тут будет таймер',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, color: Colors.white)
        ),
      ),
    );
  }
}

class RegistrationStatusCheck extends StatefulWidget {
  const RegistrationStatusCheck({
    super.key,
  });

  @override
  State<RegistrationStatusCheck> createState() => _RegistrationStatusCheckState();
}

class _RegistrationStatusCheckState extends State<RegistrationStatusCheck> {
  bool toggleReg = false; //значения должны быть взяты из бд?
  bool togglePay = false;
  bool togglePack = false;
  bool toggleStart = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Subheader(text: "Регистрационный статус"),
        IntrinsicHeight (
          child: Row(
            mainAxisSize:MainAxisSize.min,
            children: [
               Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget> [
                  GreyText(text: "Зарегистрирован"),
                  SizedBox(height: 5,),
                  GreyText(text: "Подтверждена оплата"),
                  SizedBox(height: 5,),
                  GreyText(text: "Выдан пакет"),
                  SizedBox(height: 5,),
                  GreyText(text: "Вышел на старт"),
                ],
              ),
              const SizedBox(width: 10, height: 10),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget> [
                  Ink(
                    decoration: ShapeDecoration(
                      color: toggleReg
                           ? Colors.lightGreenAccent
                           : Colors.red,
                      shape: CircleBorder(),
                    ),
                    child: IconButton(
                      icon: toggleReg
                          ? Icon(Icons.check)
                          : Icon(Icons.close),
                      color: Colors.white,
                      onPressed: () {
                        setState(() {
                          toggleReg = !toggleReg;
                          if (!toggleReg) {
                            toggleStart = false;
                            togglePack = false;
                            togglePay = false;
                          }
                        });
                      }
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Ink(
                    decoration: ShapeDecoration(
                      color: toggleReg && togglePay
                          ? Colors.lightGreenAccent
                          : Colors.red,
                      shape: CircleBorder(),
                    ),
                    child: IconButton(
                        icon: toggleReg && togglePay
                            ? Icon(Icons.check)
                            : Icon(Icons.close),
                        color: Colors.white,
                        onPressed: () {
                          setState(() {
                            togglePay = !togglePay;
                            if (togglePay) {
                              toggleReg = true;
                            } else {
                              toggleStart = false;
                              togglePack = false;
                            }
                          });
                        }
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Ink(
                    decoration: ShapeDecoration(
                      color: toggleReg && togglePay && togglePack
                          ? Colors.lightGreenAccent
                          : Colors.red,
                      shape: CircleBorder(),
                    ),
                    child: IconButton(
                        icon: toggleReg && togglePay && togglePack
                            ? Icon(Icons.check)
                            : Icon(Icons.close),
                        color: Colors.white,
                        onPressed: () {
                          setState(() {
                            togglePack = !togglePack;
                            if (togglePack) {
                              togglePay = true;
                              toggleReg = true;
                            } else {
                              toggleStart = false;
                            }
                          });
                        }
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Ink(
                    decoration: ShapeDecoration(
                      color: toggleReg && togglePay && togglePack && toggleStart
                          ? Colors.lightGreenAccent
                          : Colors.red,
                      shape: CircleBorder(),
                    ),
                    child: IconButton(
                        icon: toggleReg && togglePay && togglePack && toggleStart
                            ? Icon(Icons.check)
                            : Icon(Icons.close),
                        color: Colors.white,
                        onPressed: () {
                          setState(() {
                            toggleStart = !toggleStart;
                            if (toggleStart) {
                              togglePack = true;
                              togglePay = true;
                              toggleReg = true;
                            }
                          });
                        }
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}




class ReducedImageForm extends StatelessWidget {
  const ReducedImageForm({super.key, this.logoImage});
  final File? logoImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 200,
      width: 180,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(234, 234, 234, 1),
        border: Border.all(width: 1, color: const Color.fromRGBO(82, 82, 82, 1),),),
      child: logoImage != null ? Image.file(logoImage!, height: 250, fit: BoxFit.cover,) :
      const DefaultText(text: "Фото"),
    );
  }
}