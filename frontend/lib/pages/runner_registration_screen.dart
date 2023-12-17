import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:string_validator/string_validator.dart';
import 'package:marathon/classes/text_presets.dart';

class RunnerRegistrationHomeScreen extends StatelessWidget {
  const RunnerRegistrationHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PageState(),
      child: const RunnerRegistrationScreen(),
    );
  }
}

class PageState extends ChangeNotifier {
  var pfpPath = "";
  var curGender = "";
  var curCountry = "";

  void updatePfp(value){
    pfpPath = value;
    notifyListeners();
  }

  void updateDropdownMenuValue(value){
    if (RegistrationFormsState.genderList.contains(value)) {
      curGender = value;
    }
    else if (RegistrationFormsState.countryList.contains(value)) {
      curCountry = value;
    }
    notifyListeners();
  }
  void updateCountry(value){
    curCountry = value;
    notifyListeners();
  }

  void resetPfp() {
    pfpPath = "";
    notifyListeners();
  }

  void resetDropdownMenus() {
    curGender = "";
    curCountry = "";
    notifyListeners();
  }

  bool validateDropdownMenus() {
    if (curGender == "" || curCountry == ""){
      return false;
    }
    return true;
  }
}


class RunnerRegistrationScreen extends StatefulWidget {
  const RunnerRegistrationScreen({super.key});

  @override
  State<RunnerRegistrationScreen> createState() => RunnerRegistrationScreenState();
}

class RunnerRegistrationScreenState extends State<RunnerRegistrationScreen> {
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
                  const Header(text: 'Регистрация бегуна',),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: const Text(
                      'Пожалуйста, заполните всю информацию, чтобы зарегистрироваться в качестве бегуна',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 8),
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

  final _emailController = TextEditingController();
  final _pwController = TextEditingController();
  final _pwRepeatController = TextEditingController();
  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();
  final _birthController = TextEditingController();

  static final genderList = ['male', 'female'];
  static final countryList = ['country1', 'country2', 'country3']; //заменить на данные бд

