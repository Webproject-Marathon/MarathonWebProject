import 'package:flutter/material.dart';
import 'package:marathon/components/bottom_navigation_bar_with_timer.dart';


class MySponsorScreen extends StatefulWidget {
  const MySponsorScreen({super.key});

  @override
  State<MySponsorScreen> createState() => _MySponsorScreen();
}

class _MySponsorScreen extends State<MySponsorScreen> {
  final List<Map> _sponsors = [
    {'id': 0, 'name': 'Спонсор', 'sum': 'Взнос'},
    {'id': 1, 'name': 'Фонд "Свет в Темноте"', 'sum': '\$50'},
    {'id': 2, 'name': 'Фонд "Сердце к Сердцу"', 'sum': '\$120'},
    {'id': 3, 'name': 'Фонд "Зеленые Надежды"', 'sum': '\$30'},
    {'id': 4, 'name': 'Фонд "Вместе Вперёд"', 'sum': '\$300'},
  ];

  @override
  Widget build(BuildContext context) {
    bool isScreenWide = MediaQuery.of(context).size.width >= 1000;
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
                  'Logout',
                  style: TextStyle(color: Colors.black, fontSize: 18)
              ),
            ),
          ),
        ],
        backgroundColor: const Color.fromRGBO(82, 82, 82, 1),
      ),
      body: Center(
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 20, right: 20),
              child: FittedBox(
                fit: BoxFit.contain,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.only(bottom: 20, top: 10),
                      child: Text('Мои спонсоры', style: TextStyle(fontSize: 30,color: Color.fromARGB(255, 87, 87, 87)),),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: const Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: Text('Здесь показаны все ваши спонсоры в Marathon Skills 2023',
                          style: TextStyle(fontSize: 23,color: Color.fromARGB(255, 87, 87, 87)),
                          textAlign: TextAlign.center,),
                      ),
                    ),
                    Flex(
                      direction: isScreenWide ? Axis.horizontal : Axis.vertical,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text('"Зеленые Надежды"', style: TextStyle(fontSize: 25,color: Color.fromARGB(255, 87, 87, 87))),
                          SizedBox(height: 20,),
                          SizedBox(
                            width: 200, 
                            height: 160, 
                            child: Image.asset(
                              'charity_logos/arise-logo.png', // замените на путь к вашему изображению
                              fit: BoxFit.fill, 
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 30, right: 30, left: 55),
                            child: SizedBox(width: 450, height: 220, child: Text('Фонд "Сердце к Сердцу" — это инициатива, сосредоточенная на оказании заботы и поддержки тем, кто нуждается. В рамках фонда создается теплое и дружное сообщество, направленное на поддержку гуманитарных инициатив и оказание помощи людям, проходящим через трудности.', style: TextStyle(fontSize: 22,color: Color.fromARGB(255, 87, 87, 87)),textAlign: TextAlign.left))
                          ),
                        ]
                        ),
                        const SizedBox(width: 20, height: 50),
                        Column(
                          children: <Widget>[
                            SponsorsTable(sponsors: _sponsors),
                             Padding(
                              padding: EdgeInsets.only(right: 80),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Color.fromARGB(255, 87, 87, 87), width: 1.5)),
                                  width: 420,
                                  height: 1,
                              ),
                            ),
                            const Padding(
                                padding: EdgeInsets.only(top: 20, left: 210),
                                child: Text('Всего: \$680', style: TextStyle(fontSize: 25,color: Color.fromARGB(255, 87, 87, 87)))
                            ),
                            SizedBox(height: 190,)
                          ]
                        ),
                      ]
                    )
                  ]

                ),
              ),
            ),
          ),
      ),
      bottomNavigationBar: const BottomNavigationBarWithTimer(),
    );
  }
}

class SponsorsTable extends StatelessWidget {
  const SponsorsTable({
    super.key,
    required List<Map> sponsors,
  }) : _sponsors = sponsors;

  final List<Map> _sponsors;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(25),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Table(
          columnWidths: const {
            0: FixedColumnWidth(350),
            1: FixedColumnWidth(150),
          },
          children: _sponsors.map((sponsor) {
            return TableRow(children: [
              TableCell(
                child: _sponsors.indexOf(sponsor) == 0
                    ? Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: Text(sponsor['name'].toString(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Color.fromARGB(255, 109, 109, 109))),
                    )
                    : Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(sponsor['name'].toString(), style: const TextStyle(fontSize: 25, color: Color.fromARGB(255, 109, 109, 109))),
                    ),
              ),
              TableCell(
                child: _sponsors.indexOf(sponsor) == 0
                    ? Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: Text(sponsor['sum'], style: const TextStyle(fontSize: 25, color: Color.fromARGB(255, 109, 109, 109), fontWeight: FontWeight.bold)),
                    )
                    : Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(sponsor['sum'], style: const TextStyle(fontSize: 25, color: Color.fromARGB(255, 109, 109, 109))),
                    ),
              ),
            ]);
          }).toList(),
        ),
      ),
    );
  }
}
