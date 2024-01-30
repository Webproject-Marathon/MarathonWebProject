import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:marathon/components/bottom_navigation_bar_with_timer.dart';


class HowLongScreen extends StatelessWidget {
  const HowLongScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PageState(),
      child: const HomePage(),
    );
  }
}

class PageState extends ChangeNotifier {
  bool isFirstButtonSelected = false;
  bool isSecondButtonSelected = false;

  String selectedItemImage1 = 'how_long_imgs/f1-car.jpg'; 
  String selectedItemImage2 = 'how_long_imgs/worm.jpg'; 
  String selectedItemImage3 = 'how_long_imgs/sloth.jpg'; 
  String selectedItemImage4 = 'how_long_imgs/slug.jpg'; 
  String selectedItemImage5 = 'how_long_imgs/jaguar.jpg';

  String selectedItemDescription1 = 'Машина F1'; 
  String selectedItemDescription2 = 'Червь'; 
  String selectedItemDescription3 = 'Ленивец'; 
  String selectedItemDescription4 = 'Капибара'; 
  String selectedItemDescription5 = 'Ягуар'; 
  String BigText = 'F1-машина, предназначенная для треков, завершит марафон 42 км в захватывающих 2 часах и нескольких минутах.';

  void selectFirstButton() {
    isFirstButtonSelected = true;
    isSecondButtonSelected = false;

    selectedItemImage1 = 'how_long_imgs/f1-car.jpg'; 
    selectedItemImage2 = 'how_long_imgs/worm.jpg'; 
    selectedItemImage3 = 'how_long_imgs/sloth.jpg'; 
    selectedItemImage4 = 'how_long_imgs/slug.jpg'; 
    selectedItemImage5 = 'how_long_imgs/jaguar.jpg'; 

    selectedItemDescription1 = 'Машина F1'; 
    selectedItemDescription2 = 'Червь'; 
    selectedItemDescription3 = 'Ленивец'; 
    selectedItemDescription4 = 'Капибара'; 
    selectedItemDescription5 = 'Ягуар'; 
    BigText = 'F1-машина, предназначенная для треков, завершит марафон 42 км в захватывающих 2 часах и нескольких минутах.';
    notifyListeners();
  }

  void selectSecondButton() {
    isFirstButtonSelected = false;
    isSecondButtonSelected = true;

    selectedItemImage1 = 'how_long_imgs/airbus-a380.jpg'; 
    selectedItemImage2 = 'how_long_imgs/pair-of-havaianas.jpg'; 
    selectedItemImage3 = 'how_long_imgs/football-field.jpg'; 
    selectedItemImage4 = 'how_long_imgs/ronaldinho.jpg'; 
    selectedItemImage5 = 'how_long_imgs/bus.jpg';

    selectedItemDescription1 = 'Самолет А380'; 
    selectedItemDescription2 = 'Гавайские сандали'; 
    selectedItemDescription3 = 'Футбольное поле'; 
    selectedItemDescription4 = 'Рональдо'; 
    selectedItemDescription5 = 'Автобус'; 
    BigText = 'Самолет A380 впечатляюще пролетит марафон 42 км за несколько секунд, демонстрируя невероятные возможности в воздушных пространствах.';
    notifyListeners();
  }
}

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
          child:
              SizedBox(
              width: 80,
              height: 35,
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 215, 215, 215)),
                  padding: MaterialStateProperty.all(EdgeInsets.all(5)),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/info');
                }, child: const Text('Назад', style: TextStyle(fontSize: 20,color: Colors.black))),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left:12, right: 12),
              child: 
                Text('MARATHON SKILLS 2023', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 25,color: Colors.white),)
            )
        ],
      ),
    ),
    body: SafeArea(
        child:Center(
          child: MediaQuery.of(context).size.width <= 950 ?
          ListView(
            children: [
              Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    child: PageText()
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 450,
                    child: Context1()
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 560,
                    child: Context2()
                  )
                ]
              )
            ]
          )
          : 
          ListView(
            children: [
              Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 80,
                    child: PageText()
                  ),
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width/2,
                        height: 450,
                        child: Context1()
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width/2,
                        height: 540,
                        child: Context2()
                      )
                    ],
                  )
                ]
              )
            ]
          )
        )
    ),
    bottomNavigationBar: const BottomNavigationBarWithTimer(),
  );
}

class Context1 extends StatefulWidget {
  const Context1({super.key});

  @override
  State<Context1> createState() => _Context1();
}

