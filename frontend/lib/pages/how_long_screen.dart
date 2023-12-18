import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
                  Navigator.pushNamed(context, '/home');
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
    bottomNavigationBar: Container(
      padding: EdgeInsets.all(12),
      height: 50.0,
      color: Color.fromARGB(255, 87, 87, 87),
      child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('18 дней, 8 часов и 17 минут до старта марафона!', style: TextStyle(fontSize: 18,color: Colors.white),)
            ],
    ),
    ),
  );
}

class Context1 extends StatefulWidget {
  const Context1({super.key});

  @override
  State<Context1> createState() => _Context1();
}

class _Context1 extends State<Context1> {
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
                    Text('Имя выбранного пункта', style: TextStyle(fontSize: 30,color: Color.fromARGB(255, 87, 87, 87)),textAlign: TextAlign.center,),
                    Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 233, 233, 233),
                      border: Border.all(color: Color.fromARGB(255, 87, 87, 87), width: 1.5)),
                      width: 400,
                      height: 250,
                      child:Align(
                        alignment: Alignment.center,
                        child: Text('Выбранное photo', style: TextStyle(fontSize: 30,color: Color.fromARGB(255, 87, 87, 87))),
                      )
                    ),
                    Text('Информация о скорости выбранного пункта и сколько времени это взяло бы, чтобы закончить марафон.', style: TextStyle(fontSize: 22,color: Color.fromARGB(255, 87, 87, 87)),textAlign: TextAlign.center)
                    
                  ],
                )
              )
            )
          );
        }
      )
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
                              backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 233, 233, 233)),
                              padding: MaterialStateProperty.all(EdgeInsets.all(5))
                            ),
                              onPressed: () {},
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
                              backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 233, 233, 233)),
                              padding: MaterialStateProperty.all(EdgeInsets.all(5))
                            ),
                              onPressed: () {},
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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 233, 233, 233),
                                    border: Border.all(color: Color.fromARGB(255, 198, 198, 198), width: 1.5)),
                                    width: 120,
                                    height: 80,
                                    child:Align(
                                      alignment: Alignment.center,
                                      child: Text('Photo 1', style: TextStyle(fontSize: 20,color: Color.fromARGB(255, 87, 87, 87)), textAlign: TextAlign.center,),
                                    )
                                ),
                                Text('Название 1', style: TextStyle(fontSize: 22,color: Color.fromARGB(255, 87, 87, 87)), textAlign: TextAlign.center,),
                                SizedBox(
                                  width: 100,
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 233, 233, 233),
                                    border: Border.all(color: Color.fromARGB(255, 198, 198, 198), width: 1.5)),
                                    width: 120,
                                    height: 80,
                                    child:Align(
                                      alignment: Alignment.center,
                                      child: Text('Photo 2', style: TextStyle(fontSize: 20,color: Color.fromARGB(255, 87, 87, 87)), textAlign: TextAlign.center,),
                                    )
                                ),
                                Text('Название 2', style: TextStyle(fontSize: 22,color: Color.fromARGB(255, 87, 87, 87)), textAlign: TextAlign.center,),
                                SizedBox(
                                  width: 100,
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 233, 233, 233),
                                    border: Border.all(color: Color.fromARGB(255, 198, 198, 198), width: 1.5)),
                                    width: 120,
                                    height: 80,
                                    child:Align(
                                      alignment: Alignment.center,
                                      child: Text('Photo 3', style: TextStyle(fontSize: 20,color: Color.fromARGB(255, 87, 87, 87)), textAlign: TextAlign.center,),
                                    )
                                ),
                                Text('Название 3', style: TextStyle(fontSize: 22,color: Color.fromARGB(255, 87, 87, 87)), textAlign: TextAlign.center,),
                                SizedBox(
                                  width: 100,
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 233, 233, 233),
                                    border: Border.all(color: Color.fromARGB(255, 198, 198, 198), width: 1.5)),
                                    width: 120,
                                    height: 80,
                                    child:Align(
                                      alignment: Alignment.center,
                                      child: Text('Photo 4', style: TextStyle(fontSize: 20,color: Color.fromARGB(255, 87, 87, 87)), textAlign: TextAlign.center,),
                                    )
                                ),
                                Text('Название 4', style: TextStyle(fontSize: 22,color: Color.fromARGB(255, 87, 87, 87)), textAlign: TextAlign.center,),
                                SizedBox(
                                  width: 100,
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 233, 233, 233),
                                    border: Border.all(color: Color.fromARGB(255, 198, 198, 198), width: 1.5)),
                                    width: 120,
                                    height: 80,
                                    child:Align(
                                      alignment: Alignment.center,
                                      child: Text('Photo 5', style: TextStyle(fontSize: 20,color: Color.fromARGB(255, 87, 87, 87)), textAlign: TextAlign.center,),
                                    )
                                ),
                                Text('Название 5', style: TextStyle(fontSize: 22,color: Color.fromARGB(255, 87, 87, 87)), textAlign: TextAlign.center,),
                                SizedBox(
                                  width: 100,
                                )
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