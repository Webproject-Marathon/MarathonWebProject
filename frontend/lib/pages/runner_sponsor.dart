import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:marathon/components/bottom_navigation_bar_with_timer.dart';


class RunnerSponsorScreen extends StatelessWidget {
  const RunnerSponsorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PageState(),
      child: const HomePage(),
    );
  }
}

class PageState extends ChangeNotifier {}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 87, 87, 87),
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: 80,
                  height: 35,
                  child: ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 215, 215, 215)),
                        padding: MaterialStateProperty.all(EdgeInsets.all(5)),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/home');
                      },
                      child: const Text('Назад',
                          style: TextStyle(fontSize: 20, color: Colors.black))),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: Text(
                    'MARATHON SKILLS 2023',
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 30,
                        color: Colors.white),
                  ))
            ],
          ),
        ),
        body: SafeArea(
            child: Center(
                child: MediaQuery.of(context).size.width <= 1000
                    ? ListView(children: [
                        Column(children: [
                          Container(
                              width: MediaQuery.of(context).size.width,
                              height: 230,
                              child: PageText()),
                          Container(
                              width: MediaQuery.of(context).size.width,
                              height: 390,
                              child: SponsorInfo()),
                          Container(
                              width: MediaQuery.of(context).size.width,
                              height: 390,
                              child: Charity())
                        ])
                      ])
                    : ListView(children: [
                        Column(children: [
                          Container(
                              width: MediaQuery.of(context).size.width,
                              height: 230,
                              child: PageText()),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  height: 390,
                                  child: SponsorInfo()),
                              Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  height: 390,
                                  child: Charity()),
                            ],
                          )
                        ])
                      ]))),
        bottomNavigationBar: const BottomNavigationBarWithTimer(),
      );
}

class SponsorInfo extends StatefulWidget {
  const SponsorInfo({super.key});

  @override
  State<SponsorInfo> createState() => _SponsorInfo();
}

class _SponsorInfo extends State<SponsorInfo> {
  @override
  Widget build(context) =>
      Scaffold(body: LayoutBuilder(builder: (context, constraints) {
        return AnimatedContainer(
            duration: Duration(milliseconds: 500),
            color: Color.fromARGB(255, 255, 255, 255),
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 25.0),
                constraints: BoxConstraints(
                  maxWidth: 500,
                  maxHeight: 390,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Информация о Спонсоре',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 28,
                              color: Color.fromARGB(255, 136, 136, 136))),
                      SizedBox(height: 10),
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                        const Padding(
                            padding: EdgeInsets.only(right: 20),
                            child: Text('Ваше имя:',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 87, 87, 87)))),
                        SizedBox(
                            width: 250,
                            height: 35,
                            child: TextFormField(
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintText: 'Ваше ФИО'),
                                validator: (value) {}))
                      ]),
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                        const Padding(
                            padding: EdgeInsets.only(right: 20),
                            child: Text('Бегун:',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 87, 87, 87)))),
                        SizedBox(
                            width: 250,
                            height: 35,
                            child: TextFormField(
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: 'Иван Иванов 204',
                                ),
                                validator: (value) {}))
                      ]),
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                        const Padding(
                            padding: EdgeInsets.only(right: 20),
                            child: Text('Карта:',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 87, 87, 87)))),
                        SizedBox(
                            width: 250,
                            height: 35,
                            child: TextFormField(
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintText: 'Владелец карты'),
                                validator: (value) {}))
                      ]),
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                        const Padding(
                            padding: EdgeInsets.only(right: 20),
                            child: Text('Номер карты:',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 87, 87, 87)))),
                        SizedBox(
                            width: 250,
                            height: 35,
                            child: TextFormField(
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintText: '1234 1234 1234 1234'),
                                validator: (value) {}))
                      ]),
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                        const Padding(
                            padding: EdgeInsets.only(right: 20),
                            child: Text('Срок действия:',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 87, 87, 87)))),
                        SizedBox(
                            width: 100,
                            height: 35,
                            child: TextFormField(
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintText: '01'),
                                validator: (value) {})),
                        SizedBox(width: 10),
                        SizedBox(
                            width: 140,
                            height: 35,
                            child: TextFormField(
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintText: '2025'),
                                validator: (value) {}))
                      ]),
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                        const Padding(
                            padding: EdgeInsets.only(right: 20),
                            child: Text('CVC:',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 87, 87, 87)))),
                        SizedBox(
                            width: 250,
                            height: 35,
                            child: TextFormField(
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintText: '123'),
                                validator: (value) {}))
                      ]),
                    ]),
              ),
            ));
      }));
}

class Charity extends StatefulWidget {
  const Charity({super.key});

  @override
  State<Charity> createState() => _Charity();
}

class _Charity extends State<Charity> {
  final TextEditingController _controller = TextEditingController();
  int _donationAmount = 50; // Default donation amount

  void _increaseDonation() {
    setState(() {
      _donationAmount += 10;
      _controller.text = '$_donationAmount'; // Increase by 10 for each click
    });
  }

