import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:marathon/classes/text_presets.dart';
import 'dart:convert';
import 'package:marathon/components/bottom_navigation_bar_with_timer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EventRegistrationHomeScreen extends StatelessWidget {
  const EventRegistrationHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PageState(),
      child: const EventRegistrationScreen(),
    );
  }
}

class PageState extends ChangeNotifier {
  static List<Map<dynamic, dynamic>> charitiesList = [];

  var flag = false;
  var curDonation = 0;
  var curPayment = 0;
  var curCharityUrl = "";
  var curCharityInfo = {};

  bool isFullMarathon = false;
  bool isHalfMarathon = false;
  bool isShortRange = false;

  bool isKitA = true;
  bool isKitB = false;
  bool isKitC = false;

  void updateFlag(){
    flag = true;
    notifyListeners();
  }

  void updateIsFullMarathon(value){
    isFullMarathon = value;
    curPayment += isFullMarathon ? 145 : -145;
    notifyListeners();
  }

  void updateIsHalfMarathon(value) {
    isHalfMarathon = value;
    curPayment += isHalfMarathon ? 75 : -75;
    notifyListeners();
  }

  void updateIsShortRange(value) {
    isShortRange = value;
    curPayment += isShortRange ? 20 : -20;
    notifyListeners();
  }

  String getKitUrl() {
    if (isKitA) {
      return "http://127.0.0.1:8000/race-kit-options/1/";
    } else if (isKitB) {
      return "http://127.0.0.1:8000/race-kit-options/2/";
    } else {
      return "http://127.0.0.1:8000/race-kit-options/3/";
    }
  }

  void updateIsKitA(){
    curPayment -= isKitB ? 20 : 0;
    curPayment -= isKitC ? 45 : 0;

    isKitA = true;
    isKitB = false;
    isKitC = false;
    notifyListeners();
  }

  void updateIsKitB() {
    curPayment += isKitA ? 20 : 0;
    curPayment -= isKitC ? 25 : 0;

    isKitA = false;
    isKitB = true;
    isKitC = false;
    notifyListeners();
  }

  void updateIsKitC() {
    curPayment += isKitA ? 45 : 0;
    curPayment += isKitB ? 25 : 0;

    isKitA = false;
    isKitB = false;
    isKitC = true;
    notifyListeners();
  }

  void updateDonation(value) {
    curDonation = value;
    notifyListeners();
  }

  void _getCharityInfo(url) async {
    var request = http.MultipartRequest('GET', Uri.parse('$url'));
    var response = await http.Client().send(request);
    if (response.statusCode == 200){
      var responseData = await response.stream.bytesToString();
      var jsonResponse = json.decode(responseData);
      curCharityInfo = jsonResponse;
      print (curCharityInfo['logo']);
    } else {
      print('ошибка! ${response.statusCode}: ${response.reasonPhrase}');
    }
  }
  void updateDropdownMenuValue(value){
    curCharityUrl = value;
    _getCharityInfo(value);
    notifyListeners();
  }

  void resetValues() {
    curDonation = 0;
    curCharityUrl = "";
    curCharityInfo = {};

    isFullMarathon = false;
    isHalfMarathon = false;
    isShortRange = false;

    isKitA = true;
    isKitB = false;
    isKitC = false;

    curPayment = 0;
    notifyListeners();
  }

  bool validateDropdownMenus() {
    if (curCharityUrl == "" || !(isFullMarathon || isHalfMarathon || isShortRange)){
      return false;
    }
    return true;
  }
}

class EventRegistrationScreen extends StatefulWidget {
  const EventRegistrationScreen({super.key});

  @override
  State<EventRegistrationScreen> createState() =>
      EventRegistrationScreenState();
}

class EventRegistrationScreenState extends State<EventRegistrationScreen> {

