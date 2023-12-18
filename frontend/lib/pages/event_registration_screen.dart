import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:marathon/classes/text_presets.dart';

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
  var curDonation = 0;
  var curPayment = 0;
  var curFond = "";

  bool isFullMarathon = false;
  bool isHalfMarathon = false;
  bool isShortRange = false;

  bool isKitA = true;
  bool isKitB = false;
  bool isKitC = false;

  void updateIsFullMarathon(value){
    isFullMarathon = value;
    curPayment += isFullMarathon ? 145 : -145;
    notifyListeners();
  }
  void updateIsHalfMarathon(value){
    isHalfMarathon = value;
    curPayment += isHalfMarathon ? 75 : -75;
    notifyListeners();
  }
  void updateIsShortRange(value){
    isShortRange = value;
    curPayment += isShortRange ? 20 : -20;
    notifyListeners();
  }

  void updateIsKitA(){
    curPayment -= isKitB ? 20 : 0;
    curPayment -= isKitC ? 45 : 0;

    isKitA = true;
    isKitB = false;
    isKitC = false;
    notifyListeners();
  }
  void updateIsKitB(){
    curPayment += isKitA ? 20 : 0;
    curPayment -= isKitC ? 25 : 0;

    isKitA = false;
    isKitB = true;
    isKitC = false;
    notifyListeners();
  }
  void updateIsKitC(){
    curPayment += isKitA ? 45 : 0;
    curPayment += isKitB ? 25 : 0;

    isKitA = false;
    isKitB = false;
    isKitC = true;
    notifyListeners();
  }

  void updateDonation(value){
    curDonation = value;
    notifyListeners();
  }
  void updateDropdownMenuValue(value){
    curFond = value;
    notifyListeners();
  }

  void resetValues() {
    curDonation = 0;
    curFond = "";

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
    if (curFond == "" || (isFullMarathon || isHalfMarathon || isShortRange)){
      return false;
    }
    return true;
  }
}


class EventRegistrationScreen extends StatefulWidget {
  const EventRegistrationScreen({super.key});

  @override
  State<EventRegistrationScreen> createState() => EventRegistrationScreenState();
}

class EventRegistrationScreenState extends State<EventRegistrationScreen> {
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
            padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 20),
            child: FittedBox(
              fit: BoxFit.contain,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Header(text: 'Регистрация на марафон'),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
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


class RegistrationForms extends StatefulWidget {
  const RegistrationForms({super.key});

  @override
  RegistrationFormsState createState() => RegistrationFormsState();
}

class RegistrationFormsState extends State<RegistrationForms> {
  final _formKey = GlobalKey<FormState>();
  final _donationController = TextEditingController();

  static final fundList = ['Фонд кошек', 'Фонд собак', 'Фонд Андрея Андреевича Сущенко']; //заменить на данные бд

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
                                    RegDropdownMenu(list: fundList,),
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
                                const Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SponsorInfo(),
                                    SizedBox(height: 32),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ), //детали спонсорства
                      ],
                    ),
                  SizedBox(width: isScreenWide ? 15 : 20,),
                  Column(
                    children: [
                      SizedBox(height: isScreenWide ? 0 : 25),
                      const Subheader(text: "Варианты комплектов"),
                      const SizedBox(
                          width: 350,
                          child: KitTypeList()),
                      SizedBox(height: isScreenWide ? 15 : 25),
                      const Subheader(text: "Регистрационный взнос"),
                      Text("\$${pageState.curPayment}",
                        style: const TextStyle(fontSize: 55, color: Color.fromRGBO(153, 153, 153, 1)),)
                    ],
                  ),
                ],
              ),
              SizedBox(height: isScreenWide ? 5 : 25),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: isScreenWide ? 100.0 : 0),
                child: Row(
                    mainAxisAlignment: isScreenWide ? MainAxisAlignment.start : MainAxisAlignment.center,
                    children: [
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(242, 242, 242, 1),
                          side: const BorderSide(width: 1.0, color: Color.fromRGBO(150, 150, 150, 1)),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate() && pageState.validateDropdownMenus()) {
                            Navigator.pushNamed(context, '/event_reg');
                            //магия какая-то
                          }
                        },
                        child: const DefaultText(text: 'Регистрация'),
                      ), //кнопка регистрации
                      const SizedBox(width: 10),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(242, 242, 242, 1),
                          side: const BorderSide(width: 1.0, color: Color.fromRGBO(150, 150, 150, 1)),
                        ),
                        onPressed: () {
                          _formKey.currentState!.reset();
                          _donationController.text = "";
                          pageState.resetValues();
                        },
                        child: const DefaultText(text: 'Отмена'),
                      ), //кнопка отмены
                    ]
                ),
              ), //кнопки
            ],
          ),
        ),
      ),
    );
  }
}


