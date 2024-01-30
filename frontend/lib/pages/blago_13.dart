import 'package:flutter/material.dart';

void main() {
  runApp(Blago_13());
}

class Charity {
  final String name;
  final String logo;
  final String information;

  Charity({required this.name, required this.logo, required this.information});
}

class Blago_13 extends StatefulWidget {
  const Blago_13({super.key});

  @override
  State<Blago_13> createState() => _Blago_13();
}

class _Blago_13 extends State<Blago_13> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: MyWidget(),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  final List<Charity> charities = [
    Charity(
      name: 'Свет в Темноте',
      logo: 'assets/charity_logos/arise-logo.png',
      information:
          'Организация, посвященная предоставлению света в жизни тех, кто находится в темноте бедности. Мы поддерживаем образовательные программы и обеспечиваем средства для тех, кто мечтает о лучшем будущем.',
    ),
    Charity(
      name: 'Сердце к Сердцу',
      logo: 'assets/charity_logos/aves-do-brazil-logo.png',
      information:
          'Мы стремимся создать дружелюбное и поддерживающее сообщество для тех, кто сталкивается с трудностями в жизни. Наша организация предоставляет эмоциональную поддержку и ресурсы для того, чтобы каждое сердце чувствовало тепло и заботу.',
    ),
    Charity(
      name: 'Зеленые Надежды',
      logo: 'assets/charity_logos/clara-santos-oliveira-institute-logo.png',
      information:
          'Мы заботимся о нашей планете и будущем. Наша организация фокусируется на устойчивом развитии, посаженных деревьях, и образовании об экологии. Присоединяйтесь к нам в создании зеленого и устойчивого завтра.',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 87, 87, 87),
        automaticallyImplyLeading: false,
        title: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 40),
              child: SizedBox(
                width: 90,
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
                      Navigator.pushNamed(context, '/info');
                    },
                    child: const Text('Назад',
                        style: TextStyle(fontSize: 20, color: Colors.black))),
              ),
            ),
            const Text(
              'MARATHON SKILLS 2023',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Colors.white),
            ),
            Expanded(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 40),
                      child: SizedBox(
                        width: 100,
                        height: 35,
                      ),
                    )
                  ]),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: Text(
                    'Список благотварительных организаций',
                    style: TextStyle(
                        fontSize: 30, color: Color.fromARGB(255, 87, 87, 87)),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 40.0),
                          child: Text(
                            'Это - список всех благотворительных учреждений, которые поддерживаются в Marathon Skills 2016. Спасибо за помощь! Вы поддерживаете их, спонсируя бегунов!',
                            style: TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(255, 87, 87, 87)),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.1),
                          itemCount: charities.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              contentPadding: EdgeInsets.all(10.0),
                              leading: SizedBox(
                                width: 200.0, // задайте нужную ширину
                                height: 200.0, // задайте нужную высоту
                                child: Image.network(
                                  charities[index].logo,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              title: Padding(
                                padding: EdgeInsets.only(bottom: 10.0),
                                child: Text(
                                  charities[index].name,
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: Color.fromARGB(255, 87, 87, 87),
                                      fontWeight: FontWeight.bold),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              subtitle: Padding(
                                padding: EdgeInsets.only(right: 40.0),
                                child: Text(
                                  charities[index].information,
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Color.fromARGB(255, 87, 87, 87)),
                                  maxLines: 4,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                )
              ]),
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