  void _getOrganisations() async {
    var request = http.MultipartRequest('GET', Uri.parse('http://127.0.0.1:8000/charities/'));
    var response = await http.Client().send(request);
    if (response.statusCode == 200){
      var responseData = await response.stream.bytesToString();
      var jsonResponse = json.decode(responseData);
      List<Map<dynamic, dynamic>> list = [];
      for (var e in jsonResponse['results']) { list.add(e); }
      PageState.charitiesList = list;
    } else {
      print('организаций не существует! ${response.reasonPhrase}');
    }
  }

  @override
  void initState() {
    super.initState();
    _getOrganisations();
  }

  @override
  Widget build(BuildContext context) {
    bool isScreenWide = MediaQuery.sizeOf(context).width >= 800;

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
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 20),
            child: FittedBox(
              fit: BoxFit.contain,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Header(text: 'Регистрация на марафон'),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 20.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: const Text(
                        'Пожалуйста, заполните всю информацию, чтобы зарегистрироваться на Skills Marathon 2023, проводимом в г. Находка, Russia. С вами свяжутся после регистрации для уточнения оплаты и другой информации.',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(height: isScreenWide ? 10 : 25),
                  const RegistrationForms(),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavigationBarWithTimer(),
    );
  }
}

class RegistrationForms extends StatefulWidget {
  const RegistrationForms({super.key});

  @override
  RegistrationFormsState createState() => RegistrationFormsState();
}

class RegistrationFormsState extends State<RegistrationForms> {
  final _formKey = GlobalKey<FormState>();
  final _donationController = TextEditingController();

  _getRunnerUrl() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? id = prefs.getString('auth_id');

    var request = http.MultipartRequest(
        'GET', Uri.parse('http://127.0.0.1:8000/user-to-runner/$id'));
    try {
      var response = await request.send();
      if (response.statusCode == 200) {
        String responseBody = await response.stream.bytesToString();
        var jsonResponse = json.decode(responseBody);
        return jsonResponse['pk'];
      } else {
        print("бан от паши. ${response.statusCode}: ${response.reasonPhrase}");
      }
    } catch (e) {
      print('ошибка!! $e');
    }
  }

  void _register(PageState pageState) async {
    int runnerId = await _getRunnerUrl();
    var usersRequest = http.MultipartRequest(
        'POST', Uri.parse('http://127.0.0.1:8000/registrations/'));
    usersRequest.fields.addAll({
      'date_time': "${DateTime.now()}",
      'cost': "${pageState.curPayment}",
      'sponsorship_target': "${pageState.curDonation}",
      'runner': "http://127.0.0.1:8000/runners/$runnerId/",
      'race_kit_option': pageState.getKitUrl(),
      'registration_status': "http://127.0.0.1:8000/registration-statuses/1/",
      'charity': pageState.curCharityUrl
    });

    try {
      var usersResponse = await usersRequest.send();
      if (usersResponse.statusCode == 201) {
        pageState.flag = true;
      } else {
        print("бан от паши. ${usersResponse.statusCode}: ${usersResponse.reasonPhrase}");
      }
    } catch (e) {
      print('ошибка!! $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    var pageState = context.watch<PageState>();
    bool isScreenWide = MediaQuery.sizeOf(context).width >= 800;

    return Form(
      key: _formKey,
      child: Center(
        child: IntrinsicWidth(
          child: Column(
            children: [
              Flex(
                direction: isScreenWide ? Axis.horizontal : Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      const Subheader(text: 'Вид марафона'),
                      const SizedBox(
                          width: 320,
                          child: MarathonTypeList()), //выбор типа марафона
                        SizedBox(height: isScreenWide ? 10 : 25),
                        const Subheader(text: 'Детали спонсорства'),
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
                                        DefaultText(text: "Взнос:"),
                                        DefaultText(text: "Сумма взноса:"),
                                      ],
                                ),
                                const SizedBox(width: 10,),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RegDropdownMenu(list: PageState.charitiesList,),
                                    const SizedBox(height: 5),
                                    SizedBox(
                                      width: 180,
                                      child: TextFormField(
                                        controller: _donationController,
                                        validator: (value) {
                                          if (value == null || value.isEmpty || double.tryParse(value) == null) {
                                            return 'Неверный ввод';
                                          }
                                          return null;
                                          },
                                        decoration: const InputDecoration(
                                            hintText: "\$413",
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
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    pageState.curCharityUrl != ""  ?
                                      const SponsorInfo() : const SizedBox(width: 40, height: 40),
                                    const SizedBox(height: 32),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ), //детали спонсорства
                    ],
                  ),
                  SizedBox(
                    width: isScreenWide ? 15 : 20,
                  ),
                  Column(
                    children: [
                      SizedBox(height: isScreenWide ? 0 : 25),
                      const Subheader(text: "Варианты комплектов"),
                      const SizedBox(width: 350, child: KitTypeList()),
                      SizedBox(height: isScreenWide ? 15 : 25),
                      const Subheader(text: "Регистрационный взнос"),
                      Text(
                        "\$${pageState.curPayment}",
                        style: const TextStyle(
                            fontSize: 55,
                            color: Color.fromRGBO(153, 153, 153, 1)),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(height: isScreenWide ? 5 : 25),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: isScreenWide ? 100.0 : 0),
                child: Row(
                    mainAxisAlignment: isScreenWide
                        ? MainAxisAlignment.start
                        : MainAxisAlignment.center,
                    children: [
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor:
                              const Color.fromRGBO(242, 242, 242, 1),
                          side: const BorderSide(
                              width: 1.0,
                              color: Color.fromRGBO(150, 150, 150, 1)),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate() && pageState.validateDropdownMenus()) {
                            print("hi");
                            _register(pageState);
                            print("hey!");
                            Navigator.pushNamed(context, '/reg_confirm');
                          } else {print("как-то невалидно");}
                        },
                        child: const DefaultText(text: 'Регистрация'),
                      ), //кнопка регистрации
                      const SizedBox(width: 10),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor:
                              const Color.fromRGBO(242, 242, 242, 1),
                          side: const BorderSide(
                              width: 1.0,
                              color: Color.fromRGBO(150, 150, 150, 1)),
                        ),
                        onPressed: () {
                          _formKey.currentState!.reset();
                          _donationController.text = "";
                          pageState.resetValues();
                        },
                        child: const DefaultText(text: 'Отмена'),
                      ), //кнопка отмены
                    ]),
              ), //кнопки
            ],
          ),
        ),
      ),
    );
  }
}