class RegDropdownMenu extends StatelessWidget {
  static const defaultList = [''];
  final List<String> list;

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
                  style: TextStyle(fontSize: 16.0, color: Colors.black,),
                  children: <TextSpan>[
                    TextSpan(text: 'Вариант A (\$0): ', style: TextStyle(fontWeight: FontWeight.bold)),
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
                  style: TextStyle(fontSize: 16.0, color: Colors.black,),
                  children: <TextSpan>[
                    TextSpan(text: 'Вариант B (\$20): ', style: TextStyle(fontWeight: FontWeight.bold)),
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
                  style: TextStyle(fontSize: 16.0, color: Colors.black,),
                  children: <TextSpan>[
                    TextSpan(text: 'Вариант C (\$45): ', style: TextStyle(fontWeight: FontWeight.bold)),
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
    return IconButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Наименование спонсора', textAlign: TextAlign.center,),
          content: Container(
            width: double.maxFinite,
            child: Center(
              child: SingleChildScrollView (
                child: Column(
                  children: [
                    const ImageIcon(),
                    const SizedBox(height: 16.0),
                    RichText(
                      text: const TextSpan(
                        style: TextStyle(fontSize: 16.0, color: Colors.black,),
                        children: <TextSpan>[
                          TextSpan(text: 'Согласно большому числу научных исследований, основные причины благотворительности состоят в том, что люди:'),
                          TextSpan(text: ' - по природе своей альтруистичны, ими движет желание помочь другим;',),
                          TextSpan(text: ' - чувствуют себя лучше, когда жертвуют деньги. Экономисты называют это «теплотой альтруизма»[4].'),
                          TextSpan(text: ' К побудительным причинам благотворительности относится осознание её участниками целостности человеческого общества, более общее — всего живого на Земле, сопричастности и соответственности за мир, в котором мы живём.'),
                          TextSpan(text: ' Осознание это открывает общественно значимые задачи разного уровня иерархии, вложение сил и средств в решение которых обещают обществу в целом (или той или иной его подсистеме — от семьи, рода, предприятия, микрорайона до города, страны и так далее) заметно большую отдачу, чем в личное самосовершенствование (от духовного, физического, профессионального до финансового), но по разным причинам не решаются здесь и сейчас при существующих обстоятельствах. Среди этих причин зачастую не столько нехватка сил и средств, сколько затянутость согласования соответствующих вопросов на верхах, нежелания иных чиновников брать на себя ответственность в обстоятельствах, требующих определённой грамотности и смелости, научные амбиции и споры разных учёных и научных школ, крайняя неторопливость и недостаточное качество законотворческой деятельности, а порой и просто недостаток сведений о тех или иных обстоятельствах или происшествиях, при которых целесообразно стороннее вмешательство.'),
                          TextSpan(text: ' Кроме указанных причин благотворительные подходы целесообразны для выполнения многих разовых, малопредсказуемых или достаточно редко производимых общественно значимых работ, например, весенних субботников, держать для быстрого выполнения которых целый год дополнительный штат уборщиков явно избыточно и накладно.'),
                          TextSpan(text: ' Другим широко известным примером является пресечение мелкого хулиганства, для чего создаются, в частности, ДНД и их разновидности от добровольных молодёжных дружин до соседского дозора: держать штат профессиональных полицейских для этих целей нецелесообразно с самых разных точек зрения (от наличия возможности навести порядок без привлечения особых средств и полномочий до избыточности финансовой нагрузки и нежелания жить в полицейском государстве).'),
                          TextSpan(text: ' Таким образом благотворительность в исходном смысле этого слова преследует цель более быстрого, гибкого и менее накладного (с точки зрения выбранного горизонта планирования) укрепления той общественной системы, в пределах которой она осуществляется.'),
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


class ImageIcon extends StatefulWidget {
  const ImageIcon({
    super.key,
    this.logoImage,
  });

  final File? logoImage;

  @override
  State<ImageIcon> createState() => _ImageIconState();
}

class _ImageIconState extends State<ImageIcon> {

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          widget.logoImage != null ?
          Image.file(widget.logoImage!, height: 100,) :
          Container(
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