  void _decreaseDonation() {
    setState(() {
      if (_donationAmount - 10 >= 10) {
        // Check if reducing by 10 results in a value less than minimum donation
        _donationAmount -= 10;
      } else {
        _donationAmount = 10; // Set to minimum donation if it would go below
      }
      _controller.text = '$_donationAmount';
    });
  }

  void _updateDonationFromInput(String input) {
    final int? enteredAmount = int.tryParse(input);
    // Ensure amount is not less than or equal to 0
    if (enteredAmount != null && enteredAmount > 0) {
      setState(() {
        _donationAmount = enteredAmount; // Set the valid amount
        _controller.text =
            '$_donationAmount'; // Update the text in the controller
      });
    } else {
      setState(() {
        _donationAmount = 0; // Set to 0 if the input is invalid
        _controller.text = ''; // Clear the text
      });
    }
  }

  @override
  void initState() {
    super.initState();
    // Ensure the initial value of the text field reflects the starting donation amount
    _controller.text = '$_donationAmount';
  }

  @override
  Widget build(context) =>
      Scaffold(body: LayoutBuilder(builder: (context, constraints) {
        return AnimatedContainer(
            duration: Duration(milliseconds: 500),
            color: Color.fromARGB(255, 255, 255, 255),
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 25.0),
                constraints: BoxConstraints(
                  maxWidth: 500,
                  maxHeight: 390,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Благотворительность',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 28,
                              color: Color.fromARGB(255, 136, 136, 136))),
                      SizedBox(height: 10),
                      Text('Фонд Кошек',
                          style: TextStyle(
                              fontSize: 23,
                              color: Color.fromARGB(255, 43, 43, 43))),
                      Text('Сумма пожертвования',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 26,
                              color: Color.fromARGB(255, 136, 136, 136))),
                      Text('\$$_donationAmount',
                          style: TextStyle(
                              fontSize: 60,
                              color: Color.fromARGB(255, 136, 136, 136))),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 50,
                              height: 35,
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                    backgroundColor: MaterialStateProperty.all(
                                        Color.fromARGB(255, 222, 222, 222)),
                                    padding: MaterialStateProperty.all(
                                        EdgeInsets.all(5)),
                                  ),
                                  onPressed: _decreaseDonation,
                                  child: Text('-',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 30,
                                          color: Colors.black))),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 10), // Добавлен отступ снизу
                              child: SizedBox(
                                width: 150,
                                height: 35,
                                child: TextFormField(
                                  controller: _controller,
                                  textAlign:
                                      TextAlign.center, // Текст по центру
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    fillColor: Colors.white,
                                    filled: true,
                                  ),
                                  keyboardType: TextInputType
                                      .number, // Use number input type for numeric keyboard
                                  onChanged: _updateDonationFromInput,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 50,
                              height: 35,
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                    backgroundColor: MaterialStateProperty.all(
                                        Color.fromARGB(255, 222, 222, 222)),
                                    padding: MaterialStateProperty.all(
                                        EdgeInsets.all(5)),
                                  ),
                                  onPressed: _increaseDonation,
                                  child: Text('+',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.black))),
                            ),
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                                padding: EdgeInsets.only(right: 20, top: 20),
                                child: SizedBox(
                                  width: 120,
                                  height: 35,
                                  child: ElevatedButton(
                                      style: ButtonStyle(
                                        shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                        ),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Color.fromARGB(
                                                    255, 222, 222, 222)),
                                        padding: MaterialStateProperty.all(
                                            EdgeInsets.all(5)),
                                      ),
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, '/sponsor_confirm');
                                      },
                                      child: Text('Заплатить',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black))),
                                )),
                            Padding(
                                padding: EdgeInsets.only(top: 20),
                                child: SizedBox(
                                  width: 120,
                                  height: 35,
                                  child: ElevatedButton(
                                      style: ButtonStyle(
                                        shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                        ),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Color.fromARGB(
                                                    255, 222, 222, 222)),
                                        padding: MaterialStateProperty.all(
                                            EdgeInsets.all(5)),
                                      ),
                                      onPressed: () {},
                                      child: Text('Отмена',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black))),
                                ))
                          ]),
                    ]),
              ),
            ));
      }));
}

class PageText extends StatefulWidget {
  const PageText({super.key});

  @override
  State<PageText> createState() => _PageText();
}

class _PageText extends State<PageText> {
  @override
  Widget build(context) =>
      Scaffold(body: LayoutBuilder(builder: (context, constraints) {
        return AnimatedContainer(
            duration: Duration(milliseconds: 500),
            color: Color.fromARGB(255, 255, 255, 255),
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 25.0),
                constraints: BoxConstraints(
                  maxWidth: 900,
                  maxHeight: 230,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Спонсор бегуна',
                        style: TextStyle(
                            fontSize: 30,
                            color: Color.fromARGB(255, 92, 92, 92)),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                          'Пожалуйста выберете бегуна, которого вы хотели бы спонсировать и сумму, которую вы хотели бы пожертвовать. Спасибо за вашу поддержку бегунов и их благотворительных учреждний.',
                          style: TextStyle(
                              fontSize: 22,
                              color: Color.fromARGB(255, 80, 80, 80)),
                          textAlign: TextAlign.center)
                    ]),
              ),
            ));
      }));
}