class RegDropdownMenu extends StatelessWidget {
  static const List<Map<dynamic, dynamic>> defaultList = [];
  final List<Map<dynamic, dynamic>> list;

  const RegDropdownMenu({
    super.key,
    this.list = defaultList,
  });

  @override
  Widget build(BuildContext context) {
    var pageState = context.watch<PageState>();
    final curList = list;

    return DropdownMenu<String>(
      width: 180,
      textStyle: const TextStyle(fontSize: 16),
      inputDecorationTheme: InputDecorationTheme(
        constraints: const BoxConstraints.expand(height: 30),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(
              width: 1.0, color: Color.fromRGBO(150, 150, 150, 1)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(
              width: 1.0, color: Color.fromRGBO(150, 150, 150, 1)),
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
      ),
      initialSelection: null,
      onSelected: (String? value) {
        pageState.updateDropdownMenuValue(value);
      },
      dropdownMenuEntries: curList.map<DropdownMenuEntry<String>>((Map<dynamic, dynamic> map) {
        return DropdownMenuEntry<String>(
          value: map['url'],
          label: map['name'],
          style: const ButtonStyle(
              textStyle: MaterialStatePropertyAll(TextStyle(fontSize: 16))),
        );
      }).toList(),
    );
  }
}

class KitTypeList extends StatelessWidget {
  const KitTypeList({super.key});

