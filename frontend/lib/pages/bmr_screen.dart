import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:marathon/classes/text_presets.dart';
import 'package:marathon/components/bottom_navigation_bar_with_timer.dart';

class BMRHomeScreen extends StatelessWidget {
  const BMRHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PageState(),
      child: const BMRScreen(),
    );
  }
}

class PageState extends ChangeNotifier {
  var current = 1.67;
  var chosenGender = '';

  void updateBMR(h, w, a) {
    if (chosenGender == 'female') {
      current = 655 + (9.6 * w) + (1.8 * h) - (4.7 * a);
    } else if (chosenGender == 'male') {
      current = 66 + (13.7 * w) + (5 * h) - (6.8 * a);
    }
    notifyListeners();
  }

  void updateGender(value) {
    chosenGender = value;
    notifyListeners();
  }

  void resetBMR() {
    current = 1.67;
    chosenGender = '';
    notifyListeners();
  }
}

class BMRScreen extends StatefulWidget {
  const BMRScreen({super.key});

  @override
  State<BMRScreen> createState() => _BMRScreenState();
}

class _BMRScreenState extends State<BMRScreen> {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<PageState>();
    var curBMR = appState.current;
    bool isScreenWide = MediaQuery.sizeOf(context).width >= 800;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: FittedBox(
            fit: BoxFit.contain,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 50.0, horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'BMR калькулятор',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 10)
                    ],
                  ), //header
                  Flex(
                    direction: isScreenWide ? Axis.horizontal : Axis.vertical,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              width: 400,
                              child: const Text(
                                "Основной обмен (basal metabolic rate) — минимальное количество энергии, необходимое для нормальной жизнедеятельности организма. Введите свои данные для расчёта BMR:",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                                textAlign: TextAlign.center,
                              )),
                          const SizedBox(height: 5),
                          const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: GenderOption(),
                          ),
                          const InputForms(),
                        ],
                      ), //input column
                      const SizedBox(
                        width: 50,
                        height: 50,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BMRResult(bmr: curBMR),
                        ],
                      ) //bmr column
                    ],
                  ), //body
                ],
              ),
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
              Navigator.pushNamed(context, '/info');
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
  GenderOptionState createState() => GenderOptionState();
}

class GenderOptionState extends State<GenderOption> {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<PageState>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
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
              fontSize: 16, color: Color.fromRGBO(101, 101, 101, 1)),
        ),
      ]),
    );
  }
}

class BMRResult extends StatelessWidget {
  const BMRResult({
    super.key,
    required this.bmr,
  });

  final bmr;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            const Text(
              "Ваш BMR",
              style: TextStyle(
                  color: Color.fromRGBO(152, 152, 152, 1), fontSize: 22),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "${bmr.toStringAsFixed(3)}",
                style: const TextStyle(
                    color: Color.fromRGBO(101, 101, 101, 1), fontSize: 32),
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Ежедневно тратится калорий",
                  style: TextStyle(
                      color: Color.fromRGBO(152, 152, 152, 1), fontSize: 20),
                ),
                SizedBox(width: 4),
                ActivityAlert(),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                          width: 200,
                          child: const Text(
                            "Cидячий:",
                            textAlign: TextAlign.right,
                            style: TextStyle(color: Colors.blue, fontSize: 16),
                          )),
                      SizedBox(height: 4),
                      Container(
                          width: 200,
                          child: const Text("Маленькая активность:",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  color: Colors.green, fontSize: 16))),
                      SizedBox(height: 4),
                      Container(
                          width: 200,
                          child: const Text("Средняя активность:",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  color: Colors.amber, fontSize: 16))),
                      SizedBox(height: 4),
                      Container(
                          width: 200,
                          child: const Text("Сильная активность:",
                              textAlign: TextAlign.right,
                              style:
                                  TextStyle(color: Colors.red, fontSize: 16))),
                      SizedBox(height: 4),
                      Container(
                          width: 200,
                          child: const Text("Максимальная активность:",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  color: Color.fromRGBO(171, 2, 1, 1),
                                  fontSize: 16))),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                          width: 100,
                          child: Text(
                            "${(bmr * 1.2).toStringAsFixed(3)}",
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.blue, fontSize: 16),
                          )),
                      SizedBox(height: 4),
                      Container(
                          width: 100,
                          child: Text("${(bmr * 1.375).toStringAsFixed(3)}",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.green, fontSize: 16))),
                      SizedBox(height: 4),
                      Container(
                          width: 100,
                          child: Text("${(bmr * 1.55).toStringAsFixed(3)}",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.amber, fontSize: 16))),
                      SizedBox(height: 4),
                      Container(
                          width: 100,
                          child: Text("${(bmr * 1.725).toStringAsFixed(3)}",
                              textAlign: TextAlign.left,
                              style:
                                  TextStyle(color: Colors.red, fontSize: 16))),
                      SizedBox(height: 4),
                      Container(
                          width: 100,
                          child: Text("${(bmr * 1.9).toStringAsFixed(3)}",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(171, 2, 1, 1),
                                  fontSize: 16))),
                    ],
                  ),
                )
              ],
            ),
          ]),
        )
      ],
    );
  }
}

