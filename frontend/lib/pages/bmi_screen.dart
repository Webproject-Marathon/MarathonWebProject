import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:marathon/classes/text_presets.dart';
import 'package:marathon/components/bottom_navigation_bar_with_timer.dart';

class BMIHomeScreen extends StatelessWidget {
  const BMIHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PageState(),
      child: const BMIScreen(),
    );
  }
}

class PageState extends ChangeNotifier {
  var chosenGender = '';
  var current = 24.2;

  void updateIMT(h, w) {
    current = w / (h / 100 * h / 100);
    notifyListeners();
  }

  void updateGender(value) {
    chosenGender = value;
    notifyListeners();
  }

  void resetIMT(value) {
    current = value;
    chosenGender = '';
    notifyListeners();
  }
}

class BMIScreen extends StatefulWidget {
  const BMIScreen({super.key});

  @override
  State<BMIScreen> createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<PageState>();
    var curBMI = appState.current;
    bool isScreenWide = MediaQuery.sizeOf(context).width >= 1000;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 20),
            child: Flex(
              direction: isScreenWide ? Axis.horizontal : Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FittedBox(
                  fit: BoxFit.contain,
                  child: Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'BMI калькулятор',
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                              const SizedBox(height: 8),
                            ],
                          ), //HEADER
                          Column(
                            children: [
                              Container(
                                  width: 400,
                                  child: const Text(
                                    "Индекс массы тела - величина, позволяющая оценить соответствие массы человека и его роста. Введите данные, чтобы узнать свой ИМТ:",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black),
                                    textAlign: TextAlign.center,
                                  )),
                              const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      GenderOption(),
                                    ]),
                              ),
                              const InputForms(),
                            ],
                          ), //GENDER ICONS AND INPUT FORMS
                        ],
                      ),
                      const SizedBox(width: 50, height: 50),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BMIResult(bmi: curBMI),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
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
      bottomNavigationBar: const BottomNavigationBarWithTimer(),
    );
  }
}

class GenderOption extends StatefulWidget {
  const GenderOption({super.key});

  @override
  GenderOptionState createState() {
    return GenderOptionState();
  }
}

class GenderOptionState extends State<GenderOption> {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<PageState>();

    return Row(
      children: [
        Column(
          children: [
            OutlinedButton(
                onPressed: () {
                  appState.updateGender('male');
                },
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                      width: appState.chosenGender == 'male' ? 2.0 : 1.0,
                      color: const Color.fromRGBO(101, 101, 101, 1)),
                  backgroundColor: const Color.fromRGBO(234, 234, 234, 1),
                ),
                child: const GenderCard(gender: 'male', genderName: 'Мужской')),
          ],
        ), //m
        const SizedBox(width: 10),
        Column(
          children: [
            OutlinedButton(
                onPressed: () {
                  appState.updateGender('female');
                },
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                      width: appState.chosenGender == 'female' ? 2.0 : 1.0,
                      color: const Color.fromRGBO(101, 101, 101, 1)),
                  backgroundColor: const Color.fromRGBO(234, 234, 234, 1),
                ),
                child:
                    const GenderCard(gender: 'female', genderName: 'Женский')),
          ],
        ), //f
      ],
    );
  }
}

class GenderCard extends StatelessWidget {
  const GenderCard({
    super.key,
    required this.gender,
    required this.genderName,
  });

  final gender;
  final genderName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: [
        ImageIcon(
          AssetImage('assets/gender_icons/${gender}.png'),
          color: const Color.fromRGBO(101, 101, 101, 1),
          size: 80,
        ),
        const SizedBox(height: 8),
        Text(
          '${genderName}',
          style: const TextStyle(
              color: Color.fromRGBO(101, 101, 101, 1), fontSize: 16),
        ),
      ]),
    );
  }
}

class BMIResult extends StatelessWidget {
  const BMIResult({
    super.key,
    required this.bmi,
  });

  final bmi;

