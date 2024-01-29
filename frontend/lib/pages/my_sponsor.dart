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
    {'id': 1, 'name': 'Фонд кошек', 'sum': '\$50'},
    {'id': 2, 'name': 'Фонд собак', 'sum': '\$120'},
    {'id': 3, 'name': 'Фонд линейной алгебры', 'sum': '\$30'},
    {'id': 4, 'name': 'Фонд Андрея Андреевича Сущенко', 'sum': '\$300'},
  ];

  @override
  Widget build(BuildContext context) {
    bool isScreenWide = MediaQuery.sizeOf(context).width >= 1000;
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
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 20),
              child: FittedBox(
                fit: BoxFit.contain,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.only(bottom: 40, top: 10),
                      child: Text('Мои спонсоры', style: TextStyle(fontSize: 30,color: Color.fromARGB(255, 92, 92, 92)),),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: const Padding(
                        padding: EdgeInsets.only(bottom: 40),
                        child: Text('Здесь показаны все ваши спонсоры в Marathon Skills 2023',
                          style: TextStyle(fontSize: 23,color: Color.fromARGB(255, 59, 59, 59)),
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
                          const Text('Наименование', style: TextStyle(fontSize: 25,color: Color.fromARGB(255, 124, 124, 124))),
                          const Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child:
                              Text('благотворительной организации', style: TextStyle(fontSize: 25,color: Color.fromARGB(255, 124, 124, 124))),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Color.fromARGB(255, 206, 157, 59), width: 1.5),
                              borderRadius: BorderRadius.all(Radius.circular(100))),
                              width: 170,
                              height: 170,
                            child:ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100))
                                ),
                                backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 255, 200, 91)),
                                padding: MaterialStateProperty.all(EdgeInsets.all(10))
                              ),
                                onPressed: () {Null;},
                                child: const Text('Logo', style: TextStyle(fontSize: 25,color: Color.fromARGB(255, 145, 108, 35)))
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 30, right: 30, left: 55),
                            child: SizedBox(width: 450, height: 100, child: Text('Это было бы длинным описанием благотворительности. Это могло пойти для нескольких параграфов.', style: TextStyle(fontSize: 22,color: Color.fromARGB(255, 87, 87, 87)),textAlign: TextAlign.left))
                          ),
                          const Padding(
                            padding: EdgeInsets.only(right: 30, left: 55),
                            child: SizedBox(width: 450, height: 50, child: Text('Это - больше описания здесь, и это - еще часть описания также.', style: TextStyle(fontSize: 22,color: Color.fromARGB(255, 87, 87, 87)),textAlign: TextAlign.left))
                          )
                        ]
                        ),
                        const SizedBox(width: 20, height: 50),
                        Column(
                          children: <Widget>[
                            SponsorsTable(sponsors: _sponsors),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Color.fromARGB(255, 109, 109, 109), width: 1.5)),
                                width: 350,
                                height: 1,
                            ),
                            const Padding(
                                padding: EdgeInsets.only(top: 20, left: 210),
                                child: Text('Всего: \$680', style: TextStyle(fontSize: 25,color: Color.fromARGB(255, 87, 87, 87)))
                            ),
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
            0: FixedColumnWidth(200),
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