  @override
  Widget build(BuildContext context) {
    var pageState = context.watch<PageState>();

    return Column(
      children: <Widget>[
        CheckboxListTile(
          activeColor: const Color.fromRGBO(82, 82, 82, 1),
          controlAffinity: ListTileControlAffinity.leading,
          dense: true,
          value: pageState.isKitA,
          onChanged: (bool? value) {
            pageState.updateIsKitA();
          },
          title: RichText(
            text: const TextSpan(
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
              children: <TextSpan>[
                TextSpan(
                    text: 'Вариант A (\$0): ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: 'Номер бегуна + RFID браслет.'),
              ],
            ),
          ),
        ),
        CheckboxListTile(
          activeColor: const Color.fromRGBO(82, 82, 82, 1),
          controlAffinity: ListTileControlAffinity.leading,
          dense: true,
          value: pageState.isKitB,
          onChanged: (bool? value) {
            pageState.updateIsKitB();
          },
          title: RichText(
            text: const TextSpan(
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
              children: <TextSpan>[
                TextSpan(
                    text: 'Вариант B (\$20): ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: 'Вариант A + бейсболка + бутылка воды.'),
              ],
            ),
          ),
        ),
        CheckboxListTile(
          activeColor: const Color.fromRGBO(82, 82, 82, 1),
          controlAffinity: ListTileControlAffinity.leading,
          dense: true,
          value: pageState.isKitC,
          onChanged: (bool? value) {
            pageState.updateIsKitC();
          },
          title: RichText(
            text: const TextSpan(
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
              children: <TextSpan>[
                TextSpan(
                    text: 'Вариант C (\$45): ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: 'Вариант B + футболка + сувенирный буклет.'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class MarathonTypeList extends StatelessWidget {
  const MarathonTypeList({super.key});

  @override
  Widget build(BuildContext context) {
    var pageState = context.watch<PageState>();

    return Column(
      children: <Widget>[
        CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading,
          activeColor: const Color.fromRGBO(82, 82, 82, 1),
          dense: true,
          value: pageState.isFullMarathon,
          onChanged: (bool? value) {
            pageState.updateIsFullMarathon(value!);
          },
          title: const DefaultText(text: '42км Полный марафон (\$145)'),
        ),
        CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading,
          activeColor: const Color.fromRGBO(82, 82, 82, 1),
          dense: true,
          value: pageState.isHalfMarathon,
          onChanged: (bool? value) {
            pageState.updateIsHalfMarathon(value!);
          },
          title: const DefaultText(text: '21км Полумарафон (\$75)'),
        ),
        CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading,
          activeColor: const Color.fromRGBO(82, 82, 82, 1),
          dense: true,
          value: pageState.isShortRange,
          onChanged: (bool? value) {
            pageState.updateIsShortRange(value!);
          },
          title: const DefaultText(text: '5км Малая дистанция (\$20)'),
        ),
      ],
    );
  }
}

class SponsorInfo extends StatelessWidget {
  const SponsorInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var pageState = context.watch<PageState>();

    return IconButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Text('${pageState.curCharityInfo['name']}',
              style: const TextStyle(fontSize: 40),
              textAlign: TextAlign.center,),
          ),
          content: Container(
            width: double.maxFinite,
            child: Center(
              child: SingleChildScrollView (
                child: Column(
                  children: [
                    ImageIcon(url: pageState.curCharityInfo['logo']),
                    const SizedBox(height: 16.0),
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(fontSize: 16.0, color: Colors.black,),
                        children: <TextSpan>[
                          TextSpan(text: '${pageState.curCharityInfo['description']}'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
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

class ImageIcon extends StatelessWidget {
  static const String defaultImageUrl = "";
  final String url;

  const ImageIcon({
    super.key,
    this.url = defaultImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final imageUrl = url;

    return Column(
        children: [
          imageUrl != ""
          ? Image.network(imageUrl, height: 100,)
          : Container(
            height: 160,
            width: 130,
            decoration: BoxDecoration(
                color: const Color.fromRGBO(204, 204, 204, 1),
                border: Border.all(width: 1, color: const Color.fromRGBO(150, 150, 150, 1),),
                borderRadius: const BorderRadius.all(Radius.elliptical(90, 100)),
            ),
            child: const Center(
              child: Text('Логотип организации', textAlign: TextAlign.center),
            ),
          ),
        ],
    );
  }
}