  @override
  Widget build(BuildContext context) {
    final String bmiOption;
    final String bmiOptionName;
    final double indent_left;
    final double indent_right;

    if (bmi <= 18.5) {
      bmiOption = "underweight";
      bmiOptionName = "Недостаточный";
      if (bmi <= 11) {
        indent_left = 0;
        indent_right = 400;
      } else {
        indent_left = 100 * (bmi - 11) / 7.5;
        indent_right = 400 - 100 * (bmi - 11) / 7.5;
      }
    } else if (bmi <= 25) {
      bmiOption = "healthy";
      bmiOptionName = "Здоровый";
      indent_left = 100 * (bmi - 18.5) / 7.5 + 100;
      indent_right = 400 - (100 * (bmi - 18.5) / 7.5 + 100);
    } else if (bmi <= 30) {
      bmiOption = "overweight";
      bmiOptionName = "Избыточный";
      indent_left = 100 * (bmi - 25) / 5 + 200;
      indent_right = 400 - (100 * (bmi - 25) / 5 + 200);
    } else {
      bmiOption = "obese";
      bmiOptionName = "Ожирение";
      if (bmi > 35) {
        indent_left = 400;
        indent_right = 0;
      } else {
        indent_left = 100 * (bmi - 30) / 5 + 300;
        indent_right = 400 - (100 * (bmi - 30) / 5 + 300);
      }
    }

    return Column(
      children: [
        FittedBox(
          fit: BoxFit.contain,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Card(
                elevation: 0,
                color: const Color.fromRGBO(234, 234, 234, 1),
                shape: const RoundedRectangleBorder(
                  side: BorderSide(color: Color.fromRGBO(101, 101, 101, 1)),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(children: [
                    ImageIcon(
                      AssetImage('assets/bmi_icons/${bmiOption}.png'),
                      color: const Color.fromRGBO(101, 101, 101, 1),
                      size: 160,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${bmiOptionName}',
                      style: const TextStyle(
                          color: Color.fromRGBO(101, 101, 101, 1),
                          fontSize: 16),
                    ),
                  ]),
                )),
          ),
        ),
        FittedBox(
          fit: BoxFit.contain,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  children: [
                    SizedBox(width: indent_left),
                    Column(
                      children: [
                        Text("${bmi.toStringAsFixed(2)}",
                            style: const TextStyle(
                              fontSize: 20,
                            )),
                        const Text("|",
                            style: TextStyle(
                              fontSize: 17,
                            )),
                      ],
                    ),
                    SizedBox(width: indent_right),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 100,
                          height: 15,
                          color: Colors.yellow,
                        ),
                        const SizedBox(height: 8),
                        const Text('Недостаточный',
                            style: TextStyle(
                                color: Color.fromRGBO(180, 180, 180, 1),
                                fontSize: 14))
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: 100,
                          height: 15,
                          color: Colors.lightGreen,
                        ),
                        const SizedBox(height: 8),
                        const Text('Здоровый',
                            style: TextStyle(
                                color: Color.fromRGBO(180, 180, 180, 1),
                                fontSize: 14)),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: 100,
                          height: 15,
                          color: Colors.yellow,
                        ),
                        const SizedBox(height: 8),
                        const Text('Избыточный',
                            style: TextStyle(
                                color: Color.fromRGBO(180, 180, 180, 1),
                                fontSize: 14)),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: 100,
                          height: 15,
                          color: Colors.red,
                        ),
                        const SizedBox(height: 8),
                        const Text('Ожирение',
                            style: TextStyle(
                                color: Color.fromRGBO(180, 180, 180, 1),
                                fontSize: 14)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ), //COLORED BOXES WITH TITLES
      ],
    );
  }
}

class InputForms extends StatefulWidget {
  const InputForms({super.key});

  @override
  InputFormsState createState() {
    return InputFormsState();
  }
}

class InputFormsState extends State<InputForms> {
  final _formKey = GlobalKey<FormState>();

  final _heightController = TextEditingController();
  final _weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<PageState>();

    return Form(
      key: _formKey,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const DefaultText(text: "Рост:"),
                const SizedBox(width: 10),
                SizedBox(
                  width: 40,
                  child: TextFormField(
                    controller: _heightController,
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          double.tryParse(value) == null) {
                        return '!';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 10),
                const DefaultText(text: "см"),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const DefaultText(text: "Вес:"),
                const SizedBox(width: 10),
                SizedBox(
                  width: 40,
                  child: TextFormField(
                    controller: _weightController,
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          double.tryParse(value) == null) {
                        return '!';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 10),
                const DefaultText(text: "кг"),
              ],
            ),
            const SizedBox(height: 15),
            Row(mainAxisSize: MainAxisSize.min, children: [
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(242, 242, 242, 1)),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final userData = {
                      'height': double.parse(_heightController.text),
                      'weight': double.parse(_weightController.text),
                    };
                    appState.updateIMT(userData['height'], userData['weight']);
                    //print(userData.toString());
                    //print(appState.current);
                    //_formKey.currentState!.save();
                  }
                },
                child: const DefaultText(text: 'Рассчитать'),
              ),
              const SizedBox(width: 10),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(242, 242, 242, 1)),
                onPressed: () {
                  _formKey.currentState!.reset();
                  _heightController.text = "";
                  _weightController.text = "";
                  appState.resetIMT(24.2);
                },
                child: const DefaultText(text: 'Отмена'),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