class InputForms extends StatefulWidget {
  const InputForms({super.key});

  @override
  InputFormsState createState() => InputFormsState();
}

class InputFormsState extends State<InputForms> {
  final _formKey = GlobalKey<FormState>();

  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  final _ageController = TextEditingController();

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
            ), //height
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
            ), //weight
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const DefaultText(text: "Возраст:"),
                SizedBox(width: 10),
                SizedBox(
                  width: 40,
                  child: TextFormField(
                    controller: _ageController,
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
                SizedBox(width: 10),
                const DefaultText(text: "лет"),
              ],
            ), //age
            SizedBox(height: 15),
            Row(mainAxisSize: MainAxisSize.min, children: [
              OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(242, 242, 242, 1)),
                  onPressed: () {
                    if (_formKey.currentState!.validate() &&
                        appState.chosenGender != '') {
                      final userData = {
                        'height': double.parse(_heightController.text),
                        'weight': double.parse(_weightController.text),
                        'age': double.parse(_ageController.text),
                      };
                      appState.updateBMR(userData['height'], userData['weight'],
                          userData['age']);
                    }
                  },
                  child: const DefaultText(text: 'Рассчитать')),
              SizedBox(width: 10),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(242, 242, 242, 1)),
                onPressed: () {
                  _formKey.currentState!.reset();
                  _heightController.text = "";
                  _weightController.text = "";
                  _ageController.text = "";
                  appState.resetBMR();
                },
                child: const DefaultText(
                  text: 'Отмена',
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}

class ActivityAlert extends StatelessWidget {
  const ActivityAlert({super.key});

  static const List<String> activityNames = <String>[
    "Сидячий образ",
    "Маленькая активность",
    "Средняя активность",
    "Сильная активность",
    "Максимальная активность"
  ];
  static const List<String> activityDesc = <String>[
    "Нет работы или работа за столом",
    "Мало физических работы или занятия спортом 1-3 раза в неделю",
    "Умеренная физическая работа или занятия спортом 3 - 5 дней в неделю",
    "Сильные физическая нагрузка или занятия спортом 6 - 7 дней в неделю",
    "Сильная ежедневная физическая нагрузка или спорт и физическая работа"
  ];

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Виды активности'),
          content: Container(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.all(10),
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(activityNames[index],
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      Text(activityDesc[index],
                          style: const TextStyle(fontSize: 16)),
                    ],
                  ),
                );
              },
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const DefaultText(text: 'OK'),
            ),
          ],
        ),
      ),
      icon: const Icon(Icons.info_outline),
      color: Colors.amber,
    );
  }
}