  @override
  Widget build(BuildContext context) {
    var pageState = context.watch<PageState>();
    bool isScreenWide = MediaQuery.sizeOf(context).width >= 900;

    return Form(
      key: _formKey,
      child: Center(
        child: Column(
          children: [
            Flex(
              direction: isScreenWide ? Axis.horizontal : Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IntrinsicHeight (
                    child: Row(
                      mainAxisSize:MainAxisSize.min,
                      children: [
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget> [
                            DefaultText (text: "Email:"),
                            DefaultText (text: "Пароль:"),
                            DefaultText (text: "Повторите пароль:"),
                            DefaultText (text: "Имя:"),
                            DefaultText (text: "Фамилия:"),
                            DefaultText (text: "Пол:"),
                          ],
                        ),
                        const SizedBox(width: 10,),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 180,
                              child: TextFormField(
                                controller: _emailController,
                                validator: (value) {
                                  if (value == null || value.isEmpty || !isEmail(value)) {
                                    return 'Неверный ввод';
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                    hintText: "Email",
                                    hintStyle: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        fontSize: 16,
                                    ),
                                    isDense: true,
                                    contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                                    border: OutlineInputBorder(),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(width: 1.0, color: Color.fromRGBO(150, 150, 150, 1)),
                                    )
                                ),
                                style: const TextStyle(fontSize: 14),
                              ),
                            ), //email
                            const SizedBox(height: 5),
                            SizedBox(
                              width: 150,
                              child: TextFormField(
                                controller: _pwController,
                                obscureText: true,
                                validator: (value) {
                                  var specialSymbols = <String>["!", "@", "#", "\$", "%", "^", ];
                                  var hasSpecialSymbols = false;
                                  for (var item in specialSymbols) {
                                    if (value!.contains(item)) hasSpecialSymbols = true;
                                  }

                                  if (value == null || value.isEmpty ||
                                      !hasSpecialSymbols || _pwController.text.length < 6 ||
                                      !value.contains(RegExp(r'[A-Z]')) || !value.contains(RegExp(r'[0-9]'))) {
                                    return 'Неверный ввод';
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                    hintText: "Пароль",
                                    hintStyle: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      fontSize: 16,
                                    ),
                                    isDense: true,
                                    contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                                    border: OutlineInputBorder(),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(width: 1.0, color: Color.fromRGBO(150, 150, 150, 1)),
                                    )
                                ),
                                style: const TextStyle(fontSize: 14),
                              ),
                            ), //password
                            const SizedBox(height: 5),
                            SizedBox(
                              width: 150,
                              child: TextFormField(
                                controller: _pwRepeatController,
                                obscureText: true,
                                validator: (value) {
                                  if (value == null || value.isEmpty ||
                                      _pwController.text != _pwRepeatController.text) {
                                    return 'Неверный ввод';
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                    hintText: "Повторите пароль",
                                    hintStyle: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      fontSize: 16,
                                    ),
                                    isDense: true,
                                    contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                                    border: OutlineInputBorder(),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(width: 1.0, color: Color.fromRGBO(150, 150, 150, 1)),
                                    )
                                ),
                                style: const TextStyle(fontSize: 14),
                              ),
                            ), //rep password
                            const SizedBox(height: 5),
                            SizedBox(
                              width: 150,
                              child: TextFormField(
                                controller: _nameController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Неверный ввод';
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                    hintText: "Имя",
                                    hintStyle: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      fontSize: 16,
                                    ),
                                    isDense: true,
                                    contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                                    border: OutlineInputBorder(),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(width: 1.0, color: Color.fromRGBO(150, 150, 150, 1)),
                                    )
                                ),
                                style: const TextStyle(fontSize: 14),
                              ),
                            ), //name
                            const SizedBox(height: 5),
                            SizedBox(
                              width: 150,
                              child: TextFormField(
                                controller: _surnameController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Неверный ввод';
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                    hintText: "Фамилия",
                                    hintStyle: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      fontSize: 16,
                                    ),
                                    isDense: true,
                                    contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                                    border: OutlineInputBorder(),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(width: 1.0, color: Color.fromRGBO(150, 150, 150, 1)),
                                    )
                                ),
                                style: const TextStyle(fontSize: 14),
                              ),
                            ), //surn
                            const SizedBox(height: 5),
                            RegDropdownMenu(list: genderList,)
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 100, height: 15),
                Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: ImageForm(),
                    ),
                    IntrinsicHeight(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisSize:MainAxisSize.min,
                          children: [
                            const Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget> [
                                DefaultText (text: "Дата рождения:"),
                                DefaultText (text: "Страна:"),
                              ],
                            ),
                            const SizedBox(width: 10,),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 150,
                                  child: TextFormField(
                                    controller: _birthController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty || !isDate(value)) {
                                        return 'Неверный ввод';
                                      }
                                      return null;
                                    },
                                    decoration: const InputDecoration(
                                        hintText: "2004-12-21",
                                        hintStyle: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          fontSize: 16,
                                        ),
                                        isDense: true,
                                        contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                                        border: OutlineInputBorder(),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(width: 1.0, color: Color.fromRGBO(150, 150, 150, 1)),
                                        )
                                    ),
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                ),
                                const SizedBox(height: 5),
                                RegDropdownMenu(list: countryList,)
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
                mainAxisSize:MainAxisSize.min,
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
                    child: const DefaultText (text: 'Регистрация'),
                  ),
                  const SizedBox(width: 10),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(242, 242, 242, 1),
                      side: const BorderSide(width: 1.0, color: Color.fromRGBO(150, 150, 150, 1)),
                    ),
                    onPressed: () {
                      _formKey.currentState!.reset();
                      _emailController.text = "";
                      _pwController.text = "";
                      _pwRepeatController.text = "";
                      _nameController.text = "";
                      _surnameController.text = "";
                      _birthController.text = "";
                      pageState.resetPfp();
                      pageState.resetDropdownMenus();
                    },
                    child: const DefaultText (text: 'Отмена',),
                  ),
                ]
            ),
          ],
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


class ImageForm extends StatefulWidget {
  const ImageForm({super.key});

  @override
  ImageFormState createState() {
    return ImageFormState();
  }
}

class ImageFormState extends State<ImageForm> {
  final _formKey = GlobalKey<FormState>();
  final _pathController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var pageState = context.watch<PageState>();

    return IntrinsicHeight(
      child: Row(
        children: [
          Column (
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text("Файл фото:",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 16, color: Colors.black),),
              const SizedBox(height: 8),
              SizedBox(
                width: 150,
                child: TextFormField(
                  controller: _pathController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Неверный ввод';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      hintText: "Photo_logo.jpg",
                      hintStyle: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 16,
                      ),
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1.0, color: Color.fromRGBO(150, 150, 150, 1)),
                      )
                  ),
                  style: const TextStyle(fontSize: 14),
                ),
              ),
            ],
          ),
          const SizedBox(width: 15),
          Column(
            children: [
              Container(
                alignment: Alignment.center,
                height: 120,
                width: 90,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(234, 234, 234, 1),
                  border: Border.all(width: 1, color: const Color.fromRGBO(82, 82, 82, 1),),),
                child: pageState.pfpPath.isNotEmpty ?
                Image.network(
                  (pageState.pfpPath),
                  fit: BoxFit.fill,
                ) : const DefaultText (text: "Фото"),

              ),
              const SizedBox(height: 8,),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(242, 242, 242, 1),
                  side: const BorderSide(width: 1.0, color: Color.fromRGBO(150, 150, 150, 1)),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    pageState.updatePfp(_pathController.text);
                  }
                },
                child: const DefaultText (text: 'Просмотр...'),
              ),
            ],
          )
        ],
      ),
    );
  }
}