class _Context1 extends State<Context1> {
  @override
  Widget build(context) => Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            return AnimatedContainer(
              duration: Duration(milliseconds: 500),
              color: Color.fromARGB(255, 252, 252, 252),
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: 500,
                    maxHeight: 450,
                  ),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 252, 252, 252),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        context.watch<PageState>().selectedItemDescription1,
                        style: TextStyle(fontSize: 30, color: Color.fromARGB(255, 87, 87, 87)),
                        textAlign: TextAlign.center,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 233, 233, 233),
                            border: Border.all(color: Color.fromARGB(255, 87, 87, 87), width: 1.5)),
                        width: 400,
                        height: 250,
                        child: GestureDetector(
                          onTap: () {
                            print('Открыть выбранную картинку');
                          },
                          child: Align(
                            alignment: Alignment.center,
                            child: Image.asset(
                              context.watch<PageState>().selectedItemImage1,
                              width: 400,
                              height: 400,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        context.watch<PageState>().BigText,
                        style: TextStyle(fontSize: 22, color: Color.fromARGB(255, 87, 87, 87)),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      );
}

class Context2 extends StatefulWidget {
  const Context2({super.key});

  @override
  State<Context2> createState() => _Context2();
}

class _Context2 extends State<Context2> {
  @override
  Widget build(context) =>
    Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return AnimatedContainer(
            duration: Duration(milliseconds: 500),
            color: Color.fromARGB(255, 252, 252, 252),
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: 450,
                  maxHeight: 540,
                ),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 252, 252, 252),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child:
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Color.fromARGB(255, 87, 87, 87), width: 1.5)),
                          width: 160,
                          height: 40,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(00),
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all(
                                context.watch<PageState>().isFirstButtonSelected
                                    ? Colors.white
                                    : Color.fromARGB(255, 233, 233, 233),
                              ),
                              padding: MaterialStateProperty.all(EdgeInsets.all(5))
                            ),
                            onPressed: () {
                              context.read<PageState>().selectFirstButton();
                            },
                              child: const Text('Скорость', style: TextStyle(fontSize: 22,color: Color.fromARGB(255, 87, 87, 87)))),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Color.fromARGB(255, 87, 87, 87), width: 1.5)),
                          width: 160,
                          height: 40,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0),
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all(
                                context.watch<PageState>().isSecondButtonSelected
                                    ? Colors.white
                                    : Color.fromARGB(255, 233, 233, 233),
                              ),
                              padding: MaterialStateProperty.all(EdgeInsets.all(5))
                            ),
                              onPressed: () {
                                context.read<PageState>().selectSecondButton();
                              },
                              child: const Text('Дистанция', style: TextStyle(fontSize: 22,color: Color.fromARGB(255, 87, 87, 87)))),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                      border: Border.all(color: Color.fromARGB(255, 87, 87, 87), width: 1.5)),
                      width: 500,
                      height: 500,
                      child:Align(
                        alignment: Alignment.topLeft,
                        child: 
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 40
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 233, 233, 233),
                                    border: Border.all(color: Color.fromARGB(255, 87, 87, 87), width: 1.5)),
                                    width: 120,
                                    height: 80,
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: ClipRRect(
                                        child: Image.asset(
                                          context.watch<PageState>().selectedItemImage1,
                                          width: 200,
                                          height: 200,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                ),
                                SizedBox(
                                  width: 40
                                ),
                                Text(
                                  context.watch<PageState>().selectedItemDescription1,
                                  style: TextStyle(fontSize: 22, color: Color.fromARGB(255, 87, 87, 87)),
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 40
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 233, 233, 233),
                                    border: Border.all(color: Color.fromARGB(255, 87, 87, 87), width: 1.5)),
                                    width: 120,
                                    height: 80,
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: ClipRRect(
                                        child: Image.asset(
                                          context.watch<PageState>().selectedItemImage2,
                                          width: 200,
                                          height: 200,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                ),
                                SizedBox(
                                  width: 40
                                ),
                                Text(
                                  context.watch<PageState>().selectedItemDescription2,
                                  style: TextStyle(fontSize: 22, color: Color.fromARGB(255, 87, 87, 87)),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 40
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 233, 233, 233),
                                    border: Border.all(color: Color.fromARGB(255, 87, 87, 87), width: 1.5)),
                                    width: 120,
                                    height: 80,
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: ClipRRect(
                                        child: Image.asset(
                                          context.watch<PageState>().selectedItemImage3,
                                          width: 200,
                                          height: 200,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                ),
                                SizedBox(
                                  width: 40
                                ),
                                Text(
                                  context.watch<PageState>().selectedItemDescription3,
                                  style: TextStyle(fontSize: 22, color: Color.fromARGB(255, 87, 87, 87)),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 40
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 233, 233, 233),
                                    border: Border.all(color: Color.fromARGB(255, 87, 87, 87), width: 1.5)),
                                    width: 120,
                                    height: 80,
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: ClipRRect(
                                        child: Image.asset(
                                          context.watch<PageState>().selectedItemImage4,
                                          width: 200,
                                          height: 200,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                ),
                                SizedBox(
                                  width: 40
                                ),
                                Text(
                                  context.watch<PageState>().selectedItemDescription4,
                                  style: TextStyle(fontSize: 22, color: Color.fromARGB(255, 87, 87, 87)),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 40
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 233, 233, 233),
                                    border: Border.all(color: Color.fromARGB(255, 87, 87, 87), width: 1.5)),
                                    width: 120,
                                    height: 80,
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: ClipRRect(
                                        child: Image.asset(
                                          context.watch<PageState>().selectedItemImage5,
                                          width: 200,
                                          height: 200,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                ),
                                SizedBox(
                                  width: 40
                                ),
                                Text(
                                  context.watch<PageState>().selectedItemDescription5,
                                  style: TextStyle(fontSize: 22, color: Color.fromARGB(255, 87, 87, 87)),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ]
                        )
                      )                      
                    ),
                  ],
                )
              ),
            )
          );
        }
      )
   );
}

class PageText extends StatefulWidget {
  const PageText({super.key});

  @override
  State<PageText> createState() => _PageText();
}

class _PageText extends State<PageText> {
  @override
  Widget build(context) =>
    Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return AnimatedContainer(
            duration: Duration(milliseconds: 500),
            color: Color.fromARGB(255, 252, 252, 252),
            child: Align(
              alignment: Alignment.center,
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: 800,
                  maxHeight: 150,
                ),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 252, 252, 252),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: 
                Column(children: [
                  SizedBox(height: 15),
                  Text('Насколько долгий марафон?', style: TextStyle(fontSize: 30,color: Color.fromARGB(255, 92, 92, 92)),textAlign: TextAlign.center,)
                ],
                )
              )
            )
          );
        }
      )
   );
}